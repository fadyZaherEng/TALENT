part of 'air_ticket_bloc.dart';

@immutable
abstract class AirTicketEvent extends Equatable {
  @override
  List<Object?> get props => [identityHashCode(this)];
}

class AirTicketBackEvent extends AirTicketEvent {}

class AirTicketOpenPaymentMethodBottomSheetEvent extends AirTicketEvent {}

class AirTicketSelectPaymentMethodEvent extends AirTicketEvent {
  final RequestPaymentMethod paymentMethod;

  AirTicketSelectPaymentMethodEvent({required this.paymentMethod});
}

class AirTicketSubmitEvent extends AirTicketEvent {
  final AirTicketController airTicketController;
  final bool isVisiblePaymentMethod;
  final String requestedDate;
  final String airTicketDueMonth;
  final String airTicketDueYear;
  final int isByPayroll;

  AirTicketSubmitEvent({
    required this.airTicketController,
    required this.isVisiblePaymentMethod,
    required this.requestedDate,
    required this.isByPayroll,
    required this.airTicketDueMonth,
    required this.airTicketDueYear,
  });
}

class AirTicketShowPaymentMethodTextFieldEvent extends AirTicketEvent {
  final SingleSelectionModel singleSelectionModel;

  AirTicketShowPaymentMethodTextFieldEvent(
      {required this.singleSelectionModel});
}

class AirTicketValidationPaymentMethodEvent extends AirTicketEvent {
  final String value;
  final bool isVisible;

  AirTicketValidationPaymentMethodEvent({
    required this.value,
    required this.isVisible,
  });
}

class GetPaymentAirTicketMethodEvent extends AirTicketEvent {}

class GetDependentAirTicketEvent extends AirTicketEvent {}

class GetAirTicketByEmployeeEvent extends AirTicketEvent {}

class InsertAirTicketEvent extends AirTicketEvent {
  GetAirTicketByEmployee getAirTicketByEmployee;
  int serviceDays;
  int ticketAmount;

  InsertAirTicketEvent(
      {required this.getAirTicketByEmployee,
      required this.serviceDays,
      required this.ticketAmount});
}

class AirTicketValidationRequestDateEvent extends AirTicketEvent {
  final String value;

  AirTicketValidationRequestDateEvent({
    required this.value,
  });
}

class AirTicketValidationTicketDueMontEvent extends AirTicketEvent {
  final String value;

  AirTicketValidationTicketDueMontEvent({
    required this.value,
  });
}

class AirTicketValidationTicketDueYearEvent extends AirTicketEvent {
  final String value;

  AirTicketValidationTicketDueYearEvent({
    required this.value,
  });
}
