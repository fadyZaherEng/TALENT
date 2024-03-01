import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:talent_link/src/core/resources/image_paths.dart';
import 'package:talent_link/src/core/utils/android_date_picker.dart';
import 'package:talent_link/src/core/utils/ios_date_picker.dart';
import 'package:talent_link/src/presentation/widgets/custom_text_field_with_suffix_icon_widget.dart';

class MyRequestFilterDateTimeWidget extends StatefulWidget {
  final void Function(String value, DateTime dateTime) pickDate;
  final Function() deleteDate;
  final String? errorMassage;
  final String label;
  DateTime dateTime;

  MyRequestFilterDateTimeWidget({
    Key? key,
    required this.pickDate,
    required this.deleteDate,
    this.errorMassage,
    this.label = '',
    required this.dateTime,
  }) : super(key: key);

  @override
  State<MyRequestFilterDateTimeWidget> createState() =>
      _MyRequestFilterDateTimeWidgetState();
}

class _MyRequestFilterDateTimeWidgetState
    extends State<MyRequestFilterDateTimeWidget> {
  final TextEditingController controller = TextEditingController();
  DateTime? _selectDateTime = DateTime.now();

  @override
  void initState() {
    controller.text = widget.dateTime.toString().split(" ")[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.errorMassage == null ? 50 : 80,
      child: CustomTextFieldWithSuffixIconWidget(
        controller: controller,
        labelTitle: widget.label,
        onTap: () {
          selectDate();
        },
        suffixIcon: controller.text == ""
            ? SvgPicture.asset(
                ImagePaths.selectDate,
                fit: BoxFit.scaleDown,
                matchTextDirection: true,
              )
            : InkWell(
                onTap: () {
                  widget.deleteDate();
                  widget.dateTime = DateTime.now();
                  controller.text = "";
                  setState(() {});
                },
                child: SvgPicture.asset(
                  ImagePaths.close,
                  fit: BoxFit.scaleDown,
                  matchTextDirection: true,
                ),
              ),
        isReadOnly: true,
        errorMessage: widget.errorMassage,
        onChanged: (String value) {},
      ),
    );
  }

  void selectDate() {
    if (Platform.isAndroid) {
      androidDatePicker(
        context: context,
        firstDate: DateTime(1900),
        onSelectDate: (date) {
          if (date == null) return;
          controller.text = date.toString().split(" ")[0];
          widget.pickDate(controller.text, date);
          widget.dateTime = date;
          setState(() {});
        },
        selectedDate: widget.dateTime,
      );
    } else {
      iosDatePicker(
        context: context,
        selectedDate: widget.dateTime,
        onChange: (date) {
          widget.dateTime = date;
        },
        onCancel: () {
          Navigator.pop(context);
          widget.dateTime = _selectDateTime!;
        },
        onDone: () {
          Navigator.of(context).pop();
          controller.text = widget.dateTime.toString().split(" ")[0];
          _selectDateTime = widget.dateTime;
          widget.pickDate(controller.text, widget.dateTime);
        },
      );
    }
  }
}
