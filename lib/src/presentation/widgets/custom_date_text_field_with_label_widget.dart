import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:talent_link/src/config/theme/color_schemes.dart';
import 'package:talent_link/src/core/resources/image_paths.dart';
import 'package:talent_link/src/core/utils/android_date_picker.dart';
import 'package:talent_link/src/core/utils/ios_date_picker.dart';
import 'package:talent_link/src/presentation/widgets/custom_text_field_with_suffix_icon_widget.dart';

class CustomDateTextFieldWithLabelWidget extends StatefulWidget {
  final void Function(String value) pickDate;
  final Function() deleteDate;
  final String title;
  final GlobalKey globalKey;
  final String? errorMassage;
  final String label;
  final String imagePath;
  final bool valueComingFromApi;
  final String value;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final TextEditingController? controller;
  final bool readOnly;

  const CustomDateTextFieldWithLabelWidget({
    Key? key,
    required this.pickDate,
    required this.deleteDate,
    required this.title,
    required this.globalKey,
    this.errorMassage,
    this.imagePath = ImagePaths.selectDate,
    this.label = '',
    this.valueComingFromApi = false,
    this.value = '',
    this.firstDate,
    this.controller,
    this.lastDate,
    this.readOnly = true,
  }) : super(key: key);

  @override
  State<CustomDateTextFieldWithLabelWidget> createState() =>
      _CustomDateTextFieldWithLabelWidgetState();
}

class _CustomDateTextFieldWithLabelWidgetState
    extends State<CustomDateTextFieldWithLabelWidget> {
  DateTime? selectedDate;
  DateTime? dateSelected = DateTime.now();

  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    widget.controller != null ? controller = widget.controller! : null;
    widget.value.isNotEmpty ? controller.text = widget.value : null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      key: widget.globalKey,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: ColorSchemes.semiBlack),
            ),
            const SizedBox(height: 16.0),
            SizedBox(
              child: CustomTextFieldWithSuffixIconWidget(
                controller: controller,
                labelTitle: widget.label,
                onTap: () {
                  widget.valueComingFromApi ? () {} : selectDate();
                },
                suffixIcon: controller.text == ""
                    ? SvgPicture.asset(
                        widget.imagePath,
                        fit: BoxFit.scaleDown,
                        matchTextDirection: true,
                      )
                    : InkWell(
                        onTap: () {
                          widget.deleteDate();
                          selectedDate = DateTime.now();
                          dateSelected = DateTime.now();
                          controller.text = "";
                          setState(() {});
                        },
                        child: SvgPicture.asset(
                          ImagePaths.close,
                          fit: BoxFit.scaleDown,
                          matchTextDirection: true,
                        ),
                      ),
                isReadOnly: widget.readOnly,
                errorMessage: widget.errorMassage,
                onChanged: (String value) {},
              ),
            ),
          ],
        ),
      ],
    );
  }

  void selectDate() {
    if (Platform.isAndroid) {
      androidDatePicker(
        lastDate:widget.lastDate ,
        context: context,
        firstDate: widget.firstDate ?? DateTime(1900),
        onSelectDate: (date) {
          if (date == null) return;
          controller.text = date.toString().split(" ")[0];
          widget.pickDate(controller.text);
          selectedDate = date;
          setState(() {});
        },
        selectedDate: selectedDate,
      );
    } else {
      iosDatePicker(
        lastDate: widget.lastDate,
        firstDate: widget.firstDate,
        context: context,
        selectedDate: selectedDate,
        onChange: (date) {
          dateSelected = date;
        },
        onCancel: () {
          Navigator.of(context).pop();
          dateSelected = selectedDate;
        },
        onDone: () {
          selectedDate = dateSelected;
          if (selectedDate != null) {
            selectedDate = dateSelected;
          } else {
            selectedDate = DateTime.now();
            dateSelected = selectedDate;
          }
          Navigator.of(context).pop();
          controller.text = selectedDate.toString().split(" ")[0];
          widget.pickDate(controller.text);
        },
      );
    }
  }
}
