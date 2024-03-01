import 'package:flutter/material.dart';

abstract class PayslipEvent {}

class PayslipGetDataEvent extends PayslipEvent {
  int year;
  String month;

  PayslipGetDataEvent({
    required this.year,
    required this.month,
  });
}

class PayslipGetChangeDataEvent extends PayslipEvent {
  int year;
  String month;

  PayslipGetChangeDataEvent({
    required this.year,
    required this.month,
  });
}

class PayslipLeftArrowEvent extends PayslipEvent {}

class PayslipRightArrowEvent extends PayslipEvent {}

class PayslipSelectDateEvent extends PayslipEvent {
  BuildContext context;

  PayslipSelectDateEvent(this.context);
}
