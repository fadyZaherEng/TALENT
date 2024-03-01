part of 'contact_details_bloc.dart';

@immutable
abstract class ContactDetailsEvent {}

class GetContactDetailsEvent extends ContactDetailsEvent {
  final int transactionId;

  GetContactDetailsEvent({required this.transactionId});
}

class ContactDetailsApproveEvent extends ContactDetailsEvent {
  final int transactionId;
  final int employeeId;
  final int referenceId;

  ContactDetailsApproveEvent({
    required this.transactionId,
    required this.employeeId,
    required this.referenceId,
  });
}

class ContactDetailsRejectEvent extends ContactDetailsEvent {
  final int transactionId;
  final int employeeId;
  final int referenceId;

  ContactDetailsRejectEvent({
    required this.transactionId,
    required this.employeeId,
    required this.referenceId,
  });
}
