part of 'leave_encashment_details_bloc.dart';

@immutable
abstract class LeaveEncashmentDetailsEvent {}

class GetLeaveEncashmentDetailsEvent extends LeaveEncashmentDetailsEvent {
  final int transactionId;

  GetLeaveEncashmentDetailsEvent({required this.transactionId});
}

class LeaveEncashmentDetailsApproveEvent extends LeaveEncashmentDetailsEvent {
  final int transactionId;
  final int employeeId;
  final int referenceId;

  LeaveEncashmentDetailsApproveEvent({
    required this.transactionId,
    required this.employeeId,
    required this.referenceId,
  });
}

class LeaveEncashmentDetailsRejectEvent extends LeaveEncashmentDetailsEvent {
  final int transactionId;
  final int employeeId;
  final int referenceId;

  LeaveEncashmentDetailsRejectEvent({
    required this.transactionId,
    required this.employeeId,
    required this.referenceId,
  });
}
