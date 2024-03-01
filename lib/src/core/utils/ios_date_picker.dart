import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:talent_link/generated/l10n.dart';

Future iosDatePicker({
  required BuildContext context,
  required DateTime? selectedDate,
  DateTime? firstDate,
  DateTime? lastDate,
  required Function(DateTime) onChange,
  required Function() onCancel,
  required Function() onDone,
}) =>
    showCupertinoModalPopup(
        context: context,
        barrierDismissible: false,
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
                    initialDateTime: selectedDate ?? DateTime.now(),
                    minimumDate: firstDate ?? DateTime(1990),
                    maximumDate: lastDate ?? DateTime(2100),
                    mode: CupertinoDatePickerMode.date,
                    onDateTimeChanged: onChange,
                  ),
                ),
              ],
            ),
          );
        });
