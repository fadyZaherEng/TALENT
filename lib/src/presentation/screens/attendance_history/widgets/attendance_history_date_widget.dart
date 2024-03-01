import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import 'package:talent_link/src/config/theme/color_schemes.dart';
import 'package:talent_link/src/core/resources/image_paths.dart';
import 'package:talent_link/src/core/utils/android_date_picker.dart';
import 'package:talent_link/src/core/utils/ios_date_picker.dart';

class AttendanceHistoryDateWidget extends StatefulWidget {
  final void Function(DateTime dateTime) previousMonth;
  final void Function(DateTime dateTime) nextMonth;
  final void Function(DateTime dateTime) onTapDate;

  const AttendanceHistoryDateWidget({
    super.key,
    required this.previousMonth,
    required this.nextMonth,
    required this.onTapDate,
  });

  @override
  State<AttendanceHistoryDateWidget> createState() =>
      _AttendanceHistoryDateWidgetState();
}

class _AttendanceHistoryDateWidgetState
    extends State<AttendanceHistoryDateWidget> {
  DateTime _currentDate = DateTime.now();
  DateTime _selectDateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final formattedDate = DateFormat('MMMM yyyy').format(_currentDate);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 28),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              InkWell(
                onTap: _previousMonth,
                child: SvgPicture.asset(ImagePaths.arrowLeft,
                    matchTextDirection: true),
              ),
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    ImagePaths.selectDate,
                    color: ColorSchemes.primary,
                  ),
                  const SizedBox(width: 8),
                  InkWell(
                    onTap: () {
                      selectDate(formattedDate);
                    },
                    child: Text(
                      textAlign: TextAlign.center,
                      formattedDate,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: ColorSchemes.primary),
                    ),
                  ),
                ],
              )),
              InkWell(
                onTap: _nextMonth,
                child: SvgPicture.asset(ImagePaths.arrowRight,
                    matchTextDirection: true),
              ),
            ],
          ),
          // Place your content for the selected month here
        ],
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

  void selectDate(formattedDate) {
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
        selectedDate: _currentDate,
        onChange: (date) {
          _currentDate = date;
        },
        onCancel: () {
          Navigator.pop(context);
          _currentDate = _selectDateTime;
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
