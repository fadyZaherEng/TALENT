import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/core/utils/validation/attachment_validator.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/attachemnet/request/insert_attachment_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_response.dart';
import 'package:talent_link/src/domain/entities/request/request_type.dart';
import 'package:talent_link/src/domain/usecase/attachmnet/attachment_validation_use_case.dart';
import 'package:talent_link/src/domain/usecase/attachmnet/get_attachment_type_list_use_case.dart';
import 'package:talent_link/src/domain/usecase/attachmnet/insert_attachment_use_case.dart';
import 'package:talent_link/src/domain/usecase/authentication/login/get_company_id_use_case.dart';
import 'package:talent_link/src/domain/usecase/authentication/login/get_employee_id_use_case.dart';
import 'package:talent_link/src/presentation/screens/attachment/utils/attachment_controller.dart';

part 'attachment_event.dart';

part 'attachment_state.dart';

class AttachmentBloc extends Bloc<AttachmentEvent, AttachmentState> {
  final AttachmentValidationUseCase _attachmentValidationUseCase;
  final GetAttachmentTypeListUseCase _attachmentTypeListUseCase;
  final InsertAttachmentUseCase _insertAttachmentUseCase;
  final GetEmployeeIdUseCase _getEmployeeIdUseCase;
  final GetCompanyIdUseCase _getCompanyIdUseCase;

  AttachmentBloc(
    this._attachmentValidationUseCase,
    this._attachmentTypeListUseCase,
    this._insertAttachmentUseCase,
    this._getEmployeeIdUseCase,
    this._getCompanyIdUseCase,
  ) : super(AttachmentInitialState()) {
    on<AttachmentBackEvent>(_onAttachmentBackEvent);
    on<OpenAttachmentTypeBottomSheetEvent>(
        _onOpenAttachmentTypeBottomSheetEvent);
    on<AttachmentValidationDocumentNumberEvent>(
        _onAttachmentValidationDocumentNumberEvent);
    on<AttachmentValidationIssueDateEvent>(
        _onAttachmentValidationIssueDateEvent);
    on<AttachmentOpenUploadFileBottomSheetEvent>(
        _onAttachmentOpenUploadFileBottomSheetEvent);
    on<AttachmentValidationFileEvent>(_onAttachmentValidationFileEvent);
    on<AttachmentSubmitEvent>(_onAttachmentSubmitEvent);
    on<AttachmentOpenCameraEvent>(_onAttachmentOpenCameraEvent);
    on<AttachmentOpenGalleryEvent>(_onAttachmentOpenGalleryEvent);
    on<AttachmentOpenFileEvent>(_onAttachmentOpenFileEvent);
    on<ValidationAttachmentTypeEvent>(_onValidationAttachmentTypeEvent);
    on<GetAttachmentTypeEvent>(_onGetAttachmentTypeEvent);
    on<AttachmentDataFillingEvent>(_onAttachmentDataFillingEvent);
    on<AttachmentSelectExpireDateEvent>(_onAttachmentSelectExpireDateEvent);
  }

  List<RequestType> _attachmentTypes = [];

  FutureOr<void> _onAttachmentBackEvent(
      AttachmentBackEvent event, Emitter<AttachmentState> emit) {
    emit(AttachmentBackState());
  }

  FutureOr<void> _onOpenAttachmentTypeBottomSheetEvent(
      OpenAttachmentTypeBottomSheetEvent event, Emitter<AttachmentState> emit) {
    emit(OpenAttachmentTypeBottomSheetState());
  }

  FutureOr<void> _onAttachmentOpenCameraEvent(
      AttachmentOpenCameraEvent event, Emitter<AttachmentState> emit) {
    emit(AttachmentOpenCameraState());
  }

  FutureOr<void> _onAttachmentOpenGalleryEvent(
      AttachmentOpenGalleryEvent event, Emitter<AttachmentState> emit) {
    emit(AttachmentOpenGalleryState());
  }

  FutureOr<void> _onAttachmentOpenFileEvent(
      AttachmentOpenFileEvent event, Emitter<AttachmentState> emit) {
    emit(AttachmentOpenFileState());
  }

  FutureOr<void> _onAttachmentValidationDocumentNumberEvent(
      AttachmentValidationDocumentNumberEvent event,
      Emitter<AttachmentState> emit) {
    AttachmentValidationState attachmentValidationState =
        _attachmentValidationUseCase.validateDocumentNo(event.value);
    if (attachmentValidationState == AttachmentValidationState.valid) {
      emit(AttachmentValidationDocumentNoValidState());
    } else {
      emit(AttachmentValidationDocumentNoNotValidState(
        validationMessage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onAttachmentValidationIssueDateEvent(
      AttachmentValidationIssueDateEvent event, Emitter<AttachmentState> emit) {
    AttachmentValidationState attachmentValidationState =
        _attachmentValidationUseCase.validateIssueDate(event.value);
    if (attachmentValidationState == AttachmentValidationState.valid) {
      emit(AttachmentValidationIssueDateValidState());
    } else {
      emit(AttachmentValidationIssueDateNotValidState(
        validationMessage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onAttachmentOpenUploadFileBottomSheetEvent(
      AttachmentOpenUploadFileBottomSheetEvent event,
      Emitter<AttachmentState> emit) {
    emit(AttachmentOpenUploadFileBottomSheetState());
  }

  FutureOr<void> _onAttachmentValidationFileEvent(
      AttachmentValidationFileEvent event, Emitter<AttachmentState> emit) {
    AttachmentValidationState attachmentValidationState =
        _attachmentValidationUseCase.validateFile(event.filePath);
    if (attachmentValidationState == AttachmentValidationState.valid) {
      emit(AttachmentValidationFileValidState(filePath: event.filePath));
    } else {
      emit(AttachmentValidationFileNotValidState(
        validationMessage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onAttachmentSubmitEvent(
      AttachmentSubmitEvent event, Emitter<AttachmentState> emit) async {
    final validationsState = _attachmentValidationUseCase.validateFormUseCase(
        attachmentController: event.attachmentController,
        issueDate: event.issueDate,
        file: event.filePath);
    if (validationsState.isNotEmpty) {
      for (var element in validationsState) {
        if (element == AttachmentValidationState.attachmentTypeEmpty) {
          emit(ValidationAttachmentTypeNotValidState(
            validationMessage: S.current.thisFieldIsRequired,
          ));
        } else if (element == AttachmentValidationState.documentNoEmpty) {
          emit(AttachmentValidationDocumentNoNotValidState(
            validationMessage: S.current.thisFieldIsRequired,
          ));
        } else if (element == AttachmentValidationState.issueDateEmpty) {
          emit(AttachmentValidationIssueDateNotValidState(
            validationMessage: S.current.thisFieldIsRequired,
          ));
        } else if (element == AttachmentValidationState.fileEmpty) {
          emit(AttachmentValidationFileNotValidState(
            validationMessage: S.current.thisFieldIsRequired,
          ));
        }
      }
    } else {
      emit(AttachmentLoadingState());
      InsertAttachmentRequest insertAttachmentRequest = InsertAttachmentRequest(
        id: 0,
        companyId: await _getCompanyIdUseCase() ?? 0,
        employeeId: await _getEmployeeIdUseCase() ?? 0,
        transactionStatusId: 1,
        transactionStatusName: "string",
        transactionStatusCode: "string",
        remarks: event.attachmentController.remarks.text,
        workFlowId: 0,
        workFlowName: "string",
        isEnabled: true,
        issueDate: event.issueDate,
        expiryDate: event.expiryDate,
        documentNo: event.attachmentController.documentNo.text,
        documentFilePath: "string",
        documentFileName: "string",
        fileSource: "string",
        attachmentTypeId: event.attachmentTypeId,
        isDeleted: false,
        attachmentTypeName: event.attachmentController.attachmentType.text,
      );
      DataState dataState = await _insertAttachmentUseCase(
          request: insertAttachmentRequest, file: File(event.filePath));
      if (dataState is DataSuccess<TalentLinkResponse>) {
        emit(AttachmentSubmitSuccessState(
            successMessage: dataState.data!.responseMessage ?? ""));
      } else {
        emit(AttachmentSubmitErrorState(
            errorMessage: dataState.error!.error.toString()));
      }
    }
  }

  FutureOr<void> _onValidationAttachmentTypeEvent(
      ValidationAttachmentTypeEvent event, Emitter<AttachmentState> emit) {
    AttachmentValidationState attachmentValidationState =
        _attachmentValidationUseCase
            .validateAttachmentType(event.attachmentType.name);
    if (attachmentValidationState == AttachmentValidationState.valid) {
      emit(ValidationAttachmentTypeValidState(
          attachmentType: event.attachmentType));
    } else {
      emit(ValidationAttachmentTypeNotValidState(
        validationMessage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onGetAttachmentTypeEvent(
      GetAttachmentTypeEvent event, Emitter<AttachmentState> emit) async {
    emit(AttachmentLoadingState());
    DataState dataState = await _attachmentTypeListUseCase();
    if (dataState is DataSuccess<List<RequestType>>) {
      _attachmentTypes = dataState.data!;
      emit(GetAttachmentTypeSuccessState(attachmentTypes: _attachmentTypes));
    } else {
      emit(GetAttachmentTypeErrorState(
          errorMessage: dataState.error!.error.toString()));
    }
  }

  FutureOr<void> _onAttachmentDataFillingEvent(
      AttachmentDataFillingEvent event, Emitter<AttachmentState> emit) {
    if (event.attachmentController.attachmentType.text != "" ||
        event.attachmentController.documentNo.text != "" ||
        event.attachmentController.remarks.text != "" ||
        event.issueDate != "" ||
        event.filePath != "" ||
        event.expireDate != "") {
      emit(AttachmentDataFillingSuccessState());
    } else {
      emit(AttachmentDataFillingErrorState());
    }
  }

  FutureOr<void> _onAttachmentSelectExpireDateEvent(
      AttachmentSelectExpireDateEvent event, Emitter<AttachmentState> emit) {
    emit(AttachmentSelectExpireDateState(value: event.value));
  }
}
