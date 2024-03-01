import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/core/utils/validation/indemnity_encashment_validator.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/indemnity_encashment/model/remote_calculate_in_case_indemnity_encashment.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/indemnity_encashment/model/remote_get_employee_indemnity_encashment_details.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/indemnity_encashment/request/calculate_in_case_indemnity_encashment_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/indemnity_encashment/request/get_employee_indemnity_encashment_details_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/indemnity_encashment/request/insert_indemnity_encashment_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_response.dart';
import 'package:talent_link/src/domain/entities/all_fields/all_fields_mandatory.dart';
import 'package:talent_link/src/domain/entities/leave/single_selection_button.dart';
import 'package:talent_link/src/domain/entities/request/request_payment_method.dart';
import 'package:talent_link/src/domain/usecase/all_fields_mandatory/get_all_fields_mandatory_use_case.dart';
import 'package:talent_link/src/domain/usecase/authentication/login/get_basic_salary_amount_use_case.dart';
import 'package:talent_link/src/domain/usecase/authentication/login/get_company_id_use_case.dart';
import 'package:talent_link/src/domain/usecase/authentication/login/get_employee_id_use_case.dart';
import 'package:talent_link/src/domain/usecase/authentication/login/get_total_allowance_use_case.dart';
import 'package:talent_link/src/domain/usecase/indemnity_encashment/calculate_in_case_indemnity_encashment_use_case.dart';
import 'package:talent_link/src/domain/usecase/indemnity_encashment/get_indemnity_employee_use_case.dart';
import 'package:talent_link/src/domain/usecase/indemnity_encashment/indemnity_encashment_validation_use_case.dart';
import 'package:talent_link/src/domain/usecase/indemnity_encashment/insert_indemnity_encashment_use_case.dart';
import 'package:talent_link/src/domain/usecase/payment_method/get_payment_method_use_case.dart';
import 'package:talent_link/src/presentation/screens/indemnity_encashment/utils/indemnity_encashment_controller.dart';

part 'indemnity_encashment_event.dart';

part 'indemnity_encashment_state.dart';

class IndemnityEncashmentBloc
    extends Bloc<IndemnityEncashmentEvent, IndemnityEncashmentState> {
  final IndemnityEncashmentValidationUseCase
      _indemnityEncashmentValidationUseCase;
  final GetPaymentMethodUseCase _getPaymentMethodUseCase;
  final InsertIndemnityEncashmentUseCase _insertIndemnityEncashmentUseCase;
  final GetIndemnityEmployeeUseCase _getIndemnityEmployeeUseCase;
  final GetEmployeeIdUseCase _getEmployeeIdUseCase;
  final GetCompanyIdUseCase _getCompanyIdUseCase;
  final GetAllFieldsMandatoryUseCase _getAllFieldsMandatoryUseCase;
  final CalculateInCaseIndemnityEncashmentUseCase
      _calculateInCaseIndemnityEncashmentUseCase;
  final GetBasicSalaryAmountUseCase getBasicSalaryAmountUseCase;
  final GetTotalAllowanceUseCase getTotalAllowanceUseCase;

  IndemnityEncashmentBloc(
      this._indemnityEncashmentValidationUseCase,
      this._getPaymentMethodUseCase,
      this._insertIndemnityEncashmentUseCase,
      this._getIndemnityEmployeeUseCase,
      this._getEmployeeIdUseCase,
      this._getCompanyIdUseCase,
      this._getAllFieldsMandatoryUseCase,
      this._calculateInCaseIndemnityEncashmentUseCase,
      this.getBasicSalaryAmountUseCase,
      this.getTotalAllowanceUseCase)
      : super(IndemnityEncashmentInitialState()) {
    on<IndemnityEncashmentBackEvent>(_onIndemnityEncashmentBackEvent);
    on<IndemnityEncashmentOpenPaymentMethodBottomSheetEvent>(
        _onIndemnityEncashmentOpenPaymentMethodBottomSheetEvent);
    on<IndemnityEncashmentValidationRemarksEvent>(
        _onIndemnityEncashmentValidationRemarksEvent);
    on<IndemnityEncashmentDeleteFileEvent>(
        _onIndemnityEncashmentDeleteFileEvent);
    on<IndemnityEncashmentOpenUploadFileEvent>(
        _onIndemnityEncashmentOpenUploadFileEvent);
    on<IndemnityEncashmentValidationRequestedDaysEvent>(
        _onIndemnityEncashmentValidationRequestedDaysEvent);
    on<IndemnityEncashmentValidationPaymentMonthEvent>(
        _onIndemnityEncashmentValidationPaymentMonthEvent);
    on<IndemnityEncashmentValidationRequestedDateEvent>(
        _onIndemnityEncashmentValidationRequestedDateEvent);
    on<IndemnityEncashmentSelectFileEvent>(
        _onIndemnityEncashmentSelectFileEvent);
    on<IndemnityEncashmentSelectPaymentMethodEvent>(
        _onIndemnityEncashmentSelectPaymentMethodEvent);
    on<IndemnityEncashmentOpenCameraEvent>(
        _onIndemnityEncashmentOpenCameraEvent);
    on<IndemnityEncashmentOpenGalleryEvent>(
        _onIndemnityEncashmentOpenGalleryEvent);
    on<IndemnityEncashmentOpenFileEvent>(_onIndemnityEncashmentOpenFileEvent);
    on<IndemnityEncashmentSubmitEvent>(_onIndemnityEncashmentSubmitEvent);
    on<IndemnityEncashmentValidationPaymentMethodEvent>(
        _onIndemnityEncashmentValidationPaymentMethodEvent);
    on<IndemnityEncashmentValidationFileEvent>(
        _onIndemnityEncashmentValidationFileEvent);
    on<IndemnityEncashmentGetPaymentMethodEvent>(
        _onIndemnityEncashmentGetPaymentMethodEvent);
    on<GetIndemnityEmployeeEvent>(_onGetIndemnityEmployeeEvent);
    on<GetIndemnityAllFieldsMandatory>(_onGetIndemnityAllFieldsMandatory);
    on<IndemnityEncashmentShowPaymentMethodTextFieldEvent>(
        _onIndemnityEncashmentShowPaymentMethodTextFieldEvent);
  }

  List<AllFieldsMandatory> _allFieldsMandatory = [];
  List<RequestPaymentMethod> _indemnityEncashmentPaymentMethods = [];
  RemoteGetEmployeeIndemnityEncashmentDetails
      _remoteGetEmployeeIndemnityEncashmentDetails =
      RemoteGetEmployeeIndemnityEncashmentDetails();
  RemoteCalculateInCaseIndemnityEncashment
      _remoteCalculateInCaseIndemnityEncashment =
      RemoteCalculateInCaseIndemnityEncashment();

  FutureOr<void> _onIndemnityEncashmentBackEvent(
      IndemnityEncashmentBackEvent event,
      Emitter<IndemnityEncashmentState> emit) {
    emit(IndemnityEncashmentBackState());
  }

  FutureOr<void> _onIndemnityEncashmentOpenPaymentMethodBottomSheetEvent(
      IndemnityEncashmentOpenPaymentMethodBottomSheetEvent event,
      Emitter<IndemnityEncashmentState> emit) {
    emit(IndemnityEncashmentOpenPaymentMethodBottomSheetState());
  }

  FutureOr<void> _onIndemnityEncashmentValidationRemarksEvent(
      IndemnityEncashmentValidationRemarksEvent event,
      Emitter<IndemnityEncashmentState> emit) {
    IndemnityEncashmentValidationState leaveValidationState =
        _indemnityEncashmentValidationUseCase.validateRemarks(
            event.value, event.isMandatory);
    if (leaveValidationState == IndemnityEncashmentValidationState.valid) {
      emit(IndemnityEncashmentValidationRemarksValidState());
    } else {
      emit(IndemnityEncashmentValidationRemarksEmptyState(
        validationMassage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onIndemnityEncashmentDeleteFileEvent(
      IndemnityEncashmentDeleteFileEvent event,
      Emitter<IndemnityEncashmentState> emit) {
    emit(IndemnityEncashmentDeleteFileState(
      value: '',
    ));
    add(IndemnityEncashmentValidationFileEvent(
        value: '', isMandatory: event.isMandatory));
  }

  FutureOr<void> _onIndemnityEncashmentOpenUploadFileEvent(
      IndemnityEncashmentOpenUploadFileEvent event,
      Emitter<IndemnityEncashmentState> emit) {
    emit(
        IndemnityEncashmentOpenUploadFileState(isMandatory: event.isMandatory));
  }

  FutureOr<void> _onIndemnityEncashmentValidationRequestedDaysEvent(
      IndemnityEncashmentValidationRequestedDaysEvent event,
      Emitter<IndemnityEncashmentState> emit) {
    IndemnityEncashmentValidationState leaveValidationState =
        _indemnityEncashmentValidationUseCase.validateRequestedDays(
            event.value, event.maximDays);
    if (leaveValidationState == IndemnityEncashmentValidationState.valid) {
      emit(IndemnityEncashmentValidationRequestedDaysValidState());
    } else if (leaveValidationState ==
        IndemnityEncashmentValidationState.requestedDaysNotValid) {
      emit(IndemnityEncashmentValidationRequestedDaysNotValidState(
        validationMassage: "${S.current.maximumDaysIs} ${event.maximDays}",
      ));
    } else {
      emit(IndemnityEncashmentValidationRequestedDaysEmptyState(
        validationMassage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onIndemnityEncashmentValidationPaymentMonthEvent(
      IndemnityEncashmentValidationPaymentMonthEvent event,
      Emitter<IndemnityEncashmentState> emit) {
    IndemnityEncashmentValidationState leaveValidationState =
        _indemnityEncashmentValidationUseCase.validatePaymentMonth(event.value);
    if (leaveValidationState == IndemnityEncashmentValidationState.valid) {
      emit(IndemnityEncashmentValidationPaymentMonthValidState());
    } else {
      emit(IndemnityEncashmentValidationPaymentMonthEmptyState(
        validationMassage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onIndemnityEncashmentValidationRequestedDateEvent(
      IndemnityEncashmentValidationRequestedDateEvent event,
      Emitter<IndemnityEncashmentState> emit) {
    IndemnityEncashmentValidationState leaveValidationState =
        _indemnityEncashmentValidationUseCase.validateRequestDate(event.value);
    if (leaveValidationState == IndemnityEncashmentValidationState.valid) {
      emit(IndemnityEncashmentValidationRequestedDateValidState());
    } else if (leaveValidationState ==
        IndemnityEncashmentValidationState.requestedDaysNotValid) {
      emit(IndemnityEncashmentValidationRequestedDaysNotValidState(
        validationMassage: S.current.maximumDaysIs80,
      ));
    } else {
      emit(IndemnityEncashmentValidationRequestedDateEmptyState(
        validationMassage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onIndemnityEncashmentSelectFileEvent(
      IndemnityEncashmentSelectFileEvent event,
      Emitter<IndemnityEncashmentState> emit) {
    emit(IndemnityEncashmentSelectFileState(value: event.value));
    add(IndemnityEncashmentValidationFileEvent(
        value: event.value, isMandatory: event.isMandatory));
  }

  FutureOr<void> _onIndemnityEncashmentSelectPaymentMethodEvent(
      IndemnityEncashmentSelectPaymentMethodEvent event,
      Emitter<IndemnityEncashmentState> emit) {
    emit(IndemnityEncashmentSelectPaymentMethodState(value: event.value));
  }

  FutureOr<void> _onIndemnityEncashmentOpenCameraEvent(
      IndemnityEncashmentOpenCameraEvent event,
      Emitter<IndemnityEncashmentState> emit) {
    emit(IndemnityEncashmentOpenCameraState(isMandatory: event.isMandatory));
  }

  FutureOr<void> _onIndemnityEncashmentOpenGalleryEvent(
      IndemnityEncashmentOpenGalleryEvent event,
      Emitter<IndemnityEncashmentState> emit) {
    emit(IndemnityEncashmentOpenGalleryState(isMandatory: event.isMandatory));
  }

  FutureOr<void> _onIndemnityEncashmentOpenFileEvent(
      IndemnityEncashmentOpenFileEvent event,
      Emitter<IndemnityEncashmentState> emit) {
    emit(IndemnityEncashmentOpenFileState(isMandatory: event.isMandatory));
  }

  FutureOr<void> _onIndemnityEncashmentSubmitEvent(
      IndemnityEncashmentSubmitEvent event,
      Emitter<IndemnityEncashmentState> emit) async {
    final validationsState =
        _indemnityEncashmentValidationUseCase.validateFormUseCase(
      file: event.file,
      requestedDate: event.requestedDate,
      paymentMonth: event.paymentMonth,
      allFieldsMandatory: event.allFieldsMandatory,
      indemnityEncashmentController: event.indemnityEncashmentController,
      maximDays: event.maximDays,
      isVisiblePaymentMethod: event.isVisiblePaymentMethod,
    );
    if (validationsState.isNotEmpty) {
      for (var element in validationsState) {
        if (element == IndemnityEncashmentValidationState.requestDateEmpty) {
          emit(IndemnityEncashmentValidationRequestedDateEmptyState(
            validationMassage: S.current.thisFieldIsRequired,
          ));
        } else if (element ==
            IndemnityEncashmentValidationState.requestedDaysEmpty) {
          emit(IndemnityEncashmentValidationRequestedDaysEmptyState(
            validationMassage: S.current.thisFieldIsRequired,
          ));
        } else if (element ==
            IndemnityEncashmentValidationState.requestedDaysNotValid) {
          emit(IndemnityEncashmentValidationRequestedDaysNotValidState(
            validationMassage: S.current.thisFieldIsRequired,
          ));
        } else if (element ==
            IndemnityEncashmentValidationState.paymentMonthEmpty) {
          emit(IndemnityEncashmentValidationPaymentMonthEmptyState(
            validationMassage: S.current.thisFieldIsRequired,
          ));
        } else if (element ==
            IndemnityEncashmentValidationState.paymentMethodEmpty) {
          emit(IndemnityEncashmentValidationPaymentMethodEmptyState(
            validationMassage: S.current.thisFieldIsRequired,
          ));
        } else if (element == IndemnityEncashmentValidationState.remarksEmpty) {
          emit(IndemnityEncashmentValidationRemarksEmptyState(
            validationMassage: S.current.thisFieldIsRequired,
          ));
        } else if (element == IndemnityEncashmentValidationState.fileEmpty) {
          emit(IndemnityEncashmentValidationFileEmptyState(
            validationMassage: S.current.thisFieldIsRequired,
          ));
        }
      }
    } else {
      emit(IndemnityEncashmentLoadingState());
      DataState dataState =
          await _calculateInCaseIndemnityEncashmentUseCase.call(
              request: CalculateInCaseIndemnityEncashmentRequest(
        employeeId: await _getEmployeeIdUseCase() ?? 0,
        toDate: event.requestedDate,
        requestedDays:
            int.parse(event.indemnityEncashmentController.requestedDays.text),
        startDate: event.paymentMonth,
      ));
      if (dataState is DataSuccess<
          TalentLinkResponse<RemoteCalculateInCaseIndemnityEncashment>>) {
        _remoteCalculateInCaseIndemnityEncashment = dataState.data!.result!;
        if (_remoteCalculateInCaseIndemnityEncashment.status == false) {
          emit(CalculateInCaseIndemnityErrorState(
              errorMessage: dataState.data!.result!.message.toString()));
        } else {
          emit(IndemnityEncashmentLoadingState());
          InsertIndemnityEncashmentRequest insertIndemnityEncashmentRequest =
              InsertIndemnityEncashmentRequest(
            id: 0,
            employeeId: await _getEmployeeIdUseCase() ?? 0,
            companyId: await _getCompanyIdUseCase() ?? 0,
            paymentMethodId: event.paymentMethodId,
            remarks: event.indemnityEncashmentController.remarks.text,
            isByPayroll: event.isByPayroll,
            salaryMonth: _remoteCalculateInCaseIndemnityEncashment
                    .validateMonthYearDto!.salaryMonth ??
                0,
            salaryYear: _remoteCalculateInCaseIndemnityEncashment
                    .validateMonthYearDto!.salaryYear ??
                0,
            indemnityEncashmentId:
                _remoteGetEmployeeIndemnityEncashmentDetails.id!,
            totalAmount: 0,
            allowancesAmount: await getTotalAllowanceUseCase() ?? 0,
            basicSalaryAmount: await getBasicSalaryAmountUseCase() ?? 0,
            requestedDays: int.parse(
                event.indemnityEncashmentController.requestedDays.text),
            transactionStatusId: 1,
            requestedDate: event.requestedDate,
            workFlowId: 0,
            indemnityAmount: _remoteCalculateInCaseIndemnityEncashment
                        .indemnityEncashmentPolicyOutputs!.indemnityAmount ==
                    null
                ? 0
                : double.tryParse(_remoteCalculateInCaseIndemnityEncashment
                        .indemnityEncashmentPolicyOutputs!.indemnityAmount
                        .toString())!
                    .toInt(),
            indemnityDays: _remoteCalculateInCaseIndemnityEncashment
                        .indemnityEncashmentPolicyOutputs!.indemnityDays ==
                    null
                ? 0
                : double.tryParse(_remoteCalculateInCaseIndemnityEncashment
                        .indemnityEncashmentPolicyOutputs!.indemnityDays
                        .toString())!
                    .toInt(),
            indemnityServiceDays: _remoteCalculateInCaseIndemnityEncashment
                        .indemnityEncashmentPolicyOutputs!
                        .indemnityServiceDays ==
                    null
                ? 0
                : double.tryParse(_remoteCalculateInCaseIndemnityEncashment
                        .indemnityEncashmentPolicyOutputs!.indemnityServiceDays
                        .toString())!
                    .toInt(),
          );
          DataState dataState = await _insertIndemnityEncashmentUseCase(
              request: insertIndemnityEncashmentRequest,
              file: File(event.file));
          if (dataState is DataSuccess<TalentLinkResponse>) {
            emit(IndemnityEncashmentSubmitSuccessState(
                successMassage: dataState.data!.responseMessage.toString()));
          } else {
            emit(IndemnityEncashmentSubmitErrorState(
                errorMessage: dataState.toString()));
          }
        }
      } else {
        emit(CalculateInCaseIndemnityErrorState(
            errorMessage: dataState.message.toString()));
      }
    }
  }

  FutureOr<void> _onIndemnityEncashmentValidationPaymentMethodEvent(
      IndemnityEncashmentValidationPaymentMethodEvent event,
      Emitter<IndemnityEncashmentState> emit) {
    IndemnityEncashmentValidationState leaveValidationState =
        _indemnityEncashmentValidationUseCase.validatePaymentMethod(
            event.value, event.isVisiblePaymentMethod);
    if (leaveValidationState == IndemnityEncashmentValidationState.valid) {
      emit(IndemnityEncashmentValidationPaymentMethodValidState());
    } else {
      emit(IndemnityEncashmentValidationPaymentMethodEmptyState(
        validationMassage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onIndemnityEncashmentValidationFileEvent(
      IndemnityEncashmentValidationFileEvent event,
      Emitter<IndemnityEncashmentState> emit) {
    IndemnityEncashmentValidationState leaveValidationState =
        _indemnityEncashmentValidationUseCase.validateFile(
            event.value, event.isMandatory);
    if (leaveValidationState == IndemnityEncashmentValidationState.valid) {
      emit(IndemnityEncashmentValidationFileValidState());
    } else {
      emit(IndemnityEncashmentValidationFileEmptyState(
        validationMassage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onIndemnityEncashmentGetPaymentMethodEvent(
      IndemnityEncashmentGetPaymentMethodEvent event,
      Emitter<IndemnityEncashmentState> emit) async {
    emit(IndemnityEncashmentLoadingState());
    DataState dataState = await _getPaymentMethodUseCase();
    if (dataState is DataSuccess<List<RequestPaymentMethod>>) {
      _indemnityEncashmentPaymentMethods = dataState.data!;
      emit(IndemnityEncashmentGetPaymentMethodSuccessState(
          paymentMethods: _indemnityEncashmentPaymentMethods));
    } else {
      emit(IndemnityEncashmentGetPaymentMethodErrorState(
          errorMassage: dataState.error!.error.toString()));
    }
  }

  FutureOr<void> _onGetIndemnityEmployeeEvent(GetIndemnityEmployeeEvent event,
      Emitter<IndemnityEncashmentState> emit) async {
    emit(IndemnityEncashmentLoadingState());
    DataState dataState = await _getIndemnityEmployeeUseCase(
        request: GetEmployeeIndemnityEncashmentDetailsRequest(
            employeeId: await _getEmployeeIdUseCase() ?? 0));
    if (dataState
        is DataSuccess<List<RemoteGetEmployeeIndemnityEncashmentDetails>>) {
      _remoteGetEmployeeIndemnityEncashmentDetails = dataState.data![0];
      emit(GetIndemnityEmployeeSuccessState(
          remoteGetEmployeeIndemnityEncashmentDetails:
              _remoteGetEmployeeIndemnityEncashmentDetails));
    } else {
      emit(GetIndemnityEmployeeErrorState(
          errorMessage: dataState.error!.error.toString()));
    }
  }

  FutureOr<void> _onGetIndemnityAllFieldsMandatory(
      GetIndemnityAllFieldsMandatory event,
      Emitter<IndemnityEncashmentState> emit) async {
    emit(IndemnityEncashmentLoadingState());
    DataState dataState = await _getAllFieldsMandatoryUseCase(
        requestTypeId: event.requestTypeId, requestData: event.requestData);
    if (dataState is DataSuccess<List<AllFieldsMandatory>>) {
      _allFieldsMandatory = dataState.data!;
      emit(GetIndemnityAllFieldsMandatorySuccessState(
          allFieldsMandatory: _allFieldsMandatory));
    } else {
      emit(GetIndemnityAllFieldsMandatoryErrorState(
          errorMessage: dataState.error!.error.toString()));
    }
  }

  FutureOr<void> _onIndemnityEncashmentShowPaymentMethodTextFieldEvent(
      IndemnityEncashmentShowPaymentMethodTextFieldEvent event,
      Emitter<IndemnityEncashmentState> emit) {
    if (event.singleSelectionModel.id == 0) {
      emit(IndemnityEncashmentShowPaymentMethodTextFieldState(
          isVisiblePaymentMethod: false));
    } else {
      emit(IndemnityEncashmentShowPaymentMethodTextFieldState(
          isVisiblePaymentMethod: true));
    }
  }
}
