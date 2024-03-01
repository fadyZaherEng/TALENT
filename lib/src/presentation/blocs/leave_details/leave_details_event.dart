part of 'leave_details_bloc.dart';

@immutable
abstract class LeaveDetailsEvent {}

class GetLeaveDetailsEvent extends LeaveDetailsEvent {
  final int transactionId;

  GetLeaveDetailsEvent({
    required this.transactionId,
  });
}

class LeaveDetailsApproveEvent extends LeaveDetailsEvent {
  final int transactionId;
  final int employeeId;
  final int referenceId;

  LeaveDetailsApproveEvent({
    required this.transactionId,
    required this.employeeId,
    required this.referenceId,
  });
}

class LeaveDetailsRejectEvent extends LeaveDetailsEvent {
  final int transactionId;
  final int employeeId;
  final int referenceId;
  final String reason;

  LeaveDetailsRejectEvent({
    required this.transactionId,
    required this.employeeId,
    required this.referenceId,
    required this.reason,
  });
}

class LeaveDetailsPopEvent extends LeaveDetailsEvent {}
