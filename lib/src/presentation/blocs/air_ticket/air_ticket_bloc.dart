import 'dart:async';

import 'package:flutter/material.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/core/utils/validation/air_ticket_validator.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/air_ticket/request/insert_air_ticket_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_response.dart';
import 'package:talent_link/src/domain/entities/air_ticket/air_ticket.dart';
import 'package:talent_link/src/domain/entities/air_ticket/calculate_in_case_air_ticket.dart';
import 'package:talent_link/src/domain/entities/air_ticket/get_ait_ticket_by_employee.dart';
import 'package:talent_link/src/domain/entities/leave/single_selection_button.dart';
import 'package:talent_link/src/domain/entities/request/request_payment_method.dart';
import 'package:talent_link/src/domain/usecase/air_ticket/air_ticket_validation_use_case.dart';
import 'package:talent_link/src/domain/usecase/air_ticket/calculate_in_case_air_ticket_use_case.dart';
import 'package:talent_link/src/domain/usecase/air_ticket/get_air_ticket_by_employee_use_case.dart';
import 'package:talent_link/src/domain/usecase/air_ticket/get_dependent_use_case.dart';
import 'package:talent_link/src/domain/usecase/air_ticket/insert_air_ticket_use_case.dart';
import 'package:talent_link/src/domain/usecase/authentication/login/get_company_id_use_case.dart';
import 'package:talent_link/src/domain/usecase/authentication/login/get_employee_id_use_case.dart';
import 'package:talent_link/src/domain/usecase/authentication/login/get_number_of_digits_use_case.dart';
import 'package:talent_link/src/domain/usecase/home/get_currency_use_case.dart';
import 'package:talent_link/src/domain/usecase/payment_method/get_payment_method_use_case.dart';
import 'package:talent_link/src/presentation/screens/air_ticket/utils/air_ticket_controller.dart';

part 'air_ticket_event.dart';

part 'air_ticket_state.dart';

class AirTicketBloc extends Bloc<AirTicketEvent, AirTicketState> {
  final AirTicketValidationUseCase _airTicketValidationUseCase;
  final InsertAirTicketUseCase _insertAirTicketUseCase;
  final CalculateInCaseAirTicketUseCase _calculateInCaseAirTicketUseCase;
  final GetDependentUseCase _getDependentUseCase;
  final GetAirTicketByEmployeeUseCase _getAirTicketByEmployeeUseCase;
  final GetPaymentMethodUseCase _getPaymentMethodUseCase;
  final GetEmployeeIdUseCase _getEmployeeIdUseCase;
  final GetCompanyIdUseCase _getCompanyIdUseCase;
  final GetNumberOfDigitsUseCase _getNumberOfDigitsCase;
  final GetCurrencyUseCase _getCurrencyUseCase;

  AirTicketBloc(
    this._airTicketValidationUseCase,
    this._insertAirTicketUseCase,
    this._getDependentUseCase,
    this._getPaymentMethodUseCase,
    this._getAirTicketByEmployeeUseCase,
    this._getCompanyIdUseCase,
    this._calculateInCaseAirTicketUseCase,
    this._getEmployeeIdUseCase,
    this._getCurrencyUseCase,
    this._getNumberOfDigitsCase,
  ) : super(AirTicketInitialState()) {
    on<AirTicketBackEvent>(_onAirTicketBackEvent);
    on<InsertAirTicketEvent>(_onInsertAirTicketEvent);
    on<AirTicketOpenPaymentMethodBottomSheetEvent>(
        _onAirTicketOpenPaymentMethodBottomSheetEvent);
    on<AirTicketSelectPaymentMethodEvent>(_onAirTicketSelectPaymentMethodEvent);
    on<AirTicketSubmitEvent>(_onAirTicketSubmitEvent);
    on<AirTicketShowPaymentMethodTextFieldEvent>(
        _onAirTicketShowPaymentMethodTextFieldEvent);
    on<AirTicketValidationPaymentMethodEvent>(
        _onAirTicketValidationPaymentMethodEvent);
    on<GetPaymentAirTicketMethodEvent>(_onGetPaymentAirTicketMethodEvent);
    on<GetDependentAirTicketEvent>(_onGetDependentAirTicketEvent);
    on<AirTicketValidationRequestDateEvent>(
        _onAirTicketValidationRequestDateEvent);
    on<AirTicketValidationTicketDueMontEvent>(
        _onAirTicketValidationTicketDueMontEvent);
    on<AirTicketValidationTicketDueYearEvent>(
        _onAirTicketValidationTicketDueYearEvent);
    on<GetAirTicketByEmployeeEvent>(_onGetAirTicketByEmployeeEvent);
  }

  List<RequestPaymentMethod> _airTicketPaymentMethods = [];
  String? requestDate;
  RequestPaymentMethod? requestPaymentMethod;

  FutureOr<void> _onAirTicketBackEvent(
      AirTicketBackEvent event, Emitter<AirTicketState> emit) {
    emit(AirTicketBackState());
  }

  FutureOr<void> _onAirTicketOpenPaymentMethodBottomSheetEvent(
      AirTicketOpenPaymentMethodBottomSheetEvent event,
      Emitter<AirTicketState> emit) {
    emit(AirTicketOpenPaymentMethodBottomSheetState());
  }

  FutureOr<void> _onAirTicketSelectPaymentMethodEvent(
      AirTicketSelectPaymentMethodEvent event, Emitter<AirTicketState> emit) {
    requestPaymentMethod = event.paymentMethod;
    emit(AirTicketSelectPaymentMethodState(paymentMethod: event.paymentMethod));
  }

  FutureOr<void> _onAirTicketSubmitEvent(
      AirTicketSubmitEvent event, Emitter<AirTicketState> emit) async {
    final validationsState = _airTicketValidationUseCase.validateFormUseCase(
        requestedDate: event.requestedDate,
        airTicketController: event.airTicketController,
        airTicketDueMonth: event.airTicketDueMonth,
        airTicketDueYear: event.airTicketDueYear,
        isVisible: event.isVisiblePaymentMethod);
    if (validationsState.isNotEmpty) {
      for (var element in validationsState) {
        if (element == AirTicketValidationState.airTicketDueMonthEmpty) {
          emit(AirTicketValidationAirTicketDueMonthNotValidState(
            validationMessage: S.current.thisFieldIsRequired,
          ));
        }
        if (element == AirTicketValidationState.airTicketDueYearEmpty) {
          emit(AirTicketValidationAirTicketDueYearNotValidState(
            validationMessage: S.current.thisFieldIsRequired,
          ));
        }
        if (element == AirTicketValidationState.paymentMethodEmpty) {
          emit(AirTicketValidationPaymentMethodEmptyState(
            validationMassage: S.current.thisFieldIsRequired,
          ));
        }
        if (element == AirTicketValidationState.requestedDateEmpty) {
          emit(AirTicketValidationRequestDateNotValidState(
              validationMessage: S.current.thisFieldIsRequired));
        }
      }
    } else {
      emit(AirTicketLoadingState());
      DataState dataState = await _calculateInCaseAirTicketUseCase(
          employeeId: await _getEmployeeIdUseCase() ?? 0,
          requestedDate: requestDate ?? "");
      if (dataState is DataSuccess<CalculateInCaseAirTicket>) {
        emit(CalculateInCaseAirTicketSuccessState(
            calculateInCaseAirTicket: dataState.data!));
      } else {
        emit(CalculateInCaseAirTicketErrorState(
            errorMessage: dataState.message.toString()));
      }
    }
  }

  FutureOr<void> _onAirTicketShowPaymentMethodTextFieldEvent(
      AirTicketShowPaymentMethodTextFieldEvent event,
      Emitter<AirTicketState> emit) {
    if (event.singleSelectionModel.id == 0) {
      emit(AirTicketShowPaymentMethodTextFieldState(
          visiblePaymentMethod: false));
    } else {
      emit(
          AirTicketShowPaymentMethodTextFieldState(visiblePaymentMethod: true));
    }
  }

  FutureOr<void> _onAirTicketValidationPaymentMethodEvent(
      AirTicketValidationPaymentMethodEvent event,
      Emitter<AirTicketState> emit) {
    AirTicketValidationState airTicketValidationState =
        _airTicketValidationUseCase.validatePaymentMethod(
            event.value, event.isVisible);
    if (airTicketValidationState == AirTicketValidationState.valid) {
      emit(AirTicketValidationPaymentMethodValidState());
    } else {
      emit(AirTicketValidationPaymentMethodEmptyState(
        validationMassage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onGetPaymentAirTicketMethodEvent(
      GetPaymentAirTicketMethodEvent event,
      Emitter<AirTicketState> emit) async {
    emit(AirTicketLoadingState());
    DataState dataState = await _getPaymentMethodUseCase();
    if (dataState is DataSuccess<List<RequestPaymentMethod>>) {
      _airTicketPaymentMethods = dataState.data!;
      emit(AirTicketGetPaymentMethodSuccessState(
          paymentMethod: _airTicketPaymentMethods));
    } else {
      emit(AirTicketGetPaymentMethodErrorState(
          errorMessage: dataState.error!.error.toString()));
    }
  }

  FutureOr<void> _onGetDependentAirTicketEvent(
      GetDependentAirTicketEvent event, Emitter<AirTicketState> emit) async {
    emit(AirTicketLoadingState());
    DataState dataState = await _getDependentUseCase(
        employeeId: await _getEmployeeIdUseCase() ?? 0);
    if (dataState is DataSuccess<List<AirTicket>>) {
      emit(GetDependentAirTicketSuccessState(airTickets: dataState.data!));
    } else {
      emit(GetDependentAirTicketErrorState(
          errorMessage: dataState.message.toString()));
    }
  }

  FutureOr<void> _onAirTicketValidationRequestDateEvent(
      AirTicketValidationRequestDateEvent event, Emitter<AirTicketState> emit) {
    AirTicketValidationState airTicketValidationState =
        _airTicketValidationUseCase.validateRequestedDate(event.value);
    if (airTicketValidationState == AirTicketValidationState.valid) {
      emit(AirTicketValidationRequestDateValidState());
      requestDate = event.value;
    } else {
      emit(AirTicketValidationRequestDateNotValidState(
        validationMessage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onAirTicketValidationTicketDueMontEvent(
      AirTicketValidationTicketDueMontEvent event,
      Emitter<AirTicketState> emit) {
    AirTicketValidationState airTicketValidationState =
        _airTicketValidationUseCase.validateAirTicketDueMonth(event.value);
    if (airTicketValidationState == AirTicketValidationState.valid) {
      emit(AirTicketValidationAirTicketDueMonthValidState());
    } else {
      emit(AirTicketValidationAirTicketDueMonthNotValidState(
        validationMessage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onAirTicketValidationTicketDueYearEvent(
      AirTicketValidationTicketDueYearEvent event,
      Emitter<AirTicketState> emit) {
    AirTicketValidationState airTicketValidationState =
        _airTicketValidationUseCase.validateAirTicketDueYear(event.value);
    if (airTicketValidationState == AirTicketValidationState.valid) {
      emit(AirTicketValidationAirTicketDueYearValidState());
    } else {
      emit(AirTicketValidationAirTicketDueYearNotValidState(
        validationMessage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onGetAirTicketByEmployeeEvent(
      GetAirTicketByEmployeeEvent event, Emitter<AirTicketState> emit) async {
    emit(AirTicketLoadingState());
    DataState dataState = await _getAirTicketByEmployeeUseCase(
        employeeId: await _getEmployeeIdUseCase() ?? 0);
    if (dataState is DataSuccess<GetAirTicketByEmployee>) {
      emit(GetAirTicketByEmployeeSuccessState(
          getAirTicketByEmployee: dataState.data??GetAirTicketByEmployee()));
    } else {
      emit(GetAirTicketByEmployeeErrorState(
          errorMessage: dataState.message.toString()));
    }
  }

  FutureOr<void> _onInsertAirTicketEvent(
      InsertAirTicketEvent event, Emitter<AirTicketState> emit) async {
    emit(AirTicketLoadingState());
    DataState dataState = await _insertAirTicketUseCase(
        request: InsertAirTicketRequest(
      companyId: (await _getCompanyIdUseCase() ?? 0),
      employeeId: (await _getEmployeeIdUseCase() ?? 0),
      requestedDate: requestDate ?? "",
      airTicketDueMonth: event.getAirTicketByEmployee.dueTicketMonthId,
      airTicketDueYear: event.getAirTicketByEmployee.ticketYearId,
      isCalculateByServiceDays: 0,
      serviceDays: event.serviceDays,
      ticketOriginalAmount: event.getAirTicketByEmployee.ticketFixedAmount,
      ticketAmount: event.ticketAmount,
      isByPayroll: requestPaymentMethod == null ? 1 : 0,
      paymentMethodId: requestPaymentMethod?.id ?? 0,
      distinationId: event.getAirTicketByEmployee.distinationId,
      flightClassTypeId: event.getAirTicketByEmployee.flightClassTypeId,
      flightDirctionTypeId: event.getAirTicketByEmployee.flightDirctionTypeId,
      noOfDigits: (await _getNumberOfDigitsCase() ?? 0),
      currencyCode: (await _getCurrencyUseCase() ?? ''),
      remarks: "",
      transactionStatusId: 1,
      workFlowId: 0,
      id: 0,
    ));
    if (dataState is DataSuccess<TalentLinkResponse>) {
      emit(InsertAirTicketSuccessState(dataState: dataState));
    } else {
      emit(InsertAirTicketIErrorState(
          errorMessage: dataState.message.toString()));
    }
  }
}
