import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import 'package:talent_link/src/config/theme/color_schemes.dart';
import 'package:talent_link/src/core/resources/image_paths.dart';
import 'package:talent_link/src/core/utils/android_date_picker.dart';
import 'package:talent_link/src/core/utils/ios_date_picker.dart';

class MyTeamAttendanceDateWidget extends StatefulWidget {
  final void Function(DateTime dateTime) previousMonth;
  final void Function(DateTime dateTime) nextMonth;
  final void Function(DateTime dateTime) onTapDate;
  DateTime currentDate;

  MyTeamAttendanceDateWidget({
    super.key,
    required this.previousMonth,
    required this.nextMonth,
    required this.onTapDate,
    required this.currentDate,
  });

  @override
  State<MyTeamAttendanceDateWidget> createState() =>
      _MyTeamAttendanceDateWidgetState();
}

DateTime _selectDateTime = DateTime.now();

class _MyTeamAttendanceDateWidgetState
    extends State<MyTeamAttendanceDateWidget> {
  @override
  Widget build(BuildContext context) {
    final formattedDate =
        DateFormat('dd MMMM yyyy', "en").format(widget.currentDate);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 28),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              InkWell(
                onTap: () => _previousMonth(),
                child: SvgPicture.asset(
                  ImagePaths.arrowLeft,
                  matchTextDirection: true,
                ),
              ),
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      selectDate(widget.currentDate.toString().split(" ")[0]);
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
                onTap: () => _nextMonth(),
                child: SvgPicture.asset(
                  ImagePaths.arrowRight,
                  matchTextDirection: true,
                ),
              ),
            ],
          ),
          // Place your content for the selected month here
        ],
      ),
    );
  }

  void _previousMonth() {
    widget.currentDate =
        DateTime(widget.currentDate.year, widget.currentDate.month - 1);
    widget.previousMonth(widget.currentDate);
  }

  void _nextMonth() {
    widget.currentDate =
        DateTime(widget.currentDate.year, widget.currentDate.month + 1);
    widget.nextMonth(widget.currentDate);
  }

  void selectDate(formattedDate) {
    if (Platform.isAndroid) {
      androidDatePicker(
        context: context,
        firstDate: DateTime(1900),
        onSelectDate: (date) {
          if (date == null) return;
          formattedDate = date;
          widget.currentDate = date;
          widget.onTapDate(widget.currentDate);
        },
        selectedDate: widget.currentDate,
      );
    } else {
      iosDatePicker(
        context: context,
        selectedDate: widget.currentDate,
        onChange: (date) {
          widget.currentDate = date;
        },
        onCancel: () {
          Navigator.pop(context);
          widget.currentDate = _selectDateTime;
        },
        onDone: () {
          _selectDateTime = widget.currentDate;
          Navigator.of(context).pop();
          formattedDate = widget.currentDate;
          widget.onTapDate(widget.currentDate);
        },
      );
    }
  }
}
