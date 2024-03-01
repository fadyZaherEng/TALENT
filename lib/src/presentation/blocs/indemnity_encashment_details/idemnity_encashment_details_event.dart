import 'package:flutter/material.dart';

@immutable
abstract class IndemnityEncashmentDetailsEvent {}

class GetIndemnityEncashmentDetailsEvent
    extends IndemnityEncashmentDetailsEvent {
  final int transactionId;

  GetIndemnityEncashmentDetailsEvent({required this.transactionId});
}

class IndemnityEncashmentDetailsApproveEvent
    extends IndemnityEncashmentDetailsEvent {
  final int transactionId;
  final int employeeId;
  final int referenceId;

  IndemnityEncashmentDetailsApproveEvent({
    required this.transactionId,
    required this.employeeId,
    required this.referenceId,
  });
}

class IndemnityEncashmentDetailsRejectEvent
    extends IndemnityEncashmentDetailsEvent {
  final int transactionId;
  final int employeeId;
  final int referenceId;

  IndemnityEncashmentDetailsRejectEvent({
    required this.transactionId,
    required this.employeeId,
    required this.referenceId,
  });
}
