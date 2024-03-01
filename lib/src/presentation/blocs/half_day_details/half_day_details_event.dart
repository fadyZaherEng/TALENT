import 'package:flutter/material.dart';

@immutable
abstract class HalfDayDetailsEvent {}

class GetHalfDayDetailsEvent extends HalfDayDetailsEvent {
  final int transactionId;

  GetHalfDayDetailsEvent({required this.transactionId});
}

class HalfDayDetailsApproveEvent extends HalfDayDetailsEvent {
  final int transactionId;
  final int employeeId;
  final int referenceId;

  HalfDayDetailsApproveEvent({
    required this.transactionId,
    required this.employeeId,
    required this.referenceId,
  });
}

class HalfDayDetailsRejectEvent extends HalfDayDetailsEvent {
  final int transactionId;
  final int employeeId;
  final int referenceId;

  HalfDayDetailsRejectEvent({
    required this.transactionId,
    required this.employeeId,
    required this.referenceId,
  });
}
