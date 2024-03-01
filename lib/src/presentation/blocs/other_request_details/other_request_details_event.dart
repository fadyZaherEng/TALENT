part of 'other_request_details_bloc.dart';

@immutable
abstract class OtherRequestDetailsEvent {}

class GetOtherRequestDetailsEvent extends OtherRequestDetailsEvent {
  final int transactionId;

  GetOtherRequestDetailsEvent({required this.transactionId});
}

class OtherRequestDetailsApproveEvent extends OtherRequestDetailsEvent {
  final int transactionId;
  final int employeeId;
  final int referenceId;

  OtherRequestDetailsApproveEvent({
    required this.transactionId,
    required this.employeeId,
    required this.referenceId,
  });
}

class OtherRequestDetailsRejectEvent extends OtherRequestDetailsEvent {
  final int transactionId;
  final int employeeId;
  final int referenceId;

  OtherRequestDetailsRejectEvent({
    required this.transactionId,
    required this.employeeId,
    required this.referenceId,
  });
}
