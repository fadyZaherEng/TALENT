import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/core/utils/validation/resume_duty_validator.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/resume_duty/model/remote_calculate_in_case_resume_duty.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/resume_duty/request/calculate_in_case_resume_duty_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/resume_duty/request/insert_resume_duty_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/resume_duty/request/resume_duty_reference_data_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_response.dart';
import 'package:talent_link/src/domain/entities/all_fields/all_fields_mandatory.dart';
import 'package:talent_link/src/domain/entities/leave/single_selection_button.dart';
import 'package:talent_link/src/domain/entities/request/request_payment_method.dart';
import 'package:talent_link/src/domain/entities/request/request_type.dart';
import 'package:talent_link/src/domain/usecase/all_fields_mandatory/get_all_fields_mandatory_use_case.dart';
import 'package:talent_link/src/domain/usecase/authentication/login/get_basic_salary_amount_use_case.dart';
import 'package:talent_link/src/domain/usecase/authentication/login/get_company_id_use_case.dart';
import 'package:talent_link/src/domain/usecase/authentication/login/get_employee_id_use_case.dart';
import 'package:talent_link/src/domain/usecase/authentication/login/get_number_of_digits_use_case.dart';
import 'package:talent_link/src/domain/usecase/authentication/login/get_total_allowance_use_case.dart';
import 'package:talent_link/src/domain/usecase/payment_method/get_payment_method_use_case.dart';
import 'package:talent_link/src/domain/usecase/resume_duty/calculate_in_case_resume_duty_use_case.dart';
import 'package:talent_link/src/domain/usecase/resume_duty/get_resume_duty_reference_data_use_case.dart';
import 'package:talent_link/src/domain/usecase/resume_duty/get_resume_duty_reference_types_use_case.dart';
import 'package:talent_link/src/domain/usecase/resume_duty/insert_resume_duty_use_case.dart';
import 'package:talent_link/src/domain/usecase/resume_duty/resume_duty_use_case.dart';
import 'package:talent_link/src/presentation/screens/resume_duty/utils/resume_duty_controller.dart';

part 'resume_duty_event.dart';

part 'resume_duty_state.dart';

class ResumeDutyBloc extends Bloc<ResumeDutyEvent, ResumeDutyState> {
  final ResumeDutyValidationUseCase _resumeDutyValidationUseCase;
  final GetResumeDutyReferenceTypesUseCase _getResumeDutyReferenceTypesUseCase;
  final GetPaymentMethodUseCase _getPaymentMethodUseCase;
  final GetResumeDutyReferenceDataUseCase _getResumeDutyReferenceDataUseCase;
  final GetAllFieldsMandatoryUseCase _getAllFieldsMandatoryUseCase;
  final InsertResumeDutyUseCase _insertResumeDutyUseCase;
  final GetEmployeeIdUseCase _getEmployeeIdUseCase;
  final GetCompanyIdUseCase _getCompanyIdUseCase;
  final CalculateInCaseResumeDutyUseCase _calculateInCaseResumeDutyUseCase;
  final GetNumberOfDigitsUseCase _getNumberOfDigitsUseCase;
  final GetBasicSalaryAmountUseCase getBasicSalaryAmountUseCase;
  final GetTotalAllowanceUseCase getTotalAllowanceUseCase;

  ResumeDutyBloc(
      this._resumeDutyValidationUseCase,
      this._getResumeDutyReferenceTypesUseCase,
      this._getPaymentMethodUseCase,
      this._getResumeDutyReferenceDataUseCase,
      this._getAllFieldsMandatoryUseCase,
      this._insertResumeDutyUseCase,
      this._getEmployeeIdUseCase,
      this._getCompanyIdUseCase,
      this._calculateInCaseResumeDutyUseCase,
      this._getNumberOfDigitsUseCase,
      this.getBasicSalaryAmountUseCase,
      this.getTotalAllowanceUseCase)
      : super(ResumeDutyInitialState()) {
    on<ResumeDutyBackEvent>(_onResumeDutyBackEvent);
    on<ResumeDutyOpenReferenceTypeBottomSheetEvent>(
        _onResumeDutyOpenReferenceTypeBottomSheetState);
    on<ResumeDutyOpenPaymentMethodBottomSheetEvent>(
        _onResumeDutyOpenPaymentMethodBottomSheetEvent);
    on<ResumeDutySelectReferenceTypeEvent>(
        _onResumeDutySelectReferenceTypeEvent);
    on<ResumeDutySelectReferenceDataEvent>(
        _onResumeDutySelectReferenceDataEvent);
    on<ResumeDutySelectPaymentMethodEvent>(
        _onResumeDutySelectPaymentMethodEvent);
    on<ResumeDutyOpenUploadFileBottomSheetEvent>(
        _onResumeDutyOpenUploadFileBottomSheetEvent);
    on<ResumeDutyOpenCameraEvent>(_onResumeDutyOpenCameraEvent);
    on<ResumeDutyOpenGalleryEvent>(_onResumeDutyOpenGalleryEvent);
    on<ResumeDutyOpenFileEvent>(_onResumeDutyOpenFileEvent);
    on<ResumeDutySelectFileEvent>(_onResumeDutySelectFileEvent);
    on<ResumeDutyDeleteFileEvent>(_onResumeDutyDeleteFileEvent);
    on<ResumeDutySubmitEvent>(_onResumeDutySubmitEvent);
    on<ResumeDutyValidationReferenceTypeEvent>(
        _onResumeDutyValidationReferenceTypeEvent);
    on<ResumeDutyValidationReferenceDataEvent>(
        _onResumeDutyValidationReferenceDataEvent);
    on<ResumeDutyValidationPaymentMethodEvent>(
        _onResumeDutyValidationPaymentMethodEvent);
    on<ResumeDutyValidationActualResumeDutyDateEvent>(
        _onResumeDutyValidationActualResumeDutyDateEvent);
    on<ResumeDutyValidationRemarksEvent>(_onResumeDutyValidationRemarksEvent);
    on<ResumeDutyValidationFileEvent>(_onResumeDutyValidationFileEvent);
    on<GetResumeDutyReferenceTypesEvent>(_onGetResumeDutyReferenceTypesEvent);
    on<GetResumeDutyPaymentMethodEvent>(_onGetResumeDutyPaymentMethodEvent);
    on<GetResumeDutyReferenceDataEvent>(_onGetResumeDutyReferenceDataEvent);
    on<ResumeDutyShowPaymentMethodTextFieldEvent>(
        _onResumeDutyShowPaymentMethodTextFieldEvent);
    on<GetResumeDutyAllFieldsMandatoryEvent>(
        _onGetResumeDutyAllFieldsMandatoryEvent);
  }

  List<RequestType> _referenceTypes = [];
  List<RequestPaymentMethod> _paymentMethods = [];

  List<AllFieldsMandatory> _allFieldsMandatory = [];

  RequestType _referencesData = RequestType(id: 0, name: '', isSelected: false);
  RemoteCalculateInCaseResumeDuty _remoteCalculateInCaseResumeDuty =
      RemoteCalculateInCaseResumeDuty();

  FutureOr<void> _onResumeDutyBackEvent(
      ResumeDutyBackEvent event, Emitter<ResumeDutyState> emit) {
    emit(ResumeDutyBackState());
  }

  FutureOr<void> _onResumeDutyOpenReferenceTypeBottomSheetState(
      ResumeDutyOpenReferenceTypeBottomSheetEvent event,
      Emitter<ResumeDutyState> emit) {
    emit(ResumeDutyOpenReferenceTypeBottomSheetState());
  }

  FutureOr<void> _onResumeDutySelectReferenceTypeEvent(
      ResumeDutySelectReferenceTypeEvent event, Emitter<ResumeDutyState> emit) {
    emit(ResumeDutySelectReferenceTypeState(requestType: event.requestType));
    add(ResumeDutyValidationReferenceTypeEvent(value: event.requestType.name));
    add(GetResumeDutyReferenceDataEvent(
        isByPayroll: event.isByPayroll,
        resumeDutyReferenceType: event.requestType.id));
  }

  FutureOr<void> _onResumeDutySelectReferenceDataEvent(
      ResumeDutySelectReferenceDataEvent event, Emitter<ResumeDutyState> emit) {
    emit(ResumeDutySelectReferenceDataState(requestType: event.requestType));
    add(ResumeDutyValidationReferenceDataEvent(value: event.requestType.name));
  }

  FutureOr<void> _onResumeDutyOpenPaymentMethodBottomSheetEvent(
      ResumeDutyOpenPaymentMethodBottomSheetEvent event,
      Emitter<ResumeDutyState> emit) {
    emit(ResumeDutyOpenPaymentMethodBottomSheetState());
  }

  FutureOr<void> _onResumeDutySelectPaymentMethodEvent(
      ResumeDutySelectPaymentMethodEvent event, Emitter<ResumeDutyState> emit) {
    emit(ResumeDutySelectPaymentMethodState(requestType: event.requestType));
    add(ResumeDutyValidationPaymentMethodEvent(
        value: event.requestType.name,
        isVisiblePaymentMethod: event.isVisiblePaymentMethod));
  }

  FutureOr<void> _onResumeDutyOpenUploadFileBottomSheetEvent(
      ResumeDutyOpenUploadFileBottomSheetEvent event,
      Emitter<ResumeDutyState> emit) {
    emit(ResumeDutyOpenUploadFileBottomSheetState(
      isMandatory: event.isMandatory,
    ));
  }

  FutureOr<void> _onResumeDutyOpenCameraEvent(
      ResumeDutyOpenCameraEvent event, Emitter<ResumeDutyState> emit) {
    emit(ResumeDutyOpenCameraState(isMandatory: event.isMandatory));
  }

  FutureOr<void> _onResumeDutyOpenGalleryEvent(
      ResumeDutyOpenGalleryEvent event, Emitter<ResumeDutyState> emit) {
    emit(ResumeDutyOpenGalleryState(isMandatory: event.isMandatory));
  }

  FutureOr<void> _onResumeDutyOpenFileEvent(
      ResumeDutyOpenFileEvent event, Emitter<ResumeDutyState> emit) {
    emit(ResumeDutyOpenFileState(isMandatory: event.isMandatory));
  }

  FutureOr<void> _onResumeDutySelectFileEvent(
      ResumeDutySelectFileEvent event, Emitter<ResumeDutyState> emit) {
    emit(ResumeDutySelectFileState(filePath: event.filePath));
    add(ResumeDutyValidationFileEvent(
        value: event.filePath, isMandatory: event.isMandatory));
  }

  FutureOr<void> _onResumeDutyDeleteFileEvent(
      ResumeDutyDeleteFileEvent event, Emitter<ResumeDutyState> emit) {
    emit(ResumeDutyDeleteFileState(filePath: ''));
    add(ResumeDutyValidationFileEvent(
        value: '', isMandatory: event.isMandatory));
  }

  FutureOr<void> _onResumeDutySubmitEvent(
      ResumeDutySubmitEvent event, Emitter<ResumeDutyState> emit) async {
    final validationsState = _resumeDutyValidationUseCase.validateFormUseCase(
        file: event.file,
        allFieldsMandatory: event.allFieldsMandatory,
        actualResumeDutyData: event.actualResumeDutyData,
        resumeDutyController: event.resumeDutyController,
        isVisiblePaymentMethod: event.isVisiblePaymentMethod);
    if (validationsState.isNotEmpty) {
      for (var element in validationsState) {
        if (element == ResumeDutyValidationState.referenceTypeEmpty) {
          emit(ResumeDutyValidationReferenceTypeEmptyState(
            validationMassage: S.current.thisFieldIsRequired,
          ));
        } else if (element == ResumeDutyValidationState.referenceDataEmpty) {
          emit(ResumeDutyValidationReferenceDataEmptyState(
            validationMassage: S.current.thisFieldIsRequired,
          ));
        } else if (element == ResumeDutyValidationState.paymentMethodEmpty) {
          emit(ResumeDutyValidationPaymentMethodEmptyState(
            validationMassage: S.current.thisFieldIsRequired,
          ));
        } else if (element ==
            ResumeDutyValidationState.actualResumeDutyDateEmpty) {
          emit(ResumeDutyValidationActualResumeDutyDateEmptyState(
            validationMassage: S.current.thisFieldIsRequired,
          ));
        } else if (element == ResumeDutyValidationState.remarksEmpty) {
          emit(ResumeDutyValidationRemarksEmptyState(
            validationMassage: S.current.thisFieldIsRequired,
          ));
        } else if (element == ResumeDutyValidationState.fileEmpty) {
          emit(ResumeDutyValidationFileEmptyState(
            validationMassage: S.current.thisFieldIsRequired,
          ));
        }
      }
    } else {
      emit(ResumeDutyLoadingState());
      DataState calculateInCaseResumeDuty =
          await _calculateInCaseResumeDutyUseCase(
              request: CalculateInCaseResumeDutyRequest(
        employeeId: await _getEmployeeIdUseCase() ?? 0,
        leaveTypeId: 1,
        isByPayroll: event.isByPayrollId,
        actualResumeDutyDate: event.actualResumeDutyData,
        expectedResumeDutyDate: event.actualResumeDutyData,
      ));
      if (calculateInCaseResumeDuty
          is DataSuccess<TalentLinkResponse<RemoteCalculateInCaseResumeDuty>>) {
        _remoteCalculateInCaseResumeDuty =
            calculateInCaseResumeDuty.data!.result!;
        if (_remoteCalculateInCaseResumeDuty.mainStatus == true) {
          InsertResumeDutyRequest insertResumeDutyRequest =
              InsertResumeDutyRequest(
            id: 0,
            companyId: await _getCompanyIdUseCase() ?? 0,
            employeeId: await _getEmployeeIdUseCase() ?? 0,
            isNewJoining: 1,
            isByPayroll: event.isByPayrollId,
            paymentMethodId: event.paymentMethodId,
            transactionStatusId: 1,
            remarks: event.resumeDutyController.remarks.text,
            workFlowId: 0,
            resumeDutyReferenceType: event.resumeDutyReferenceType,
            resumeDutyReferenceId: event.resumeDutyReferenceId,
            expectedResumeDutyDate: event.actualResumeDutyData,
            actualResumeDutyDate: event.actualResumeDutyData,
            resumeDutyTypeId: event.resumeDutyReferenceType,
            basicSalaryAmount: await getBasicSalaryAmountUseCase() ?? 0,
            allowancesAmount: await getTotalAllowanceUseCase() ?? 0,
            noOfDigits: await _getNumberOfDigitsUseCase() ?? 0,
          );
          DataState dataState = await _insertResumeDutyUseCase(
              request: insertResumeDutyRequest, file: File(event.file));
          if (dataState is DataSuccess<TalentLinkResponse>) {
            emit(ResumeDutySubmitSuccessState(
                successMassage: dataState.data!.responseMessage.toString()));
          } else {
            emit(
                ResumeDutySubmitErrorState(errorMessage: dataState.toString()));
          }
        } else {
          emit(CalculateInCaseResumeDutyErrorMessage(
              errorMessage:
                  _remoteCalculateInCaseResumeDuty.mainMassage.toString()));
        }
      } else {
        emit(ResumeDutySubmitErrorState(
            errorMessage: calculateInCaseResumeDuty.message.toString()));
      }
    }
  }

  FutureOr<void> _onResumeDutyValidationReferenceTypeEvent(
      ResumeDutyValidationReferenceTypeEvent event,
      Emitter<ResumeDutyState> emit) {
    ResumeDutyValidationState leaveValidationState =
        _resumeDutyValidationUseCase.validateReferenceType(event.value);
    if (leaveValidationState == ResumeDutyValidationState.valid) {
      emit(ResumeDutyValidationReferenceTypeValidState());
    } else {
      emit(ResumeDutyValidationReferenceTypeEmptyState(
        validationMassage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onResumeDutyValidationReferenceDataEvent(
      ResumeDutyValidationReferenceDataEvent event,
      Emitter<ResumeDutyState> emit) {
    ResumeDutyValidationState leaveValidationState =
        _resumeDutyValidationUseCase.validateReferenceData(event.value);
    if (leaveValidationState == ResumeDutyValidationState.valid) {
      emit(ResumeDutyValidationReferenceDataValidState());
    } else {
      emit(ResumeDutyValidationReferenceDataEmptyState(
        validationMassage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onResumeDutyValidationPaymentMethodEvent(
      ResumeDutyValidationPaymentMethodEvent event,
      Emitter<ResumeDutyState> emit) {
    ResumeDutyValidationState leaveValidationState =
        _resumeDutyValidationUseCase.validatePaymentMethod(
            event.value, event.isVisiblePaymentMethod);
    if (leaveValidationState == ResumeDutyValidationState.valid) {
      emit(ResumeDutyValidationPaymentMethodValidState());
    } else {
      emit(ResumeDutyValidationPaymentMethodEmptyState(
        validationMassage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onResumeDutyValidationActualResumeDutyDateEvent(
      ResumeDutyValidationActualResumeDutyDateEvent event,
      Emitter<ResumeDutyState> emit) {
    ResumeDutyValidationState leaveValidationState =
        _resumeDutyValidationUseCase.validateActualResumeDutyDate(event.value);
    if (leaveValidationState == ResumeDutyValidationState.valid) {
      emit(ResumeDutyValidationActualResumeDutyDateValidState());
    } else {
      emit(ResumeDutyValidationActualResumeDutyDateEmptyState(
        validationMassage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onResumeDutyValidationRemarksEvent(
      ResumeDutyValidationRemarksEvent event, Emitter<ResumeDutyState> emit) {
    ResumeDutyValidationState leaveValidationState =
        _resumeDutyValidationUseCase.validateRemarks(
            event.value, event.isMandatory);
    if (leaveValidationState == ResumeDutyValidationState.valid) {
      emit(ResumeDutyValidationRemarksValidState());
    } else {
      emit(ResumeDutyValidationRemarksEmptyState(
        validationMassage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onResumeDutyValidationFileEvent(
      ResumeDutyValidationFileEvent event, Emitter<ResumeDutyState> emit) {
    ResumeDutyValidationState leaveValidationState =
        _resumeDutyValidationUseCase.validateFile(
            event.value, event.isMandatory);
    if (leaveValidationState == ResumeDutyValidationState.valid) {
      emit(ResumeDutyValidationFileValidState());
    } else {
      emit(ResumeDutyValidationFileEmptyState(
        validationMassage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onGetResumeDutyReferenceTypesEvent(
      GetResumeDutyReferenceTypesEvent event,
      Emitter<ResumeDutyState> emit) async {
    emit(ResumeDutyLoadingState());
    DataState dataState = await _getResumeDutyReferenceTypesUseCase();
    if (dataState is DataSuccess<List<RequestType>>) {
      _referenceTypes = dataState.data!;
      emit(GetResumeDutyReferenceTypesSuccessState(
          requestTypes: _referenceTypes));
    } else {
      emit(GetResumeDutyReferenceTypesErrorState(
          errorMassage: dataState.error!.error.toString()));
    }
  }

  FutureOr<void> _onGetResumeDutyPaymentMethodEvent(
      GetResumeDutyPaymentMethodEvent event,
      Emitter<ResumeDutyState> emit) async {
    emit(ResumeDutyLoadingState());
    DataState dataState = await _getPaymentMethodUseCase();
    if (dataState is DataSuccess<List<RequestPaymentMethod>>) {
      _paymentMethods = dataState.data!;
      emit(GetResumeDutyPaymentMethodSuccessState(
          paymentMethods: _paymentMethods));
    } else {
      emit(GetResumeDutyPaymentMethodsErrorState(
          errorMassage: dataState.error!.error.toString()));
    }
  }

  FutureOr<void> _onGetResumeDutyReferenceDataEvent(
      GetResumeDutyReferenceDataEvent event,
      Emitter<ResumeDutyState> emit) async {
    emit(ResumeDutyLoadingState());
    DataState dataState = await _getResumeDutyReferenceDataUseCase(
        request: ResumeDutyReferenceDataRequest(
            isByPayroll: event.isByPayroll,
            resumeDutyReferenceType: event.resumeDutyReferenceType));
    if (dataState is DataSuccess<RequestType>) {
      _referencesData = dataState.data!;
      emit(
          GetResumeDutyReferenceDataSuccessState(requestType: _referencesData));
    } else {
      emit(GetResumeDutyReferenceDataErrorState(
          errorMassage: dataState.error!.error.toString()));
    }
  }

  FutureOr<void> _onResumeDutyShowPaymentMethodTextFieldEvent(
      ResumeDutyShowPaymentMethodTextFieldEvent event,
      Emitter<ResumeDutyState> emit) {
    if (event.selectionModel.id == 0) {
      emit(ResumeDutyShowPaymentMethodTextFieldState(
          isVisiblePaymentMethod: false));
    } else {
      emit(ResumeDutyShowPaymentMethodTextFieldState(
          isVisiblePaymentMethod: true));
    }
  }

  FutureOr<void> _onGetResumeDutyAllFieldsMandatoryEvent(
      GetResumeDutyAllFieldsMandatoryEvent event,
      Emitter<ResumeDutyState> emit) async {
    emit(ResumeDutyLoadingState());
    DataState dataState = await _getAllFieldsMandatoryUseCase(
        requestTypeId: event.requestTypeId, requestData: event.requestData);
    if (dataState is DataSuccess<List<AllFieldsMandatory>>) {
      _allFieldsMandatory = dataState.data!;
      emit(GetResumeDutyAllFieldsMandatorySuccessState(
          allFieldsMandatory: _allFieldsMandatory));
    } else {
      emit(GetResumeDutyAllFieldsMandatoryErrorState(
          errorMessage: dataState.error!.error.toString()));
    }
  }
}
