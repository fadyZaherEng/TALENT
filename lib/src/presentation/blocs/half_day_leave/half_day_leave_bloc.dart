import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/core/utils/validation/half_day_leave_validator.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/half_day/model/remote_calculate_in_case_half_day_leave.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/half_day/request/calculate_in_case_half_day_leave_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/half_day/request/insert_half_day_leave_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_response.dart';
import 'package:talent_link/src/domain/entities/all_fields/all_fields_mandatory.dart';
import 'package:talent_link/src/domain/entities/request/request_type.dart';
import 'package:talent_link/src/domain/usecase/all_fields_mandatory/get_all_fields_mandatory_use_case.dart';
import 'package:talent_link/src/domain/usecase/authentication/login/get_basic_salary_amount_use_case.dart';
import 'package:talent_link/src/domain/usecase/authentication/login/get_company_id_use_case.dart';
import 'package:talent_link/src/domain/usecase/authentication/login/get_employee_id_use_case.dart';
import 'package:talent_link/src/domain/usecase/authentication/login/get_total_allowance_use_case.dart';
import 'package:talent_link/src/domain/usecase/half_day_leave/calculate_in_case_half_day_use_case.dart';
import 'package:talent_link/src/domain/usecase/half_day_leave/get_half_day_types_use_case.dart';
import 'package:talent_link/src/domain/usecase/half_day_leave/half_day_leave_validation_use_case.dart';
import 'package:talent_link/src/presentation/screens/half_day_leave/utils/half_day_leave_controller.dart';
import '../../../domain/usecase/half_day_leave/insert_half_day_leave_use_case.dart';

part 'half_day_leave_event.dart';

part 'half_day_leave_state.dart';

class HalfDayLeaveBloc extends Bloc<HalfDayLeaveEvent, HalfDayLeaveState> {
  final HalfDayLeaveValidationUseCase _halfDayLeaveValidationUseCase;
  final GetHalfDayTypesUseCase _getHalfDayTypesUseCase;
  final InsertHalfDayLeaveUseCase _insertHalfDayLeaveUseCase;
  final GetAllFieldsMandatoryUseCase _getAllFieldsMandatoryUseCase;
  final GetEmployeeIdUseCase _getEmployeeIdUseCase;
  final GetCompanyIdUseCase _getCompanyIdUseCase;
  final CalculateInCaseHalfDayUseCase _calculateInCaseHalfDayUseCase;
  final GetBasicSalaryAmountUseCase getBasicSalaryAmountUseCase;
  final GetTotalAllowanceUseCase getTotalAllowanceUseCase;

  HalfDayLeaveBloc(this._halfDayLeaveValidationUseCase,
      this._getHalfDayTypesUseCase,
      this._insertHalfDayLeaveUseCase,
      this._getAllFieldsMandatoryUseCase,
      this._getEmployeeIdUseCase,
      this._getCompanyIdUseCase,
      this._calculateInCaseHalfDayUseCase, this.getBasicSalaryAmountUseCase,
      this.getTotalAllowanceUseCase)
      : super(HalfDayLeaveInitialState()) {
    on<HalfDayLeaveBackEvent>(_onHalfDayLeaveBackEvent);
    on<HalfDayLeaveOpenHalfLeaveTypeBottomSheetEvent>(
        _onHalfDayLeaveOpenHalfLeaveTypeBottomSheetEvent);
    on<HalfDayLeaveSelectHalfLeaveTypeEvent>(
        _onHalfDayLeaveSelectHalfLeaveTypeEvent);
    on<HalfDayLeaveOpenUploadFileBottomSheetEvent>(
        _onHalfDayLeaveOpenUploadFileBottomSheetEvent);
    on<HalfDayLeaveOpenCameraEvent>(_onHalfDayLeaveOpenCameraEvent);
    on<HalfDayLeaveOpenGalleryEvent>(_onHalfDayLeaveOpenGalleryEvent);
    on<HalfDayLeaveOpenFileEvent>(_onHalfDayLeaveOpenFileEvent);
    on<HalfDayLeaveSelectFileEvent>(_onHalfDayLeaveSelectFileEvent);
    on<HalfDayLeaveDeleteFileEvent>(_onHalfDayLeaveDeleteFileEvent);
    on<HalfDayLeaveSubmitEvent>(_onHalfDayLeaveSubmitEvent);
    on<HalfDayLeaveValidationHalfLeaveTypeEvent>(
        _onHalfDayLeaveValidationHalfLeaveTypeEvent);
    on<HalfDayLeaveValidationHalfLeaveDateEvent>(
        _onHalfDayLeaveValidationHalfLeaveDateEvent);
    on<HalfDayLeaveValidationStartTimeEvent>(
        _onHalfDayLeaveValidationStartTimeEvent);
    on<HalfDayLeaveValidationEndTimeEvent>(
        _onHalfDayLeaveValidationEndTimeEvent);
    on<HalfDayLeaveValidationNumberOfMinuteEvent>(
        _onHalfDayLeaveValidationNumberOfMinuteEvent);
    on<HalfDayLeaveValidationReasonsEvent>(
        _onHalfDayLeaveValidationReasonsEvent);
    on<HalfDayLeaveValidationRemarksEvent>(
        _onHalfDayLeaveValidationRemarksEvent);
    on<HalfDayLeaveValidationFileEvent>(_onHalfDayLeaveValidationFileEvent);
    on<GetHalfDayLeaveTypesEvent>(_onGetHalfDayLeaveTypesEvent);
    on<GetHalfDayLeaveAllFieldsMandatoryEvent>(
        _onGetHalfDayLeaveAllFieldsMandatoryEvent);
  }

  List<AllFieldsMandatory> _allFieldMandatory = [];
  List<RequestType> _halfLeaveTypes = [];
  RemoteCalculateInCaseHalfDayLeave _remoteCalculateInCaseHalfDayLeave =
  RemoteCalculateInCaseHalfDayLeave();

  FutureOr<void> _onHalfDayLeaveBackEvent(HalfDayLeaveBackEvent event,
      Emitter<HalfDayLeaveState> emit) {
    emit(HalfDayLeaveBackState());
  }

  FutureOr<void> _onHalfDayLeaveOpenHalfLeaveTypeBottomSheetEvent(
      HalfDayLeaveOpenHalfLeaveTypeBottomSheetEvent event,
      Emitter<HalfDayLeaveState> emit) {
    emit(HalfDayLeaveOpenHalfLeaveTypeBottomSheetState());
  }

  FutureOr<void> _onHalfDayLeaveSelectHalfLeaveTypeEvent(
      HalfDayLeaveSelectHalfLeaveTypeEvent event,
      Emitter<HalfDayLeaveState> emit) {
    emit(HalfDayLeaveSelectHalfLeaveTypeState(
        halfLeaveType: event.halfLeaveType));

    add(HalfDayLeaveValidationHalfLeaveTypeEvent(
        value: event.halfLeaveType.name));
  }

  FutureOr<void> _onHalfDayLeaveOpenUploadFileBottomSheetEvent(
      HalfDayLeaveOpenUploadFileBottomSheetEvent event,
      Emitter<HalfDayLeaveState> emit) {
    emit(HalfDayLeaveOpenUploadFileBottomSheetState(
        isMandatory: event.isMandatory));
  }

  FutureOr<void> _onHalfDayLeaveOpenCameraEvent(
      HalfDayLeaveOpenCameraEvent event, Emitter<HalfDayLeaveState> emit) {
    emit(HalfDayLeaveOpenCameraState(isMandatory: event.isMandatory));
  }

  FutureOr<void> _onHalfDayLeaveOpenGalleryEvent(
      HalfDayLeaveOpenGalleryEvent event, Emitter<HalfDayLeaveState> emit) {
    emit(HalfDayLeaveOpenGalleryState(isMandatory: event.isMandatory));
  }

  FutureOr<void> _onHalfDayLeaveOpenFileEvent(HalfDayLeaveOpenFileEvent event,
      Emitter<HalfDayLeaveState> emit) {
    emit(HalfDayLeaveOpenFileState(isMandatory: event.isMandatory));
  }

  FutureOr<void> _onHalfDayLeaveSelectFileEvent(
      HalfDayLeaveSelectFileEvent event, Emitter<HalfDayLeaveState> emit) {
    emit(HalfDayLeaveSelectFileState(filePath: event.filePath));
    add(HalfDayLeaveValidationFileEvent(
        value: event.filePath, isMandatory: event.isMandatory));
  }

  FutureOr<void> _onHalfDayLeaveDeleteFileEvent(
      HalfDayLeaveDeleteFileEvent event, Emitter<HalfDayLeaveState> emit) {
    emit(HalfDayLeaveDeleteFileState(filePath: ''));
    add(HalfDayLeaveValidationFileEvent(
        value: '', isMandatory: event.isMandatory));
  }

  FutureOr<void> _onHalfDayLeaveSubmitEvent(HalfDayLeaveSubmitEvent event,
      Emitter<HalfDayLeaveState> emit) async {
    final validationsState = _halfDayLeaveValidationUseCase.validateFormUseCase(
        endTime: event.endTime,
        halfDayLeaveController: event.halfDayLeaveController,
        allFieldsMandatory: event.allFiledMandatory,
        halfLeaveDate: event.halfLeaveDate,
        startTime: event.startTime,
        file: event.file);
    if (validationsState.isNotEmpty) {
      for (var element in validationsState) {
        if (element == HalfDayLeaveValidationState.halfLeaveTypeEmpty) {
          emit(HalfDayLeaveHalfLeaveTypeEmptyState(
            validationMassage: S.current.thisFieldIsRequired,
          ));
        } else if (element == HalfDayLeaveValidationState.halfLeaveDateEmpty) {
          emit(HalfDayLeaveHalfLeaveDateEmptyState(
            validationMassage: S.current.thisFieldIsRequired,
          ));
        } else if (element == HalfDayLeaveValidationState.startTimeEmpty) {
          emit(HalfDayLeaveStartTimeEmptyState(
            validationMassage: S.current.thisFieldIsRequired,
          ));
        } else if (element == HalfDayLeaveValidationState.endTimeEmpty) {
          emit(HalfDayLeaveEndTimeEmptyState(
            validationMassage: S.current.thisFieldIsRequired,
          ));
        } else if (element == HalfDayLeaveValidationState.numberOfMinuteEmpty) {
          emit(HalfDayLeaveNumberOfMinuteEmptyState(
            validationMassage: S.current.thisFieldIsRequired,
          ));
        } else if (element == HalfDayLeaveValidationState.leaveReasonsEmpty) {
          emit(HalfDayLeaveReasonsEmptyState(
            validationMassage: S.current.thisFieldIsRequired,
          ));
        } else if (element == HalfDayLeaveValidationState.leaveRemarksEmpty) {
          emit(HalfDayLeaveRemarksEmptyState(
            validationMassage: S.current.thisFieldIsRequired,
          ));
        } else if (element == HalfDayLeaveValidationState.fileEmpty) {
          emit(HalfDayLeaveFileEmptyState(
            validationMassage: S.current.thisFieldIsRequired,
          ));
        } else if (element == HalfDayLeaveValidationState.startTimeNotValid) {
          emit(HalfDayLeaveStartTimeNotValidState(
            validationMassage: S.current.notValid,
          ));
        } else if (element == HalfDayLeaveValidationState.endTimeNotValid) {
          emit(HalfDayLeaveEndTimeNotValidState(
            validationMassage: S.current.notValid,
          ));
        }
      }
    } else {
      emit(HalfDayLeaveLoadingState());
      DataState calculateInCaseDataState = await _calculateInCaseHalfDayUseCase(
          CalculateInCaseHalfDayLeaveRequest(
            employeeId: await _getEmployeeIdUseCase() ?? 0,
            fromDate: event.halfLeaveDate,
            startTime: event.startTime,
            endTime: event.endTime,
            isByPayroll: 1,
            leaveTypeId: event.halfDayLeaveTypeId,
          ));
      if (calculateInCaseDataState
      is DataSuccess<RemoteCalculateInCaseHalfDayLeave>) {
        _remoteCalculateInCaseHalfDayLeave = calculateInCaseDataState.data!;
        if (_remoteCalculateInCaseHalfDayLeave
            .employeeLeaveBalanceResponse!.status ==
            true) {
          InsertHalfDayLeaveRequest insertHalfDayLeaveRequest =
          InsertHalfDayLeaveRequest(
              companyId: await _getCompanyIdUseCase() ?? 0,
              employeeId: await _getEmployeeIdUseCase() ?? 0,
              halfDayLeaveTypeId: event.halfDayLeaveTypeId,
              halfDayLeaveDate: event.halfLeaveDate,
              startTime: event.startTime,
              endTime: event.endTime,
              noOfMinutes: int.parse(
                  event.halfDayLeaveController.numberOfMinute.text),
              reason: event.halfDayLeaveController.leaveReasons.text,
              remarks: event.halfDayLeaveController.remarks.text,
              basicSalaryAmount: await getBasicSalaryAmountUseCase() ?? 0,
              allowancesAmount: await getTotalAllowanceUseCase() ?? 0,
              transactionStatusId: 1,
              wfId: 0,
              id: 0);
          DataState dataState = await _insertHalfDayLeaveUseCase(
              request: insertHalfDayLeaveRequest, file: File(event.file));
          if (dataState is DataSuccess<TalentLinkResponse>) {
            emit(HalfDayLeaveSubmitSuccessState(
                successMassage:
                dataState.data!.responseMessage ?? S.current.success));
          } else {
            emit(HalfDayLeaveSubmitErrorState(
                errorMessage: dataState.error!.error.toString()));
          }
        } else {
          emit(CalculateInCaseHalfDayErrorState(
              errorMessage: _remoteCalculateInCaseHalfDayLeave
                  .employeeLeaveBalanceResponse!.message
                  .toString()));
        }
      } else {
        emit(CalculateInCaseHalfDayErrorState(
            errorMessage: calculateInCaseDataState.message.toString()));
      }
    }
  }

  FutureOr<void> _onHalfDayLeaveValidationHalfLeaveTypeEvent(
      HalfDayLeaveValidationHalfLeaveTypeEvent event,
      Emitter<HalfDayLeaveState> emit) {
    HalfDayLeaveValidationState halfDayLeaveValidationState =
    _halfDayLeaveValidationUseCase.validateHalfLeaveType(event.value);
    if (halfDayLeaveValidationState == HalfDayLeaveValidationState.valid) {
      emit(HalfDayLeaveHalfLeaveTypeValidState());
    } else {
      emit(HalfDayLeaveHalfLeaveTypeEmptyState(
        validationMassage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onHalfDayLeaveValidationHalfLeaveDateEvent(
      HalfDayLeaveValidationHalfLeaveDateEvent event,
      Emitter<HalfDayLeaveState> emit) {
    HalfDayLeaveValidationState halfDayLeaveValidationState =
    _halfDayLeaveValidationUseCase.validateHalfLeaveDate(event.value);
    if (halfDayLeaveValidationState == HalfDayLeaveValidationState.valid) {
      emit(HalfDayLeaveHalfLeaveDateValidState());
    } else {
      emit(HalfDayLeaveHalfLeaveDateEmptyState(
        validationMassage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onHalfDayLeaveValidationStartTimeEvent(
      HalfDayLeaveValidationStartTimeEvent event,
      Emitter<HalfDayLeaveState> emit) {
    HalfDayLeaveValidationState halfDayLeaveValidationState =
    _halfDayLeaveValidationUseCase.validateStartTime(
        event.startTime, event.endTime);
    if (halfDayLeaveValidationState == HalfDayLeaveValidationState.valid) {
      emit(HalfDayLeaveStartTimeValidState());
    } else if (halfDayLeaveValidationState ==
        HalfDayLeaveValidationState.startTimeNotValid) {
      emit(HalfDayLeaveStartTimeNotValidState(
        validationMassage: S.current.notValid,
      ));
    } else {
      emit(HalfDayLeaveStartTimeEmptyState(
        validationMassage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onHalfDayLeaveValidationEndTimeEvent(
      HalfDayLeaveValidationEndTimeEvent event,
      Emitter<HalfDayLeaveState> emit) {
    HalfDayLeaveValidationState halfDayLeaveValidationState =
    _halfDayLeaveValidationUseCase.validateEndTime(
        event.endTime, event.startTime);
    if (halfDayLeaveValidationState == HalfDayLeaveValidationState.valid) {
      emit(HalfDayLeaveEndTimeValidState());
    } else if (halfDayLeaveValidationState ==
        HalfDayLeaveValidationState.endTimeNotValid) {
      emit(HalfDayLeaveEndTimeNotValidState(
        validationMassage: S.current.notValid,
      ));
    } else {
      emit(HalfDayLeaveEndTimeEmptyState(
        validationMassage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onHalfDayLeaveValidationNumberOfMinuteEvent(
      HalfDayLeaveValidationNumberOfMinuteEvent event,
      Emitter<HalfDayLeaveState> emit) {
    HalfDayLeaveValidationState halfDayLeaveValidationState =
    _halfDayLeaveValidationUseCase.validateNumberOfMinute(event.value);
    if (halfDayLeaveValidationState == HalfDayLeaveValidationState.valid) {
      emit(HalfDayLeaveNumberOfMinuteValidState());
    } else {
      emit(HalfDayLeaveNumberOfMinuteEmptyState(
        validationMassage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onHalfDayLeaveValidationReasonsEvent(
      HalfDayLeaveValidationReasonsEvent event,
      Emitter<HalfDayLeaveState> emit) {
    HalfDayLeaveValidationState halfDayLeaveValidationState =
    _halfDayLeaveValidationUseCase.validateLeaveReasons(
        event.value, event.isMandatory);
    if (halfDayLeaveValidationState == HalfDayLeaveValidationState.valid) {
      emit(HalfDayLeaveReasonsValidState());
    } else {
      emit(HalfDayLeaveReasonsEmptyState(
        validationMassage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onHalfDayLeaveValidationRemarksEvent(
      HalfDayLeaveValidationRemarksEvent event,
      Emitter<HalfDayLeaveState> emit) {
    HalfDayLeaveValidationState halfDayLeaveValidationState =
    _halfDayLeaveValidationUseCase.validateRemarks(
        event.value, event.isMandatory);
    if (halfDayLeaveValidationState == HalfDayLeaveValidationState.valid) {
      emit(HalfDayLeaveRemarksValidState());
    } else {
      emit(HalfDayLeaveRemarksEmptyState(
        validationMassage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onHalfDayLeaveValidationFileEvent(
      HalfDayLeaveValidationFileEvent event, Emitter<HalfDayLeaveState> emit) {
    HalfDayLeaveValidationState halfDayLeaveValidationState =
    _halfDayLeaveValidationUseCase.validateFile(
        event.value, event.isMandatory);
    if (halfDayLeaveValidationState == HalfDayLeaveValidationState.valid) {
      emit(HalfDayLeaveFileValidState());
    } else {
      emit(HalfDayLeaveFileEmptyState(
        validationMassage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onGetHalfDayLeaveTypesEvent(GetHalfDayLeaveTypesEvent event,
      Emitter<HalfDayLeaveState> emit) async {
    emit(HalfDayLeaveLoadingState());
    DataState dataState = await _getHalfDayTypesUseCase(await _getEmployeeIdUseCase()??0);
    if (dataState is DataSuccess<List<RequestType>>) {
      _halfLeaveTypes = dataState.data!;
      emit(GetHalfDayLeaveTypesSuccessState(halfDayTypes: _halfLeaveTypes));
    } else {
      emit(GetHalfDayLeaveTypesErrorState(
          errorMassage: dataState.error!.error.toString()));
    }
  }

  FutureOr<void> _onGetHalfDayLeaveAllFieldsMandatoryEvent(
      GetHalfDayLeaveAllFieldsMandatoryEvent event,
      Emitter<HalfDayLeaveState> emit) async {
    emit(HalfDayLeaveLoadingState());
    DataState dataState = await _getAllFieldsMandatoryUseCase(
        requestData: event.requestData, requestTypeId: event.requestTypeId);
    if (dataState is DataSuccess<List<AllFieldsMandatory>>) {
      _allFieldMandatory = dataState.data!;
      emit(GetHalfDayLeaveAllFieldsMandatorySuccessState(
          allFieldsMandatory: _allFieldMandatory));
    } else {
      emit(GetHalfDayLeaveAllFieldsMandatoryErrorState(
          errorMessage: dataState.error!.error.toString()));
    }
  }
}
