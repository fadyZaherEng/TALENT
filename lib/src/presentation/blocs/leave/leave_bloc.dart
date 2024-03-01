import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/core/utils/validation/leave_validator.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/leave/model/remote_calculate_in_case_new_leave.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/leave/request/calculate_in_case_new_leave_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/leave/request/insert_leave_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_response.dart';
import 'package:talent_link/src/domain/entities/all_fields/all_fields_mandatory.dart';
import 'package:talent_link/src/domain/entities/leave/leave_alternative_employee.dart';
import 'package:talent_link/src/domain/entities/leave/single_selection_button.dart';
import 'package:talent_link/src/domain/entities/request/request_payment_method.dart';
import 'package:talent_link/src/domain/entities/request/request_type.dart';
import 'package:talent_link/src/domain/usecase/all_fields_mandatory/get_all_fields_mandatory_use_case.dart';
import 'package:talent_link/src/domain/usecase/authentication/login/get_basic_salary_amount_use_case.dart';
import 'package:talent_link/src/domain/usecase/authentication/login/get_company_id_use_case.dart';
import 'package:talent_link/src/domain/usecase/authentication/login/get_employee_id_use_case.dart';
import 'package:talent_link/src/domain/usecase/authentication/login/get_total_allowance_use_case.dart';
import 'package:talent_link/src/domain/usecase/leave/calculate_in_case_new_leave_use_case.dart';
import 'package:talent_link/src/domain/usecase/leave/get_alternative_employee_use_case.dart';
import 'package:talent_link/src/domain/usecase/leave/get_leave_types_use_case.dart';
import 'package:talent_link/src/domain/usecase/leave/insert_leave_use_case.dart';
import 'package:talent_link/src/domain/usecase/leave/leave_validation_use_case.dart';
import 'package:talent_link/src/domain/usecase/payment_method/get_payment_method_use_case.dart';
import 'package:talent_link/src/presentation/screens/leave/utils/leave_content_value.dart';
import 'package:talent_link/src/presentation/screens/leave/utils/leave_error_massage.dart';
import 'package:talent_link/src/presentation/screens/leave/utils/leave_text_controller.dart';

part 'leave_event.dart';

part 'leave_state.dart';

class LeaveBloc extends Bloc<LeaveEvent, LeaveState> {
  final LeaveValidationUseCase _leaveValidationUseCase;
  final GetLeaveTypesUseCase _getLeaveTypesUseCase;
  final InsertLeaveUseCase _insertLeaveUseCase;
  final GetAlternativeEmployeeUseCase _getAlternativeEmployeeUseCase;
  final GetPaymentMethodUseCase _getPaymentMethodUseCase;
  final CalculateInCaseNewLeaveUseCase _calculateInCaseNewLeaveUseCase;
  final GetAllFieldsMandatoryUseCase _getAllFieldsMandatoryUseCase;
  final GetEmployeeIdUseCase _getEmployeeIdUseCase;
  final GetCompanyIdUseCase _getCompanyIdUseCase;
  final GetBasicSalaryAmountUseCase getBasicSalaryAmountUseCase;
  final GetTotalAllowanceUseCase getTotalAllowanceUseCase;

  LeaveBloc(
      this._leaveValidationUseCase,
      this._getLeaveTypesUseCase,
      this._insertLeaveUseCase,
      this._getAlternativeEmployeeUseCase,
      this._getPaymentMethodUseCase,
      this._calculateInCaseNewLeaveUseCase,
      this._getAllFieldsMandatoryUseCase,
      this._getEmployeeIdUseCase,
      this._getCompanyIdUseCase,
      this.getBasicSalaryAmountUseCase,
      this.getTotalAllowanceUseCase)
      : super(LeaveInitialState()) {
    on<LeaveBackEvent>(_onLeaveBackEvent);
    on<OpenTypeBottomSheetEvent>(_onOpenTypeBottomSheetEvent);
    on<OpenAlternativeEmployeeBottomSheetEvent>(
        _onOpenAlternativeEmployeeBottomSheetEvent);
    on<OpenPaymentMethodBottomSheetEvent>(_onOpenPaymentMethodBottomSheetEvent);
    on<SelectCheckBoxValueEvent>(_onSelectCheckBoxValueEvent);
    on<LeaveSubmitEvent>(_onLeaveSubmitEvent);
    on<SelectLeaveTypeEvent>(_onSelectLeaveTypeEvent);
    on<SelectPaymentMethodEvent>(_onSelectPaymentMethodEvent);
    on<SelectAlternativeEmployeeEvent>(_onSelectAlternativeEmployeeEvent);
    on<OpenUploadFileBottomSheetEvent>(_onOpenUploadFileBottomSheetEvent);
    on<LeaveOpenCameraEvent>(_onLeaveOpenCameraEvent);
    on<LeaveOpenGalleryEvent>(_onLeaveOpenGalleryEvent);
    on<LeaveOpenFileEvent>(_onLeaveOpenFileEvent);
    on<LeaveSelectFileEvent>(_onLeaveSelectFileEvent);
    on<LeaveDeleteFileEvent>(_onLeaveDeleteFileEvent);
    on<ValidateLeaveTypeEvent>(_onValidateLeaveTypeEvent);
    on<LeaveValidationStartDateEvent>(_onLeaveValidationStartDateEvent);
    on<LeaveValidationEndDateEvent>(_onLeaveValidationEndDateEvent);
    on<LeaveValidationPaymentMethodEvent>(_onLeaveValidationPaymentMethodEvent);
    on<LeaveValidationExpectedResumingDateEvent>(
        _onLeaveValidationExpectedResumingDateEvent);
    on<LeaveValidationContactNumberEvent>(_onLeaveValidationContactNumberEvent);
    on<LeaveValidationAddressDuringEvent>(_onLeaveValidationAddressDuringEvent);
    on<LeaveValidationAlternativeEmployeeEvent>(
        _onLeaveValidationAlternativeEmployeeEvent);
    on<LeaveValidationCurrantBalanceEvent>(
        _onLeaveValidationCurrantBalanceEvent);
    on<LeaveValidationYearlyBalanceEvent>(_onLeaveValidationYearlyBalanceEvent);
    on<LeaveValidationRemainingBalanceEvent>(
        _onLeaveValidationRemainingBalanceEvent);
    on<LeaveValidationLeaveDaysEvent>(_onLeaveValidationLeaveDaysEvent);
    on<LeaveValidationTotalAmountEvent>(_onLeaveValidationTotalAmountEvent);
    on<LeaveValidationLeaveReasonsEvent>(_onLeaveValidationLeaveReasonsEvent);
    on<LeaveValidationRemarksEvent>(_onLeaveValidationRemarksEvent);
    on<LeaveValidationFileEvent>(_onLeaveValidationFileEvent);
    on<CallLeaveTypesApiEvent>(_onCallLeaveTypesApiEvent);
    on<CallInsertLeaveApiEvent>(_onCallInsertLeaveApiEvent);
    on<GetLeaveAlternativeEmployeeEvent>(_onLeaveGetAlternativeEmployeeEvent);
    on<LeaveShowPaymentMethodTextFieldEvent>(
        _onLeaveShowPaymentMethodTextFieldEvent);
    on<GetLeavePaymentMethodEvent>(_onGetLeavePaymentMethodEvent);
    on<GetLeaveAllFieldsMandatoryEvent>(_onGetLeaveAllFieldsMandatoryEvent);
    on<LeaveCalculateInCaseNewLeaveEvent>(_onLeaveCalculateInCaseNewLeaveEvent);
  }

  LeaveErrorMassage leaveErrorMassage = LeaveErrorMassage();
  List<AllFieldsMandatory> _allFieldsMandatory = [];
  List<RequestType> _requestTypes = [];
  List<RequestPaymentMethod> _leavePaymentMethods = [];
  List<LeaveAlternativeEmployee> _leaveAlternativeEmployees = [];
  LeaveContentValue leaveContentValue = LeaveContentValue();
  RemoteCalculateInCaseNewLeave _remoteCalculateInCaseNewLeave =
      RemoteCalculateInCaseNewLeave();
  File _file = File("");

  FutureOr<void> _onLeaveBackEvent(
      LeaveBackEvent event, Emitter<LeaveState> emit) {
    emit(LeaveBackState());
  }

  FutureOr<void> _onOpenTypeBottomSheetEvent(
      OpenTypeBottomSheetEvent event, Emitter<LeaveState> emit) {
    emit(OpenTypeBottomSheetState());
  }

  FutureOr<void> _onOpenAlternativeEmployeeBottomSheetEvent(
      OpenAlternativeEmployeeBottomSheetEvent event, Emitter<LeaveState> emit) {
    emit(OpenAlternativeEmployeeBottomSheetState(
        isMandatory: event.isMandatory));
  }

  FutureOr<void> _onOpenPaymentMethodBottomSheetEvent(
      OpenPaymentMethodBottomSheetEvent event, Emitter<LeaveState> emit) {
    emit(OpenPaymentMethodBottomSheetState());
  }

  FutureOr<void> _onSelectCheckBoxValueEvent(
      SelectCheckBoxValueEvent event, Emitter<LeaveState> emit) {
    emit(SelectCheckBoxValueState(
      value: !event.value,
    ));
    if (event.value) {
      leaveContentValue.isCurrentBalance = 1;
    } else {
      leaveContentValue.isCurrentBalance = 0;
    }
  }

  FutureOr<void> _onLeaveSubmitEvent(
      LeaveSubmitEvent event, Emitter<LeaveState> emit) async {
    final validationsState = _leaveValidationUseCase.validateFormUseCase(
      startDate: event.startDate,
      endDate: event.endDate,
      expectedResumingDate: event.expectedResumingDate,
      allFieldsMandatory: _allFieldsMandatory,
      leaveTextEditingController: event.leaveTextEditingController,
      file: event.file,
      isVisiblePaymentMethod: event.isVisiblePaymentMethod,
    );
    if (validationsState.isNotEmpty) {
      for (var element in validationsState) {
        if (element == LeaveValidationState.typeEmpty) {
          emit(LeaveTypeEmptyState(
            validationMessage: S.current.thisFieldIsRequired,
          ));
        } else if (element == LeaveValidationState.startDateEmpty) {
          emit(LeaveStartDateEmptyState(
            validationMessage: S.current.thisFieldIsRequired,
          ));
        } else if (element == LeaveValidationState.endDateEmpty) {
          emit(LeaveEndDateEmptyState(
            validationMessage: S.current.thisFieldIsRequired,
          ));
        } else if (element == LeaveValidationState.paymentMethodEmpty) {
          emit(LeavePaymentMethodEmptyState(
            validationMessage: S.current.thisFieldIsRequired,
          ));
        } else if (element == LeaveValidationState.expectedResumingDateEmpty) {
          emit(LeaveExpectedResumingDateEmptyState(
            validationMessage: S.current.thisFieldIsRequired,
          ));
        } else if (element == LeaveValidationState.contactNumberEmpty) {
          emit(LeaveContactNumberEmptyState(
            validationMessage: S.current.thisFieldIsRequired,
          ));
        } else if (element == LeaveValidationState.addressDuringLeaveEmpty) {
          emit(LeaveAddressDuringEmptyState(
            validationMessage: S.current.thisFieldIsRequired,
          ));
        } else if (element == LeaveValidationState.alternativeEmployeeEmpty) {
          emit(LeaveAlternativeEmployeeEmptyState(
            validationMessage: S.current.thisFieldIsRequired,
          ));
        } else if (element == LeaveValidationState.currantBalanceEmpty) {
          emit(LeaveCurrentBalanceEmptyState(
            validationMessage: S.current.thisFieldIsRequired,
          ));
        } else if (element == LeaveValidationState.yearlyBalanceEmpty) {
          emit(LeaveYearlyBalanceEmptyState(
            validationMessage: S.current.thisFieldIsRequired,
          ));
        } else if (element == LeaveValidationState.remainingBalanceEmpty) {
          emit(LeaveRemainingBalanceEmptyState(
            validationMessage: S.current.thisFieldIsRequired,
          ));
        } else if (element == LeaveValidationState.leaveDaysEmpty) {
          emit(LeaveDaysEmptyState(
            validationMessage: S.current.thisFieldIsRequired,
          ));
        } else if (element == LeaveValidationState.totalAmountEmpty) {
          emit(LeaveTotalAmountEmptyState(
            validationMessage: S.current.thisFieldIsRequired,
          ));
        } else if (element == LeaveValidationState.leaveReasonsEmpty) {
          emit(LeaveReasonsEmptyState(
            validationMessage: S.current.thisFieldIsRequired,
          ));
        } else if (element == LeaveValidationState.remarksEmpty) {
          emit(LeaveRemarksEmptyState(
            validationMessage: S.current.thisFieldIsRequired,
          ));
        } else if (element == LeaveValidationState.fileEmpty) {
          emit(LeaveFileEmptyState(
            validationMessage: S.current.thisFieldIsRequired,
          ));
        } else if (element == LeaveValidationState.startDateNotValid) {
          emit(LeaveStartDateNotValidState(
              validationMessage: S.current.notValid));
        } else if (element == LeaveValidationState.endDateNotValid) {
          emit(
              LeaveEndDateNotValidState(validationMessage: S.current.notValid));
        } else if (element ==
            LeaveValidationState.expectedResumingDateNotValid) {
          emit(LeaveExpectedResumingDateNotValidState(
            validationMessage: S.current.notValid,
          ));
        }
      }
    } else {
      add(CallInsertLeaveApiEvent(
        leaveTextEditingController: event.leaveTextEditingController,
        leaveTypeId: event.leaveTypeId,
        startDate: event.startDate,
        expectedResumingDate: event.expectedResumingDate,
        file: event.file,
        endDate: event.endDate,
        leavePaymentMethod: event.leavePaymentMethod,
        alternativeEmployeeId: event.alternativeEmployeeId,
        isByPayroll: event.isByPayroll,
        isByCurrentBalance: event.isByCurrentBalance,
        isAllowYearlyBalance: event.isAllowYearlyBalance,
      ));
    }
  }

  FutureOr<void> _onSelectLeaveTypeEvent(
      SelectLeaveTypeEvent event, Emitter<LeaveState> emit) {
    emit(SelectLeaveTypeState(
      leaveType: event.leaveType,
    ));
    add(ValidateLeaveTypeEvent(value: event.leaveType.name));
    leaveContentValue.type = event.leaveType.id;
    add(LeaveCalculateInCaseNewLeaveEvent(
        leaveContentValue: leaveContentValue));
  }

  FutureOr<void> _onSelectPaymentMethodEvent(
      SelectPaymentMethodEvent event, Emitter<LeaveState> emit) {
    leaveContentValue.payrollId = event.paymentMethod.id;
    emit(SelectPaymentMethodState(
      paymentMethod: event.paymentMethod,
    ));
    leaveContentValue.payrollId = 0;
    add(LeaveValidationPaymentMethodEvent(
        paymentMethod: event.paymentMethod.name,
        isVisiblePaymentMethod: event.isVisiblePaymentMethod));
  }

  FutureOr<void> _onSelectAlternativeEmployeeEvent(
      SelectAlternativeEmployeeEvent event, Emitter<LeaveState> emit) {
    emit(SelectAlternativeEmployeeState(
      alternativeEmployee: event.alternativeEmployee,
    ));
    add(LeaveValidationAlternativeEmployeeEvent(
        alternativeEmployee: event.alternativeEmployee.name,
        isMandatory: event.isMandatory));
  }

  FutureOr<void> _onOpenUploadFileBottomSheetEvent(
      OpenUploadFileBottomSheetEvent event, Emitter<LeaveState> emit) {
    emit(OpenUploadFileBottomSheetState(isMandatory: event.isMandatory));
  }

  FutureOr<void> _onLeaveOpenCameraEvent(
      LeaveOpenCameraEvent event, Emitter<LeaveState> emit) {
    emit(LeaveOpenCameraState(isMandatory: event.isMandatory));
  }

  FutureOr<void> _onLeaveOpenGalleryEvent(
      LeaveOpenGalleryEvent event, Emitter<LeaveState> emit) {
    emit(LeaveOpenGalleryState(isMandatory: event.isMandatory));
  }

  FutureOr<void> _onLeaveOpenFileEvent(
      LeaveOpenFileEvent event, Emitter<LeaveState> emit) {
    emit(LeaveOpenFileState(isMandatory: event.isMandatory));
  }

  FutureOr<void> _onLeaveSelectFileEvent(
      LeaveSelectFileEvent event, Emitter<LeaveState> emit) {
    emit(LeaveSelectFileState(filePath: event.filePath));
    _file = File(event.filePath);
    add(LeaveValidationFileEvent(
        file: event.filePath, isMandatory: event.isMandatory));
  }

  FutureOr<void> _onLeaveDeleteFileEvent(
      LeaveDeleteFileEvent event, Emitter<LeaveState> emit) {
    emit(LeaveDeleteFileState(filePath: ''));
    add(LeaveValidationFileEvent(file: '', isMandatory: event.isMandatory));
  }

  FutureOr<void> _onValidateLeaveTypeEvent(
      ValidateLeaveTypeEvent event, Emitter<LeaveState> emit) {
    LeaveValidationState leaveValidationState =
        _leaveValidationUseCase.validateType(event.value);
    if (leaveValidationState == LeaveValidationState.valid) {
      emit(LeaveTypeValidState());
    } else {
      emit(LeaveTypeEmptyState(
        validationMessage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onLeaveValidationStartDateEvent(
      LeaveValidationStartDateEvent event, Emitter<LeaveState> emit) async {
    LeaveValidationState leaveValidationState = _leaveValidationUseCase
        .validateStartDate(event.startDate, event.endDate);
    LeaveValidationState validationDateWithExpected =
        _leaveValidationUseCase.validateEndDate(
            event.endDate, event.startDate, event.expectedResumingDate);
    if (leaveValidationState == LeaveValidationState.valid) {
      leaveContentValue.startDate = event.startDate;
      emit(LeaveStartDateValidState(leaveContentValue: leaveContentValue));
    } else if (leaveValidationState == LeaveValidationState.startDateNotValid) {
      emit(LeaveStartDateNotValidState(validationMessage: S.current.notValid));
    } else if (validationDateWithExpected ==
        LeaveValidationState.endDateNotValid) {
      emit(LeaveEndDateNotValidState(validationMessage: S.current.notValid));
    } else if (validationDateWithExpected ==
        LeaveValidationState.expectedResumingDateNotValid) {
      emit(LeaveExpectedResumingDateNotValidState(
          validationMessage: S.current.notValid));
    } else {
      leaveContentValue.startDate = '';
      emit(LeaveStartDateEmptyState(
        validationMessage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onLeaveValidationEndDateEvent(
      LeaveValidationEndDateEvent event, Emitter<LeaveState> emit) async {
    LeaveValidationState leaveValidationState =
        _leaveValidationUseCase.validateEndDate(
            event.endDate, event.startDate, event.expectedResumingDate);
    if (leaveValidationState == LeaveValidationState.valid) {
      leaveContentValue.endDate = event.endDate;
      add(LeaveCalculateInCaseNewLeaveEvent(
          leaveContentValue: leaveContentValue));
      emit(LeaveEndDateValidState());
    } else if (leaveValidationState == LeaveValidationState.endDateNotValid) {
      emit(LeaveEndDateNotValidState(validationMessage: S.current.notValid));
    } else if (leaveValidationState ==
        LeaveValidationState.expectedResumingDateNotValid) {
      emit(LeaveExpectedResumingDateNotValidState(
          validationMessage: S.current.notValid));
      add(LeaveCalculateInCaseNewLeaveEvent(
          leaveContentValue: leaveContentValue));
    } else {
      leaveContentValue.endDate = "";
      emit(LeaveEndDateEmptyState(
        validationMessage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onLeaveValidationPaymentMethodEvent(
      LeaveValidationPaymentMethodEvent event, Emitter<LeaveState> emit) {
    LeaveValidationState leaveValidationState =
        _leaveValidationUseCase.validatePaymentMethod(
            event.paymentMethod, event.isVisiblePaymentMethod);
    if (leaveValidationState == LeaveValidationState.valid) {
      emit(LeavePaymentMethodValidState());
    } else {
      emit(LeavePaymentMethodEmptyState(
        validationMessage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onLeaveValidationExpectedResumingDateEvent(
      LeaveValidationExpectedResumingDateEvent event,
      Emitter<LeaveState> emit) async {
    LeaveValidationState leaveValidationState =
        _leaveValidationUseCase.validateExpectedResumingDate(
            event.expectedResumingDate, event.isMandatory, event.endDate);
    if (leaveValidationState == LeaveValidationState.valid) {
      leaveContentValue.expectedResumingData = event.expectedResumingDate;
      emit(LeaveExpectedResumingDateValidState());
    } else if (leaveValidationState ==
        LeaveValidationState.expectedResumingDateNotValid) {
      emit(LeaveExpectedResumingDateNotValidState(
        validationMessage: S.current.notValid,
      ));
    } else {
      leaveContentValue.expectedResumingData = '';
      emit(LeaveExpectedResumingDateEmptyState(
        validationMessage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onLeaveValidationContactNumberEvent(
      LeaveValidationContactNumberEvent event, Emitter<LeaveState> emit) {
    LeaveValidationState leaveValidationState = _leaveValidationUseCase
        .validateContactNumber(event.contactNumber, event.isMandatory);
    if (leaveValidationState == LeaveValidationState.valid) {
      leaveContentValue.contactNo = event.contactNumber;
      emit(LeaveContactNumberValidState());
    } else {
      leaveContentValue.contactNo = '';
      emit(LeaveContactNumberEmptyState(
        validationMessage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onLeaveValidationAddressDuringEvent(
      LeaveValidationAddressDuringEvent event, Emitter<LeaveState> emit) {
    LeaveValidationState leaveValidationState = _leaveValidationUseCase
        .validateAddressDuring(event.addressDuring, event.isMandatory);
    if (leaveValidationState == LeaveValidationState.valid) {
      leaveContentValue.addressDuringLeave = event.addressDuring;
      emit(LeaveAddressDuringValidState());
    } else {
      leaveContentValue.addressDuringLeave = '';
      emit(LeaveAddressDuringEmptyState(
        validationMessage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onLeaveValidationAlternativeEmployeeEvent(
      LeaveValidationAlternativeEmployeeEvent event, Emitter<LeaveState> emit) {
    LeaveValidationState leaveValidationState =
        _leaveValidationUseCase.validateAlternativeEmployee(
            event.alternativeEmployee, event.isMandatory);
    if (leaveValidationState == LeaveValidationState.valid) {
      emit(LeaveAlternativeEmployeeValidState());
    } else {
      emit(LeaveAlternativeEmployeeEmptyState(
        validationMessage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onLeaveValidationCurrantBalanceEvent(
      LeaveValidationCurrantBalanceEvent event, Emitter<LeaveState> emit) {
    LeaveValidationState leaveValidationState = _leaveValidationUseCase
        .validateCurrantBalance(event.currantBalance, event.isMandatory);
    if (leaveValidationState == LeaveValidationState.valid) {
      leaveContentValue.currentBalance = event.currantBalance;
      emit(LeaveCurrantBalanceValidState());
    } else {
      leaveContentValue.currentBalance = '';
      emit(LeaveCurrentBalanceEmptyState(
        validationMessage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onLeaveValidationYearlyBalanceEvent(
      LeaveValidationYearlyBalanceEvent event, Emitter<LeaveState> emit) {
    LeaveValidationState leaveValidationState = _leaveValidationUseCase
        .validateYearlyBalance(event.yearlyBalance, event.isMandatory);
    if (leaveValidationState == LeaveValidationState.valid) {
      leaveContentValue.yearlyBalance = event.yearlyBalance;
      emit(LeaveYearlyBalanceValidState());
    } else {
      leaveContentValue.yearlyBalance = '';
      emit(LeaveYearlyBalanceEmptyState(
        validationMessage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onLeaveValidationRemainingBalanceEvent(
      LeaveValidationRemainingBalanceEvent event, Emitter<LeaveState> emit) {
    LeaveValidationState leaveValidationState = _leaveValidationUseCase
        .validateRemainingBalance(event.remainingBalance, event.isMandatory);
    if (leaveValidationState == LeaveValidationState.valid) {
      leaveContentValue.remainingBalance = event.remainingBalance;
      emit(LeaveRemainingBalanceValidState());
    } else {
      leaveContentValue.remainingBalance = '';
      emit(LeaveRemainingBalanceEmptyState(
        validationMessage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onLeaveValidationLeaveDaysEvent(
      LeaveValidationLeaveDaysEvent event, Emitter<LeaveState> emit) {
    LeaveValidationState leaveValidationState = _leaveValidationUseCase
        .validateLeaveDays(event.leaveDays, event.isMandatory);
    if (leaveValidationState == LeaveValidationState.valid) {
      leaveContentValue.leaveDays = event.leaveDays;
      emit(LeaveDaysValidState());
    } else {
      leaveContentValue.leaveDays = '';
      emit(LeaveDaysEmptyState(
        validationMessage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onLeaveValidationTotalAmountEvent(
      LeaveValidationTotalAmountEvent event, Emitter<LeaveState> emit) {
    LeaveValidationState leaveValidationState = _leaveValidationUseCase
        .validateTotalAmount(event.totalAmount, event.isMandatory);
    if (leaveValidationState == LeaveValidationState.valid) {
      leaveContentValue.totalAmount = event.totalAmount;
      emit(LeaveTotalAmountValidState());
    } else {
      leaveContentValue.totalAmount = '';
      emit(LeaveTotalAmountEmptyState(
        validationMessage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onLeaveValidationLeaveReasonsEvent(
      LeaveValidationLeaveReasonsEvent event, Emitter<LeaveState> emit) {
    LeaveValidationState leaveValidationState = _leaveValidationUseCase
        .validateLeaveReasons(event.leaveReasons, event.isMandatory);
    if (leaveValidationState == LeaveValidationState.valid) {
      leaveContentValue.leaveReasons = event.leaveReasons;
      emit(LeaveReasonsValidState());
    } else {
      leaveContentValue.leaveReasons = '';
      emit(LeaveReasonsEmptyState(
        validationMessage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onLeaveValidationRemarksEvent(
      LeaveValidationRemarksEvent event, Emitter<LeaveState> emit) {
    LeaveValidationState leaveValidationState = _leaveValidationUseCase
        .validateRemarks(event.remarks, event.isMandatory);
    if (leaveValidationState == LeaveValidationState.valid) {
      leaveContentValue.remarks = event.remarks;
      emit(LeaveRemarksValidState());
    } else {
      leaveContentValue.remarks = '';
      emit(LeaveRemarksEmptyState(
        validationMessage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onLeaveValidationFileEvent(
      LeaveValidationFileEvent event, Emitter<LeaveState> emit) {
    LeaveValidationState leaveValidationState =
        _leaveValidationUseCase.validateFile(event.file, event.isMandatory);
    if (leaveValidationState == LeaveValidationState.valid) {
      leaveContentValue.file = event.file;
      emit(LeaveFileValidState());
    } else {
      leaveContentValue.file = '';
      emit(LeaveFileEmptyState(
        validationMessage: S.current.thisFieldIsRequired,
      ));
    }
  }

  Future<void> _onCallLeaveTypesApiEvent(
      CallLeaveTypesApiEvent event, Emitter<LeaveState> emit) async {
    emit(LeaveLoadingState());
    DataState dataState = await _getLeaveTypesUseCase(
        employeeId: await _getEmployeeIdUseCase() ?? 0);
    if (dataState is DataSuccess<List<RequestType>>) {
      _requestTypes = dataState.data!;
      emit(CallLeaveTypesApiSuccessState(requestTypes: _requestTypes));
    } else {
      emit(CallLeaveTypesApiErrorState(
          errorMassage: dataState.error!.error.toString()));
    }
  }

  Future<void> _onCallInsertLeaveApiEvent(
      CallInsertLeaveApiEvent event, Emitter<LeaveState> emit) async {
    emit(LeaveLoadingState());
    InsertLeaveRequest insertLeaveRequest = InsertLeaveRequest(
      id: 0,
      addressDuringLeave:
          event.leaveTextEditingController.addressDuringLeaveController.text,
      alternativeEmployeeId: "${event.alternativeEmployeeId}",
      currentBalance: event
              .leaveTextEditingController.currentBalanceController.text
              .trim()
              .isEmpty
          ? double.parse(event.leaveTextEditingController
                      .currentBalanceController.text !=
                  'null'
              ? event.leaveTextEditingController.currentBalanceController.text
              : "0.0")
          : 0,
      leaveEndDate: event.endDate,
      leaveReason: event.leaveTextEditingController.leaveReasonsController.text,
      leaveStartDate: event.startDate,
      leaveTypeId: event.leaveTypeId,
      paymentMethodId: event.leavePaymentMethod,
      expectedResumeDuty: event.expectedResumingDate,
      remarks: event.leaveTextEditingController.remarksController.text,
      emergencyContactNo:
          event.leaveTextEditingController.contactNoController.text,
      isByPayroll: event.isByPayroll,
      isByCurrentBalance: event.isByCurrentBalance,
      remainingBalance: event.isByCurrentBalance == 0
          ? double.parse(event
                  .leaveTextEditingController.remainingBalanceController.text)
              .toInt()
          : int.parse(
              event.leaveTextEditingController.remainingBalanceController.text),
      leaveDays: int.tryParse(
              event.leaveTextEditingController.leaveDaysController.text) ??
          0,
      totalAmount: double.parse(
              event.leaveTextEditingController.totalAmountController.text)
          .toInt(),
      yearlyBalance: double.parse(
          event.leaveTextEditingController.yearlyBalanceController.text !=
                  'null'
              ? event.leaveTextEditingController.yearlyBalanceController.text
              : '0'),
      allowancesAmount: await getTotalAllowanceUseCase() ?? 0,
      employeeId: await _getEmployeeIdUseCase() ?? 0,
      basicSalaryAmount: await getBasicSalaryAmountUseCase() ?? 0,
      companyId: await _getCompanyIdUseCase() ?? 0,
      extendedEmployeeLeaveId: 0,
      isAllowYearlyBalance: event.isAllowYearlyBalance,
      isExtendedLeave: 0,
      transactionStatusId: 1,
      transactionStatusName: "",
      wfId: 0,
    );
    DataState dataState =
        await _insertLeaveUseCase(request: insertLeaveRequest, file: _file);
    if (dataState is DataSuccess<TalentLinkResponse>) {
      emit(InsertLeaveSuccessState(
          successMassage: dataState.data!.responseMessage.toString()));
    } else {
      emit(InsertLeaveErrorState(errorMassage: dataState.toString()));
    }
  }

  FutureOr<void> _onLeaveGetAlternativeEmployeeEvent(
      GetLeaveAlternativeEmployeeEvent event, Emitter<LeaveState> emit) async {
    emit(LeaveLoadingState());
    DataState dataState = await _getAlternativeEmployeeUseCase();
    if (dataState is DataSuccess<List<LeaveAlternativeEmployee>>) {
      _leaveAlternativeEmployees = dataState.data!;
      emit(GetLeaveAlternativeEmployeeSuccessState(
          alternativeEmployees: _leaveAlternativeEmployees));
    } else {
      emit(GetLeaveAlternativeEmployeeErrorState(
          errorMassage: dataState.error!.error.toString()));
    }
  }

  FutureOr<void> _onLeaveShowPaymentMethodTextFieldEvent(
      LeaveShowPaymentMethodTextFieldEvent event, Emitter<LeaveState> emit) {
    if (event.singleSelectionModel.id == 0) {
      leaveContentValue.payrollId = 0;
      emit(LeaveShowPaymentMethodTextFieldState(isVisiblePaymentMethod: false));
    } else {
      leaveContentValue.payrollId = 1;
      emit(LeaveShowPaymentMethodTextFieldState(isVisiblePaymentMethod: true));
    }
    add(LeaveCalculateInCaseNewLeaveEvent(
        leaveContentValue: leaveContentValue));
  }

  FutureOr<void> _onGetLeavePaymentMethodEvent(
      GetLeavePaymentMethodEvent event, Emitter<LeaveState> emit) async {
    emit(LeaveLoadingState());
    DataState dataState = await _getPaymentMethodUseCase();
    if (dataState is DataSuccess<List<RequestPaymentMethod>>) {
      _leavePaymentMethods = dataState.data!;
      emit(GetLeavePaymentMethodSuccessState(
          paymentMethods: _leavePaymentMethods));
    } else {
      emit(GetLeavePaymentMethodErrorState(
          errorMassage: dataState.error!.error.toString()));
    }
  }

  FutureOr<void> _onGetLeaveAllFieldsMandatoryEvent(
      GetLeaveAllFieldsMandatoryEvent event, Emitter<LeaveState> emit) async {
    emit(LeaveLoadingState());
    DataState dataState = await _getAllFieldsMandatoryUseCase(
        requestTypeId: event.requestTypeId, requestData: event.requestData);
    if (dataState is DataSuccess<List<AllFieldsMandatory>>) {
      _allFieldsMandatory = dataState.data!;
      emit(GetLeaveAllFieldsMandatorySuccessState(
          allFieldsMandatory: _allFieldsMandatory));
    } else {
      emit(GetLeaveAllFieldsMandatoryErrorState(
          errorMassage: dataState.error!.error.toString()));
    }
  }

  FutureOr<void> _onLeaveCalculateInCaseNewLeaveEvent(
      LeaveCalculateInCaseNewLeaveEvent event, Emitter<LeaveState> emit) async {
    if (leaveContentValue.type != 0 &&
        leaveContentValue.startDate.isNotEmpty &&
        leaveContentValue.endDate.isNotEmpty) {
      emit(LeaveLoadingState());
      DataState dataState = await _calculateInCaseNewLeaveUseCase.call(
          calculateInCaseNewLeaveRequest: CalculateInCaseNewLeaveRequest(
        employeeId: await _getEmployeeIdUseCase(),
        leaveTypeId: event.leaveContentValue.type,
        fromDate: event.leaveContentValue.startDate,
        toDate: event.leaveContentValue.endDate,
        isByPayroll: event.leaveContentValue.payrollId,
      ));
      if (dataState
          is DataSuccess<TalentLinkResponse<RemoteCalculateInCaseNewLeave>>) {
        emit(CalculateInCaseLeaveSuccessState(
            remoteCalculateInCaseNewLeave: dataState.data!.result!));
        _remoteCalculateInCaseNewLeave = dataState.data!.result!;
        if (_remoteCalculateInCaseNewLeave.mainStatus == false) {
          emit(CalculateInCaseLeaveErrorState(
              errorMassage: dataState
                  .data!.result!.employeeLeaveBalanceResponse!.message
                  .toString()));
        }
      } else {
        emit(CalculateInCaseLeaveErrorState(
            errorMassage: dataState.message.toString()));
      }
    }
  }
}
