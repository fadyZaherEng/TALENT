import 'package:flutter/material.dart';

@immutable
abstract class ResumeDutyDetailsEvent {}

class GetResumeDutyDetailsEvent extends ResumeDutyDetailsEvent {
  final int transactionId;

  GetResumeDutyDetailsEvent({required this.transactionId});
}

class ResumeDutyDetailsApproveEvent extends ResumeDutyDetailsEvent {
  final int transactionId;
  final int employeeId;
  final int referenceId;

  ResumeDutyDetailsApproveEvent({
    required this.transactionId,
    required this.employeeId,
    required this.referenceId,
  });
}

class ResumeDutyDetailsRejectEvent extends ResumeDutyDetailsEvent {
  final int transactionId;
  final int employeeId;
  final int referenceId;

  ResumeDutyDetailsRejectEvent({
    required this.transactionId,
    required this.employeeId,
    required this.referenceId,
  });
}
