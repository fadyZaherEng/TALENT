import 'package:flutter/material.dart';

class ShortLeaveController {
  final TextEditingController type;
  final TextEditingController numberOfMinutes;
  final TextEditingController referenceName;
  final TextEditingController referenceContactNo;
  final TextEditingController leaveReasons;
  final TextEditingController remarks;
  final TextEditingController currentBalance;
  final TextEditingController remainingBalance;
  final TextEditingController startTime;
  final TextEditingController endTime;

  ShortLeaveController({
    required this.type,
    required this.numberOfMinutes,
    required this.referenceName,
    required this.referenceContactNo,
    required this.leaveReasons,
    required this.remarks,
    required this.currentBalance,
    required this.remainingBalance,
    required this.startTime,
    required this.endTime,
  });
}
