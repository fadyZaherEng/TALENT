part of 'air_ticket_details_bloc.dart';

@immutable
abstract class AirTicketDetailsEvent {}

class GetAirTicketDetailsEvent extends AirTicketDetailsEvent {
  final int transactionId;

  GetAirTicketDetailsEvent({required this.transactionId});
}

class AirTicketApproveDetailsEvent extends AirTicketDetailsEvent {
  final int transactionId;
  final int employeeId;
  final int referenceId;

  AirTicketApproveDetailsEvent({
    required this.transactionId,
    required this.employeeId,
    required this.referenceId,
  });
}

class AirTicketDetailsRejectEvent extends AirTicketDetailsEvent {
  final int transactionId;
  final int employeeId;
  final int referenceId;

  AirTicketDetailsRejectEvent({
    required this.transactionId,
    required this.employeeId,
    required this.referenceId,
  });
}
