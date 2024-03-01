part of 'air_ticket_bloc.dart';

@immutable
abstract class AirTicketState extends Equatable {
  @override
  List<Object?> get props => [identityHashCode(this)];
}

class AirTicketInitialState extends AirTicketState {}

class InsertAirTicketSuccessState extends AirTicketState {
  DataState dataState;

  InsertAirTicketSuccessState({required this.dataState});
}

class InsertAirTicketIErrorState extends AirTicketState {
  String errorMessage;

  InsertAirTicketIErrorState({required this.errorMessage});
}

class GetAirTicketByEmployeeSuccessState extends AirTicketState {
  GetAirTicketByEmployee getAirTicketByEmployee;

  GetAirTicketByEmployeeSuccessState({required this.getAirTicketByEmployee});
}

class GetAirTicketByEmployeeErrorState extends AirTicketState {
  String errorMessage;

  GetAirTicketByEmployeeErrorState({required this.errorMessage});
}

class CalculateInCaseAirTicketSuccessState extends AirTicketState {
  CalculateInCaseAirTicket calculateInCaseAirTicket;

  CalculateInCaseAirTicketSuccessState(
      {required this.calculateInCaseAirTicket});
}

class CalculateInCaseAirTicketErrorState extends AirTicketState {
  String errorMessage;

  CalculateInCaseAirTicketErrorState({required this.errorMessage});
}

class AirTicketLoadingState extends AirTicketState {}

class AirTicketBackState extends AirTicketState {}

class AirTicketOpenPaymentMethodBottomSheetState extends AirTicketState {}

class AirTicketSelectPaymentMethodState extends AirTicketState {
  final RequestPaymentMethod paymentMethod;

  AirTicketSelectPaymentMethodState({required this.paymentMethod});
}

class AirTicketShowPaymentMethodTextFieldState extends AirTicketState {
  final bool visiblePaymentMethod;

  AirTicketShowPaymentMethodTextFieldState(
      {required this.visiblePaymentMethod});
}

class AirTicketValidationPaymentMethodValidState extends AirTicketState {}

class AirTicketValidationPaymentMethodEmptyState extends AirTicketState {
  final String validationMassage;

  AirTicketValidationPaymentMethodEmptyState({required this.validationMassage});
}

class AirTicketSubmitSuccessState extends AirTicketState {
  final String successMassage;

  AirTicketSubmitSuccessState({required this.successMassage});
}

class AirTicketGetPaymentMethodSuccessState extends AirTicketState {
  final List<RequestPaymentMethod> paymentMethod;

  AirTicketGetPaymentMethodSuccessState({
    required this.paymentMethod,
  });
}

class AirTicketGetPaymentMethodErrorState extends AirTicketState {
  final String errorMessage;

  AirTicketGetPaymentMethodErrorState({
    required this.errorMessage,
  });
}

class GetDependentAirTicketSuccessState extends AirTicketState {
  final List<AirTicket> airTickets;

  GetDependentAirTicketSuccessState({
    required this.airTickets,
  });
}

class GetDependentAirTicketErrorState extends AirTicketState {
  final String errorMessage;

  GetDependentAirTicketErrorState({
    required this.errorMessage,
  });
}

class AirTicketValidationRequestDateValidState extends AirTicketState {}

class AirTicketValidationRequestDateNotValidState extends AirTicketState {
  final String validationMessage;

  AirTicketValidationRequestDateNotValidState({
    required this.validationMessage,
  });
}

class AirTicketValidationAirTicketDueMonthValidState extends AirTicketState {}

class AirTicketValidationAirTicketDueMonthNotValidState extends AirTicketState {
  final String validationMessage;

  AirTicketValidationAirTicketDueMonthNotValidState({
    required this.validationMessage,
  });
}

class AirTicketValidationAirTicketDueYearValidState extends AirTicketState {}

class AirTicketValidationAirTicketDueYearNotValidState extends AirTicketState {
  final String validationMessage;

  AirTicketValidationAirTicketDueYearNotValidState({
    required this.validationMessage,
  });
}
