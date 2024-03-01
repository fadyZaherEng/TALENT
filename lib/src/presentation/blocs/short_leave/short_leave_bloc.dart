import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/core/utils/convert_to_24_hour_format.dart';
import 'package:talent_link/src/core/utils/validation/short_leave_validator.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/short_leave/model/insert_short_leave_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/short_leave/model/remote_calculate_in_case_short_leave.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/short_leave/request/calculate_in_case_short_leave_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_response.dart';
import 'package:talent_link/src/domain/entities/all_fields/all_fields_mandatory.dart';
import 'package:talent_link/src/domain/entities/request/request_type.dart';
import 'package:talent_link/src/domain/entities/short_leave/calculate_in_case_short_leave.dart';
import 'package:talent_link/src/domain/usecase/all_fields_mandatory/get_all_fields_mandatory_use_case.dart';
import 'package:talent_link/src/domain/usecase/authentication/login/get_basic_salary_amount_use_case.dart';
import 'package:talent_link/src/domain/usecase/authentication/login/get_company_id_use_case.dart';
import 'package:talent_link/src/domain/usecase/authentication/login/get_employee_id_use_case.dart';
import 'package:talent_link/src/domain/usecase/authentication/login/get_total_allowance_use_case.dart';
import 'package:talent_link/src/domain/usecase/short_leave/calculate_in_case_short_leave_use_case.dart';
import 'package:talent_link/src/domain/usecase/short_leave/get_short_leave_types_use_case.dart';
import 'package:talent_link/src/domain/usecase/short_leave/insert_short_leave_use_case.dart';
import 'package:talent_link/src/domain/usecase/short_leave/short_leave_validation_use_case.dart';
import 'package:talent_link/src/presentation/screens/short_leave/utils/short_leave_controller.dart';

part 'short_leave_event.dart';

part 'short_leave_state.dart';

class ShortLeaveBloc extends Bloc<ShortLeaveEvent, ShortLeaveState> {
  final GetShortLeaveTypesUseCase _getShortLeaveTypesUseCase;
  final ShortLeaveValidationUseCase _shortLeaveValidationUseCase;
  final GetAllFieldsMandatoryUseCase _getAllFieldsMandatoryUseCase;
  final InsertShortLeaveUseCase _insertShortLeaveUseCase;
  final CalculateInCaseShortLeaveUseCase _calculateInCaseShortLeaveUseCase;
  final GetEmployeeIdUseCase _getEmployeeIdUseCase;
  final GetCompanyIdUseCase _getCompanyIdUseCase;
  final GetBasicSalaryAmountUseCase getBasicSalaryAmountUseCase;
  final GetTotalAllowanceUseCase getTotalAllowanceUseCase;

  ShortLeaveBloc(
      this._shortLeaveValidationUseCase,
      this._getShortLeaveTypesUseCase,
      this._getAllFieldsMandatoryUseCase,
      this._insertShortLeaveUseCase,
      this._calculateInCaseShortLeaveUseCase,
      this._getEmployeeIdUseCase,
      this._getCompanyIdUseCase,
      this.getBasicSalaryAmountUseCase,
      this.getTotalAllowanceUseCase)
      : super(ShortLeaveInitialState()) {
    on<ShortLeaveBackEvent>(_onShortLeaveBackEvent);
    on<OpenTypeBottomSheetEvent>(_onOpenTypeBottomSheetEvent);
    on<SelectShortLeaveTypeEvent>(_onSelectShortLeaveTypeEvent);
    on<OpenUploadFileBottomSheetEvent>(_onOpenUploadFileBottomSheetEvent);
    on<ShortLeaveOpenCameraEvent>(_onShortLeaveOpenCameraEvent);
    on<ShortLeaveOpenGalleryEvent>(_onShortLeaveOpenGalleryEvent);
    on<ShortLeaveOpenFileEvent>(_onShortLeaveOpenFileEvent);
    on<ShortLeaveSelectFileEvent>(_onShortLeaveSelectFileEvent);
    on<ShortLeaveDeleteFileEvent>(_onShortLeaveDeleteFileEvent);
    on<ShortLeaveSubmitEvent>(_onShortLeaveSubmitEvent);
    on<ValidateShortLeaveTypeEvent>(_onValidateShortLeaveTypeEvent);
    on<ValidateShortLeaveDateEvent>(_onValidateShortLeaveDateEvent);
    on<ValidateShortLeaveStartTimeEvent>(_onValidateShortLeaveStartTimeEvent);
    on<ValidateShortLeaveEndTimeEvent>(_onValidateShortLeaveEndTimeEvent);
    on<ValidateShortLeaveReferenceNameEvent>(
        _onValidateShortLeaveReferenceNameEvent);
    on<ValidateShortLeaveReferenceContactNoEvent>(
        _onValidateShortLeaveYearlyBalanceEvent);
    on<ValidateShortLeaveReasonsEvent>(_onValidateShortLeaveReasonsEvent);
    on<ValidateShortLeaveRemarksEvent>(_onValidateShortLeaveRemarksEvent);
    on<ValidateShortLeaveFileEvent>(_onValidateShortLeaveFileEvent);
    on<GetShortLeaveTypesEvent>(_onGetShortLeaveTypesEvent);
    on<GetAllFieldsMandatoryEvent>(_onGetAllFieldsMandatoryEvent);
    on<InsertShortLeaveEvent>(_onInsertShortLeaveEvent);
    on<ValidateShortLeaveRemainingBalanceEvent>(
        _onValidateShortLeaveRemainingBalanceEvent);
    on<ValidateShortLeaveCurrentBalanceEvent>(
        _onValidateShortLeaveCurrentBalanceEvent);
    on<CalculateInCaseShortLeaveEvent>(_onCalculateInCaseShortLeaveEvent);
  }

  List<AllFieldsMandatory> _allFieldsMandatory = [];
  List<RequestType> shortLeaveTypes = [];
  ShortLeaveContentValue shortLeaveContentValue = ShortLeaveContentValue();
  RemoteCalculateInCaseShortLeave _remoteCalculateInCaseShortLeave =
      RemoteCalculateInCaseShortLeave();

  FutureOr<void> _onShortLeaveBackEvent(
      ShortLeaveBackEvent event, Emitter<ShortLeaveState> emit) {
    emit(ShortLeaveBackState());
  }

  FutureOr<void> _onOpenTypeBottomSheetEvent(
      OpenTypeBottomSheetEvent event, Emitter<ShortLeaveState> emit) {
    emit(OpenTypeBottomSheetState());
  }

  FutureOr<void> _onSelectShortLeaveTypeEvent(
      SelectShortLeaveTypeEvent event, Emitter<ShortLeaveState> emit) {
    emit(SelectShortLeaveTypeState(
      shortLeaveType: event.shortLeaveType,
    ));
    add(ValidateShortLeaveTypeEvent(value: event.shortLeaveType.name));
    shortLeaveContentValue.shortLeaveTypeId = event.shortLeaveType.id;
    add(CalculateInCaseShortLeaveEvent(
        calculateInCaseShortLeave: shortLeaveContentValue));
  }

  FutureOr<void> _onOpenUploadFileBottomSheetEvent(
      OpenUploadFileBottomSheetEvent event, Emitter<ShortLeaveState> emit) {
    emit(OpenUploadFileBottomSheetState(isMandatory: event.isMandatory));
  }

  FutureOr<void> _onShortLeaveOpenCameraEvent(
      ShortLeaveOpenCameraEvent event, Emitter<ShortLeaveState> emit) {
    emit(ShortLeaveOpenCameraState(isMandatory: event.isMandatory));
  }

  FutureOr<void> _onShortLeaveOpenGalleryEvent(
      ShortLeaveOpenGalleryEvent event, Emitter<ShortLeaveState> emit) {
    emit(ShortLeaveOpenGalleryState(isMandatory: event.isMandatory));
  }

  FutureOr<void> _onShortLeaveOpenFileEvent(
      ShortLeaveOpenFileEvent event, Emitter<ShortLeaveState> emit) {
    emit(ShortLeaveOpenFileState(isMandatory: event.isMandatory));
  }

  FutureOr<void> _onShortLeaveSelectFileEvent(
      ShortLeaveSelectFileEvent event, Emitter<ShortLeaveState> emit) {
    emit(ShortLeaveSelectFileState(filePath: event.filePath));
    add(ValidateShortLeaveFileEvent(
        value: event.filePath, isMandatory: event.isMandatory));
    shortLeaveContentValue.file = event.filePath;
  }

  FutureOr<void> _onShortLeaveDeleteFileEvent(
      ShortLeaveDeleteFileEvent event, Emitter<ShortLeaveState> emit) {
    emit(ShortLeaveDeleteFileState(filePath: ''));
    add(ValidateShortLeaveFileEvent(value: '', isMandatory: event.isMandatory));
    shortLeaveContentValue.file = "";
  }

  FutureOr<void> _onShortLeaveSubmitEvent(
      ShortLeaveSubmitEvent event, Emitter<ShortLeaveState> emit) async {
    final validationsState = _shortLeaveValidationUseCase.validateFormUseCase(
        file: event.file,
        date: event.date,
        startTime: event.startTime,
        endTime: event.endTime,
        allFieldsMandatory: event.allFieldsMandatory,
        shortLeaveController: event.shortLeaveController);
    if (validationsState.isNotEmpty) {
      for (var element in validationsState) {
        if (element == ShortLeaveValidationState.typeEmpty) {
          emit(ShortLeaveTypeEmptyState(
            validationMessage: S.current.thisFieldIsRequired,
          ));
        } else if (element == ShortLeaveValidationState.dateEmpty) {
          emit(ShortLeaveDateEmptyState(
            validationMessage: S.current.thisFieldIsRequired,
          ));
        } else if (element == ShortLeaveValidationState.startTimeEmpty) {
          emit(ShortLeaveStartTimeEmptyState(
            validationMessage: S.current.thisFieldIsRequired,
          ));
        } else if (element == ShortLeaveValidationState.endTimeEmpty) {
          emit(ShortLeaveEndTimeEmptyState(
            validationMessage: S.current.thisFieldIsRequired,
          ));
        } else if (element == ShortLeaveValidationState.referenceNameEmpty) {
          emit(ShortLeaveReferenceNameEmptyState(
            validationMessage: S.current.thisFieldIsRequired,
          ));
        } else if (element ==
            ShortLeaveValidationState.referenceContactNoEmpty) {
          emit(ShortLeaveReferenceContactNoEmptyState(
            validationMessage: S.current.thisFieldIsRequired,
          ));
        } else if (element == ShortLeaveValidationState.leaveReasonsEmpty) {
          emit(ShortLeaveReasonsEmptyState(
            validationMessage: S.current.thisFieldIsRequired,
          ));
        } else if (element == ShortLeaveValidationState.remarksEmpty) {
          emit(ShortLeaveRemarksEmptyState(
            validationMessage: S.current.thisFieldIsRequired,
          ));
        } else if (element == ShortLeaveValidationState.fileEmpty) {
          emit(ShortLeaveFileEmptyState(
            validationMessage: S.current.thisFieldIsRequired,
          ));
        } else if (element == ShortLeaveValidationState.currentBalanceEmpty) {
          emit(ShortLeaveCurrentBalanceEmptyState(
            validationMessage: S.current.thisFieldIsRequired,
          ));
        } else if (element == ShortLeaveValidationState.remainingBalanceEmpty) {
          emit(ShortLeaveRemainingBalanceEmptyState(
            validationMessage: S.current.thisFieldIsRequired,
          ));
        } else if (element == ShortLeaveValidationState.startTimeNotValid) {
          emit(ShortLeaveStartTimeNotValidState(
            validationMessage: S.current.notValid,
          ));
        } else if (element == ShortLeaveValidationState.endTimeNotValid) {
          emit(ShortLeaveEndTimeNotValidState(
            validationMessage: S.current.notValid,
          ));
        }
      }
    } else {
      add(InsertShortLeaveEvent(
          shortLeaveController: event.shortLeaveController,
          allFieldsMandatory: event.allFieldsMandatory,
          file: event.file,
          date: event.date,
          startTime: event.startTime,
          endTime: event.endTime,
          typeId: event.typeId));
    }
  }

  FutureOr<void> _onValidateShortLeaveTypeEvent(
      ValidateShortLeaveTypeEvent event, Emitter<ShortLeaveState> emit) {
    ShortLeaveValidationState leaveValidationState =
        _shortLeaveValidationUseCase.validateType(event.value);
    if (leaveValidationState == ShortLeaveValidationState.valid) {
      emit(ShortLeaveTypeValidState());
    } else {
      emit(ShortLeaveTypeEmptyState(
        validationMessage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onValidateShortLeaveDateEvent(
      ValidateShortLeaveDateEvent event, Emitter<ShortLeaveState> emit) {
    ShortLeaveValidationState leaveValidationState =
        _shortLeaveValidationUseCase.validateDate(event.value);
    if (leaveValidationState == ShortLeaveValidationState.valid) {
      emit(ShortLeaveDateValidState());
      shortLeaveContentValue.shortLeaveDate = event.value;
      add(CalculateInCaseShortLeaveEvent(
          calculateInCaseShortLeave: shortLeaveContentValue));
    } else {
      shortLeaveContentValue.shortLeaveDate = '';
      emit(ShortLeaveDateEmptyState(
        validationMessage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onValidateShortLeaveStartTimeEvent(
      ValidateShortLeaveStartTimeEvent event, Emitter<ShortLeaveState> emit) {
    ShortLeaveValidationState leaveValidationState =
        _shortLeaveValidationUseCase.validateStartTime(
            event.startTime, event.endTime);
    if (leaveValidationState == ShortLeaveValidationState.valid) {
      emit(ShortLeaveStartTimeValidState());
      shortLeaveContentValue.startTime = event.startTime;
      add(CalculateInCaseShortLeaveEvent(
          calculateInCaseShortLeave: shortLeaveContentValue));
    } else if (leaveValidationState ==
        ShortLeaveValidationState.startTimeNotValid) {
      emit(ShortLeaveStartTimeNotValidState(
        validationMessage: S.current.notValid,
      ));
    } else {
      shortLeaveContentValue.startTime = '';
      emit(ShortLeaveStartTimeEmptyState(
        validationMessage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onValidateShortLeaveEndTimeEvent(
      ValidateShortLeaveEndTimeEvent event, Emitter<ShortLeaveState> emit) {
    ShortLeaveValidationState leaveValidationState =
        _shortLeaveValidationUseCase.validateEndTime(
            event.endTime, event.startTime);
    if (leaveValidationState == ShortLeaveValidationState.valid) {
      emit(ShortLeaveEndTimeValidState());
      shortLeaveContentValue.endTime = event.endTime;
      add(CalculateInCaseShortLeaveEvent(
          calculateInCaseShortLeave: shortLeaveContentValue));
    } else if (leaveValidationState ==
        ShortLeaveValidationState.endTimeNotValid) {
      emit(ShortLeaveEndTimeNotValidState(
        validationMessage: S.current.notValid,
      ));
    } else {
      shortLeaveContentValue.endTime = '';
      emit(ShortLeaveEndTimeEmptyState(
        validationMessage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onValidateShortLeaveReferenceNameEvent(
      ValidateShortLeaveReferenceNameEvent event,
      Emitter<ShortLeaveState> emit) {
    ShortLeaveValidationState leaveValidationState =
        _shortLeaveValidationUseCase.validateReferenceName(
            event.value, event.isMandatory);
    if (leaveValidationState == ShortLeaveValidationState.valid) {
      shortLeaveContentValue.referenceName = event.value;
      emit(ShortLeaveReferenceNameValidState());
    } else {
      shortLeaveContentValue.referenceName = '';
      emit(ShortLeaveReferenceNameEmptyState(
        validationMessage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onValidateShortLeaveYearlyBalanceEvent(
      ValidateShortLeaveReferenceContactNoEvent event,
      Emitter<ShortLeaveState> emit) {
    ShortLeaveValidationState leaveValidationState =
        _shortLeaveValidationUseCase.validateReferenceContactNo(
            event.value, event.isMandatory);
    if (leaveValidationState == ShortLeaveValidationState.valid) {
      shortLeaveContentValue.referenceContactNo = event.value;
      emit(ShortLeaveReferenceContactNoValidState());
    } else {
      shortLeaveContentValue.referenceContactNo = '';
      emit(ShortLeaveReferenceContactNoEmptyState(
        validationMessage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onValidateShortLeaveReasonsEvent(
      ValidateShortLeaveReasonsEvent event, Emitter<ShortLeaveState> emit) {
    ShortLeaveValidationState leaveValidationState =
        _shortLeaveValidationUseCase.validateLeaveReasons(
            event.value, event.isMandatory);
    if (leaveValidationState == ShortLeaveValidationState.valid) {
      shortLeaveContentValue.leaveReasons = event.value;
      emit(ShortLeaveReasonsValidState());
    } else {
      shortLeaveContentValue.leaveReasons = '';
      emit(ShortLeaveReasonsEmptyState(
        validationMessage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onValidateShortLeaveRemarksEvent(
      ValidateShortLeaveRemarksEvent event, Emitter<ShortLeaveState> emit) {
    ShortLeaveValidationState leaveValidationState =
        _shortLeaveValidationUseCase.validateRemarks(
            event.value, event.isMandatory);
    if (leaveValidationState == ShortLeaveValidationState.valid) {
      shortLeaveContentValue.remark = event.value;
      emit(ShortLeaveRemarksValidState());
    } else {
      shortLeaveContentValue.remark = "";
      emit(ShortLeaveRemarksEmptyState(
        validationMessage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onValidateShortLeaveFileEvent(
      ValidateShortLeaveFileEvent event, Emitter<ShortLeaveState> emit) {
    ShortLeaveValidationState leaveValidationState =
        _shortLeaveValidationUseCase.validateFile(
            event.value, event.isMandatory);
    if (leaveValidationState == ShortLeaveValidationState.valid) {
      emit(ShortLeaveFileValidState());
    } else {
      emit(ShortLeaveFileEmptyState(
        validationMessage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onGetShortLeaveTypesEvent(
      GetShortLeaveTypesEvent event, Emitter<ShortLeaveState> emit) async {
    emit(ShortLeaveLoadingState());
    DataState dataState =
        await _getShortLeaveTypesUseCase(await _getEmployeeIdUseCase() ?? 0);
    if (dataState is DataSuccess<List<RequestType>>) {
      shortLeaveTypes = dataState.data!;
      emit(GetShortLeaveTypesSuccessState(requestTypes: shortLeaveTypes));
    } else {
      emit(GetShortLeaveTypesErrorState(
          errorMassage: dataState.error!.error.toString()));
    }
  }

  FutureOr<void> _onGetAllFieldsMandatoryEvent(
      GetAllFieldsMandatoryEvent event, Emitter<ShortLeaveState> emit) async {
    emit(ShortLeaveLoadingState());
    DataState dataState = await _getAllFieldsMandatoryUseCase(
        requestData: event.requestData, requestTypeId: event.requestTypeId);
    if (dataState is DataSuccess<List<AllFieldsMandatory>>) {
      _allFieldsMandatory = dataState.data!;
      emit(GetAllFieldsMandatorySuccessState(
          allFieldsMandatory: _allFieldsMandatory));
    } else {
      emit(GetAllFieldsMandatoryErrorState(
          errorMassage: dataState.error!.error.toString()));
    }
  }

  FutureOr<void> _onInsertShortLeaveEvent(
      InsertShortLeaveEvent event, Emitter<ShortLeaveState> emit) async {
    emit(ShortLeaveLoadingState());
    InsertShortLeaveRequest insertShortLeaveRequest = InsertShortLeaveRequest(
        id: 0,
        companyId: await _getCompanyIdUseCase() ?? 0,
        employeeId: await _getEmployeeIdUseCase() ?? 0,
        leaveTypeId: event.typeId,
        shortLeaveTypeId: event.typeId,
        shortLeaveDate: shortLeaveContentValue.shortLeaveDate,
        startTime: convertTo24HourFormat(shortLeaveContentValue.startTime),
        endTime: convertTo24HourFormat(shortLeaveContentValue.endTime),
        noOfMinutes: event.shortLeaveController.numberOfMinutes.text,
        reason: shortLeaveContentValue.leaveReasons,
        referenceName: shortLeaveContentValue.referenceName,
        referenceContactNo: shortLeaveContentValue.referenceContactNo,
        currentBalance: shortLeaveContentValue.currentBalance.isNotEmpty
            ? int.parse(shortLeaveContentValue.currentBalance)
            : 0,
        remainingBalance: shortLeaveContentValue.remainingBalance.isNotEmpty
            ? int.parse(shortLeaveContentValue.remainingBalance)
            : 0,
        remarks: event.shortLeaveController.remarks.text,
        workFlowId: 0,
        transactionStatusId: 1,
        basicSalaryAmount: await getBasicSalaryAmountUseCase() ?? 0,
        allowancesAmount: await getTotalAllowanceUseCase() ?? 0);
    DataState dataState = await _insertShortLeaveUseCase.call(
        request: insertShortLeaveRequest, file: File(event.file));
    if (dataState is DataSuccess<TalentLinkResponse>) {
      emit(InsertShortLeaveSuccessState(
          successMassage: dataState.data!.responseMessage.toString()));
    } else {
      emit(InsertShortLeaveErrorState(errorMassage: dataState.toString()));
    }
  }

  FutureOr<void> _onValidateShortLeaveRemainingBalanceEvent(
      ValidateShortLeaveRemainingBalanceEvent event,
      Emitter<ShortLeaveState> emit) {
    ShortLeaveValidationState leaveValidationState =
        _shortLeaveValidationUseCase.validateRemainingBalance(
            event.value, event.isMandatory);
    if (leaveValidationState == ShortLeaveValidationState.valid) {
      shortLeaveContentValue.remainingBalance = event.value;
      emit(ShortLeaveRemainingBalanceValidState());
    } else {
      shortLeaveContentValue.remainingBalance = "";
      emit(ShortLeaveRemainingBalanceEmptyState(
        validationMessage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onValidateShortLeaveCurrentBalanceEvent(
      ValidateShortLeaveCurrentBalanceEvent event,
      Emitter<ShortLeaveState> emit) {
    ShortLeaveValidationState leaveValidationState =
        _shortLeaveValidationUseCase.validateCurrentBalance(
            event.value, event.isMandatory);
    if (leaveValidationState == ShortLeaveValidationState.valid) {
      shortLeaveContentValue.currentBalance = event.value;
      emit(ShortLeaveCurrentBalanceValidState());
    } else {
      shortLeaveContentValue.currentBalance = "";
      emit(ShortLeaveCurrentBalanceEmptyState(
        validationMessage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onCalculateInCaseShortLeaveEvent(
      CalculateInCaseShortLeaveEvent event,
      Emitter<ShortLeaveState> emit) async {
    if (shortLeaveContentValue.endTime.isNotEmpty &&
        shortLeaveContentValue.startTime.isNotEmpty &&
        shortLeaveContentValue.shortLeaveDate.isNotEmpty &&
        shortLeaveContentValue.shortLeaveTypeId != 0) {
      emit(ShortLeaveLoadingState());
      DataState dataState = await _calculateInCaseShortLeaveUseCase.call(
          calculateInCaseShortLeaveRequest: CalculateInCaseShortLeaveRequest(
              employeeId: await _getEmployeeIdUseCase(),
              shortLeaveTypeId:
                  event.calculateInCaseShortLeave.shortLeaveTypeId,
              shortLeaveDate: event.calculateInCaseShortLeave.shortLeaveDate,
              startTime: convertTo24HourFormat(
                  event.calculateInCaseShortLeave.startTime),
              endTime: convertTo24HourFormat(
                  event.calculateInCaseShortLeave.endTime)));
      if (dataState
          is DataSuccess<TalentLinkResponse<RemoteCalculateInCaseShortLeave>>) {
        emit(CalculateInCaseShortLeaveSuccessState(
            remoteCalculateInCaseShortLeave: dataState.data!.result!));
        _remoteCalculateInCaseShortLeave = dataState.data!.result!;
        if (_remoteCalculateInCaseShortLeave.status == false) {
          emit(CalculateInCaseShortLeaveErrorState(
              errorMassage: dataState.data!.result!.message.toString()));
        }
      } else {
        emit(CalculateInCaseShortLeaveErrorState(
            errorMassage: dataState.message.toString()));
      }
    }
  }
}
