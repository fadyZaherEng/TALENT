import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:talent_link/generated/l10n.dart';

Future iosTimePicker({
  required BuildContext context,
  required TimeOfDay? selectedTime,
  required Function(TimeOfDay) onChange,
  required Function() onCancel,
  required Function() onDone,
}) =>
    showCupertinoModalPopup(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return Container(
          color: Colors.white,
          height: 300.0,
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: onCancel,
                    child: Text(
                      S.of(context).cancel,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: onDone,
                    child: Text(
                      S.of(context).done,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              Flexible(
                child: CupertinoDatePicker(
                  initialDateTime: DateTime(
                    DateTime.now().year,
                    DateTime.now().month,
                    DateTime.now().day,
                    selectedTime!.hour,
                    selectedTime.minute,
                  ),
                  mode: CupertinoDatePickerMode.time, // Use time mode
                  onDateTimeChanged: (dateTime) {
                    final timeOfDay = TimeOfDay.fromDateTime(dateTime);
                    onChange(timeOfDay);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
