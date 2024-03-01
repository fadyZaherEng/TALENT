part of 'short_leave_details_bloc.dart';

@immutable
abstract class ShortLeaveDetailsEvent {}

class GetShortLeaveDetailsEvent extends ShortLeaveDetailsEvent {
  final int transactionId;

  GetShortLeaveDetailsEvent({required this.transactionId});
}

class ShortLeaveDetailsApproveEvent extends ShortLeaveDetailsEvent {
  final int transactionId;
  final int employeeId;
  final int referenceId;

  ShortLeaveDetailsApproveEvent({
    required this.transactionId,
    required this.employeeId,
    required this.referenceId,
  });
}

class ShortLeaveDetailsRejectEvent extends ShortLeaveDetailsEvent {
  final int transactionId;
  final int employeeId;
  final int referenceId;

  ShortLeaveDetailsRejectEvent({
    required this.transactionId,
    required this.employeeId,
    required this.referenceId,
  });
}
