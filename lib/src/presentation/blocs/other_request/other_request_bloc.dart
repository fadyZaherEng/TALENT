import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/core/utils/validation/other_request_validator.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/other_request/request/insert_other_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_response.dart';
import 'package:talent_link/src/domain/entities/all_fields/all_fields_mandatory.dart';
import 'package:talent_link/src/domain/entities/request/request_type.dart';
import 'package:talent_link/src/domain/usecase/all_fields_mandatory/get_all_fields_mandatory_use_case.dart';
import 'package:talent_link/src/domain/usecase/authentication/login/get_company_id_use_case.dart';
import 'package:talent_link/src/domain/usecase/authentication/login/get_employee_id_use_case.dart';
import 'package:talent_link/src/domain/usecase/other_request/get_other_request_types_use_case.dart';
import 'package:talent_link/src/domain/usecase/other_request/insert_other_request_use_case.dart';
import 'package:talent_link/src/domain/usecase/other_request/other_request_validation_use_case.dart';
import 'package:talent_link/src/presentation/screens/other_request/utils/other_request_controller.dart';

part 'other_request_event.dart';

part 'other_request_state.dart';

class OtherRequestBloc extends Bloc<OtherRequestEvent, OtherRequestState> {
  final OtherRequestValidationUseCase _otherRequestValidationUseCase;
  final GetOtherRequestTypesUseCase _getOtherRequestTypesUseCase;
  final InsertOtherRequestUseCase _insertOtherRequestUseCase;
  final GetAllFieldsMandatoryUseCase _getAllFieldsMandatoryUseCase;
  final GetEmployeeIdUseCase _getEmployeeIdUseCase;
  final GetCompanyIdUseCase _getCompanyIdUseCase;

  OtherRequestBloc(
    this._otherRequestValidationUseCase,
    this._getOtherRequestTypesUseCase,
    this._insertOtherRequestUseCase,
    this._getAllFieldsMandatoryUseCase,
    this._getEmployeeIdUseCase,
    this._getCompanyIdUseCase,
  ) : super(OtherRequestInitialState()) {
    on<OtherRequestBackEvent>(_onOtherRequestBackEvent);
    on<OtherRequestOpenRequestBottomSheetEvent>(
        _onOtherRequestOpenRequestBottomSheetEvent);
    on<OtherRequestSelectRequestEvent>(_onOtherRequestSelectRequestEvent);
    on<OtherRequestOpenUploadFileBottomSheetEvent>(
        _onOtherRequestOpenUploadFileBottomSheetEvent);
    on<OtherRequestOpenCameraEvent>(_onOtherRequestOpenCameraEvent);
    on<OtherRequestOpenGalleryEvent>(_onOtherRequestOpenGalleryEvent);
    on<OtherRequestOpenFileEvent>(_onOtherRequestOpenFileEvent);
    on<OtherRequestSelectFileEvent>(_onOtherRequestSelectFileEvent);
    on<OtherRequestDeleteFileEvent>(_onOtherRequestDeleteFileEvent);
    on<OtherRequestSubmitEvent>(_onOtherRequestSubmitEvent);
    on<OtherRequestValidationRequestEvent>(
        _onOtherRequestValidationRequestEvent);
    on<OtherRequestValidationRequestDateEvent>(
        _onOtherRequestValidationRequestDateEvent);
    on<OtherRequestValidationRemarkEvent>(_onOtherRequestValidationRemarkEvent);
    on<OtherRequestValidationNotesEvent>(_onOtherRequestValidationNotesEvent);
    on<OtherRequestValidationFileEvent>(_onOtherRequestValidationFileEvent);
    on<GetOtherRequestTypesEvent>(_onGetOtherRequestTypesEvent);
    on<GetAllFieldsMandatoryEvent>(_onGetAllFieldsMandatoryEvent);
  }

  List<AllFieldsMandatory> _allFieldsMandatory = [];
  List<RequestType> _otherRequestTypes = [];

  FutureOr<void> _onOtherRequestBackEvent(
      OtherRequestBackEvent event, Emitter<OtherRequestState> emit) {
    emit(OtherRequestBackState());
  }

  FutureOr<void> _onOtherRequestOpenRequestBottomSheetEvent(
      OtherRequestOpenRequestBottomSheetEvent event,
      Emitter<OtherRequestState> emit) {
    emit(OtherRequestOpenRequestBottomSheetState());
  }

  FutureOr<void> _onOtherRequestSelectRequestEvent(
      OtherRequestSelectRequestEvent event, Emitter<OtherRequestState> emit) {
    emit(OtherRequestSelectRequestState(requestType: event.requestType));
    add(OtherRequestValidationRequestEvent(value: event.requestType.name));
  }

  FutureOr<void> _onOtherRequestOpenUploadFileBottomSheetEvent(
      OtherRequestOpenUploadFileBottomSheetEvent event,
      Emitter<OtherRequestState> emit) {
    emit(OtherRequestOpenUploadFileBottomSheetState(
        isMandatory: event.isMandatory));
  }

  FutureOr<void> _onOtherRequestOpenCameraEvent(
      OtherRequestOpenCameraEvent event, Emitter<OtherRequestState> emit) {
    emit(OtherRequestOpenCameraState(isMandatory: event.isMandatory));
  }

  FutureOr<void> _onOtherRequestOpenGalleryEvent(
      OtherRequestOpenGalleryEvent event, Emitter<OtherRequestState> emit) {
    emit(OtherRequestOpenGalleryState(isMandatory: event.isMandatory));
  }

  FutureOr<void> _onOtherRequestOpenFileEvent(
      OtherRequestOpenFileEvent event, Emitter<OtherRequestState> emit) {
    emit(OtherRequestOpenFileState(isMandatory: event.isMandatory));
  }

  FutureOr<void> _onOtherRequestSelectFileEvent(
      OtherRequestSelectFileEvent event, Emitter<OtherRequestState> emit) {
    emit(OtherRequestSelectFileState(filePath: event.filePath));
    add(OtherRequestValidationFileEvent(
        value: event.filePath, isMandatory: event.isMandatory));
  }

  FutureOr<void> _onOtherRequestDeleteFileEvent(
      OtherRequestDeleteFileEvent event, Emitter<OtherRequestState> emit) {
    emit(OtherRequestDeleteFileState(filePath: ''));
    add(OtherRequestValidationFileEvent(
        value: '', isMandatory: event.isMandatory));
  }

  FutureOr<void> _onOtherRequestSubmitEvent(
      OtherRequestSubmitEvent event, Emitter<OtherRequestState> emit) async {
    final validationsState = _otherRequestValidationUseCase.validateFormUseCase(
        file: event.file,
        allFieldsMandatory: event.allFieldsMandatory,
        requestedDate: event.requestedDate,
        otherRequestController: event.otherRequestController);

    if (validationsState.isNotEmpty) {
      for (var element in validationsState) {
        if (element == OtherRequestValidationState.requestEmpty) {
          emit(OtherRequestValidationRequestEmptyState(
            validationMassage: S.current.thisFieldIsRequired,
          ));
        } else if (element == OtherRequestValidationState.requestDateEmpty) {
          emit(OtherRequestValidationRequestDateEmptyState(
            validationMassage: S.current.thisFieldIsRequired,
          ));
        } else if (element == OtherRequestValidationState.remarksEmpty) {
          emit(OtherRequestValidationRemarksEmptyState(
            validationMassage: S.current.thisFieldIsRequired,
          ));
        } else if (element == OtherRequestValidationState.notesEmpty) {
          emit(OtherRequestValidationNotesEmptyState(
            validationMassage: S.current.thisFieldIsRequired,
          ));
        } else if (element == OtherRequestValidationState.fileEmpty) {
          emit(OtherRequestValidationFileEmptyState(
            validationMassage: S.current.thisFieldIsRequired,
          ));
        }
      }
    } else {
      emit(OtherRequestLoadingState());

      InsertOtherRequest insertOtherRequest = InsertOtherRequest(
        id: 0,
        requestedDate: event.requestedDate,
        otherRequestId: event.requestedId,
        requestNote: event.otherRequestController.notes.text,
        workFlowId: 0,
        remarks: event.otherRequestController.remarks.text,
        employeeId: await _getEmployeeIdUseCase() ?? 0,
        companyId: await _getCompanyIdUseCase() ?? 0,
        transactionStatusId: 1,
      );
      DataState dataState = await _insertOtherRequestUseCase(
          request: insertOtherRequest, file: File(event.file));
      if (dataState is DataSuccess<TalentLinkResponse>) {
        emit(OtherRequestSubmitSuccessState(
            successMassage: dataState.data!.responseMessage.toString()));
      } else {
        emit(OtherRequestSubmitErrorState(errorMessage: dataState.toString()));
      }
    }
  }

  FutureOr<void> _onOtherRequestValidationRequestEvent(
      OtherRequestValidationRequestEvent event,
      Emitter<OtherRequestState> emit) {
    OtherRequestValidationState otherRequestValidationState =
        _otherRequestValidationUseCase.validateRequest(event.value);
    if (otherRequestValidationState == OtherRequestValidationState.valid) {
      emit(OtherRequestValidationRequestValidState());
    } else {
      emit(OtherRequestValidationRequestEmptyState(
        validationMassage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onOtherRequestValidationRequestDateEvent(
      OtherRequestValidationRequestDateEvent event,
      Emitter<OtherRequestState> emit) {
    OtherRequestValidationState otherRequestValidationState =
        _otherRequestValidationUseCase.validateRequestDate(event.value);
    if (otherRequestValidationState == OtherRequestValidationState.valid) {
      emit(OtherRequestValidationRequestDateValidState());
    } else {
      emit(OtherRequestValidationRequestDateEmptyState(
        validationMassage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onOtherRequestValidationRemarkEvent(
      OtherRequestValidationRemarkEvent event,
      Emitter<OtherRequestState> emit) {
    OtherRequestValidationState otherRequestValidationState =
        _otherRequestValidationUseCase.validateRemarks(
            event.value, event.isMandatory);
    if (otherRequestValidationState == OtherRequestValidationState.valid) {
      emit(OtherRequestValidationRemarksValidState());
    } else {
      emit(OtherRequestValidationRemarksEmptyState(
        validationMassage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onOtherRequestValidationNotesEvent(
      OtherRequestValidationNotesEvent event, Emitter<OtherRequestState> emit) {
    OtherRequestValidationState otherRequestValidationState =
        _otherRequestValidationUseCase.validateNotes(
            event.value, event.isMandatory);
    if (otherRequestValidationState == OtherRequestValidationState.valid) {
      emit(OtherRequestValidationNotesValidState());
    } else {
      emit(OtherRequestValidationNotesEmptyState(
        validationMassage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onOtherRequestValidationFileEvent(
      OtherRequestValidationFileEvent event, Emitter<OtherRequestState> emit) {
    OtherRequestValidationState otherRequestValidationState =
        _otherRequestValidationUseCase.validateFile(
            event.value, event.isMandatory);
    if (otherRequestValidationState == OtherRequestValidationState.valid) {
      emit(OtherRequestValidationFileValidState());
    } else {
      emit(OtherRequestValidationFileEmptyState(
        validationMassage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onGetOtherRequestTypesEvent(
      GetOtherRequestTypesEvent event, Emitter<OtherRequestState> emit) async {
    emit(OtherRequestLoadingState());
    DataState dataState = await _getOtherRequestTypesUseCase();
    if (dataState is DataSuccess<List<RequestType>>) {
      _otherRequestTypes = dataState.data!;
      emit(GetOtherRequestTypesSuccessState(
          otherRequestTypes: _otherRequestTypes));
    } else {
      emit(GetOtherRequestTypesErrorState(
          errorMassage: dataState.error!.error.toString()));
    }
  }

  FutureOr<void> _onGetAllFieldsMandatoryEvent(
      GetAllFieldsMandatoryEvent event, Emitter<OtherRequestState> emit) async {
    emit(OtherRequestLoadingState());
    DataState dataState = await _getAllFieldsMandatoryUseCase(
        requestTypeId: event.requestTypeId, requestData: event.requestData);
    if (dataState is DataSuccess<List<AllFieldsMandatory>>) {
      _allFieldsMandatory = dataState.data!;
      emit(GetOtherRequestAllFieldsMandatorySuccessState(
          allFieldsMandatory: _allFieldsMandatory));
    } else {
      emit(GetOtherRequestAllFieldsMandatoryErrorState(
          errorMessage: dataState.error!.error.toString()));
    }
  }
}
