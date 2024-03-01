// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import 'package:talent_link/src/config/theme/color_schemes.dart';
import 'package:talent_link/src/core/resources/image_paths.dart';
import 'package:talent_link/src/core/utils/android_date_picker.dart';
import 'package:talent_link/src/core/utils/constants.dart';
import 'package:talent_link/src/core/utils/ios_date_picker.dart';

class PayslipDateWidget extends StatefulWidget {
  final void Function(DateTime dateTime) previousMonth;
  final void Function(DateTime dateTime) nextMonth;
  final void Function(DateTime dateTime) onTapDate;

  const PayslipDateWidget({
    super.key,
    required this.previousMonth,
    required this.nextMonth,
    required this.onTapDate,
  });

  @override
  State<PayslipDateWidget> createState() => _PayslipDateWidgetState();
}

class _PayslipDateWidgetState extends State<PayslipDateWidget> {
  DateTime _currentDate = DateTime.now();
  DateTime _selectDateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final formatter = DateFormat('MMMM yyyy').format(_currentDate);
    return Container(
      decoration: const BoxDecoration(
        color: ColorSchemes.bottomPayslipColor,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: _previousMonth,
                    child: SvgPicture.asset(ImagePaths.arrowLeft,
                        matchTextDirection: true, color: ColorSchemes.primary),
                  ),
                  Expanded(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SvgPicture.asset(
                        ImagePaths.calender,
                        color: ColorSchemes.primary,
                      ),
                      const SizedBox(width: 8),
                      InkWell(
                        onTap: () {
                          _selectDate(formatter);
                        },
                        child: Text(
                          textAlign: TextAlign.center,
                          formatter,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                                  color: ColorSchemes.primary,
                                  fontWeight: Constants.fontWeightSemiBold,
                                  fontSize: 14),
                        ),
                      ),
                    ],
                  )),
                  InkWell(
                    onTap: _nextMonth,
                    child: SvgPicture.asset(ImagePaths.arrowRight,
                        matchTextDirection: true, color: ColorSchemes.primary),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _previousMonth() {
    setState(() {
      _currentDate = DateTime(_currentDate.year, _currentDate.month - 1);
    });
    widget.previousMonth(_currentDate);
  }

  void _nextMonth() {
    setState(() {
      _currentDate = DateTime(_currentDate.year, _currentDate.month + 1);
    });
    widget.nextMonth(_currentDate);
  }

  void _selectDate(formattedDate) {
    if (Platform.isAndroid) {
      androidDatePicker(
        context: context,
        firstDate: DateTime(1900),
        onSelectDate: (date) {
          if (date == null) return;
          formattedDate = date;
          _currentDate = date;
          widget.onTapDate(_currentDate);
          setState(() {});
        },
        selectedDate: _currentDate,
      );
    } else {
      iosDatePicker(
        context: context,
        selectedDate: _selectDateTime,
        onChange: (date) {
          _currentDate = date;
        },
        onCancel: () {
          Navigator.pop(context);
          _currentDate =_selectDateTime;
        },
        onDone: () {
          _selectDateTime = _currentDate;
          Navigator.of(context).pop();
          formattedDate = _currentDate;
          widget.onTapDate(_currentDate);
        },
      );
    }
  }
}
