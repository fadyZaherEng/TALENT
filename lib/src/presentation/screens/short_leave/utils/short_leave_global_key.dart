import 'package:flutter/material.dart';

class ShortLeaveGlobalKey {
  final GlobalKey type;
  final GlobalKey date;
  final GlobalKey startTime;
  final GlobalKey endTime;
  final GlobalKey numberOfMinuet;
  final GlobalKey referenceName;
  final GlobalKey referenceContactNo;
  final GlobalKey leaveReasons;
  final GlobalKey remarks;
  final GlobalKey uploadFile;
  final GlobalKey remainingBalance;
  final GlobalKey currentBalance;

  ShortLeaveGlobalKey({
    required this.type,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.numberOfMinuet,
    required this.referenceName,
    required this.referenceContactNo,
    required this.leaveReasons,
    required this.remarks,
    required this.uploadFile,
    required this.remainingBalance,
    required this.currentBalance,
  });
}
