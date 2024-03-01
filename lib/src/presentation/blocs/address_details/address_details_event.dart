part of 'address_details_bloc.dart';

@immutable
abstract class AddressDetailsEvent {}

class GetAddressDetailsEvent extends AddressDetailsEvent {
  final int transactionId;

  GetAddressDetailsEvent({required this.transactionId});
}

class AddressDetailsApproveEvent extends AddressDetailsEvent {
  final int transactionId;
  final int employeeId;
  final int referenceId;

  AddressDetailsApproveEvent({
    required this.transactionId,
    required this.employeeId,
    required this.referenceId,
  });
}

class AddressDetailsRejectEvent extends AddressDetailsEvent {
  final int transactionId;
  final int employeeId;
  final int referenceId;

  AddressDetailsRejectEvent({
    required this.transactionId,
    required this.employeeId,
    required this.referenceId,
  });
}
