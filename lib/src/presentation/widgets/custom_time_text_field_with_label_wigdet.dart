import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:talent_link/src/config/theme/color_schemes.dart';
import 'package:talent_link/src/core/resources/image_paths.dart';
import 'package:talent_link/src/core/utils/android_time_picker.dart';
import 'package:talent_link/src/core/utils/ios_time_picker.dart';
import 'package:talent_link/src/presentation/widgets/custom_text_field_with_suffix_icon_widget.dart';

class CustomTimeTextFieldWithLabelWidget extends StatefulWidget {
  final void Function(String value) pickTime;
  final Function() deleteTime;
  final String title;
  final GlobalKey globalKey;
  final String? errorMessage;
  final String label;
  final bool valueComingFromApi;
  final String value;
  final TextEditingController? controller;

  const CustomTimeTextFieldWithLabelWidget({
    Key? key,
    required this.pickTime,
    required this.deleteTime,
    required this.title,
    required this.globalKey,
    this.errorMessage,
    this.label = '',
    this.valueComingFromApi = false,
    this.value = '',
    this.controller,
  }) : super(key: key);

  @override
  State<CustomTimeTextFieldWithLabelWidget> createState() =>
      _CustomTimeTextFieldWithLabelWidgetState();
}

class _CustomTimeTextFieldWithLabelWidgetState
    extends State<CustomTimeTextFieldWithLabelWidget> {
  TimeOfDay selectedTime = TimeOfDay.now();
  TimeOfDay dateSelected = TimeOfDay.now();
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
                  widget.valueComingFromApi ? () {} : selectTime();
                },
                suffixIcon: controller.text == ""
                    ? SvgPicture.asset(
                        ImagePaths.time,
                        fit: BoxFit.scaleDown,
                        matchTextDirection: true,
                      )
                    : InkWell(
                        onTap: () {
                          widget.deleteTime();
                          selectedTime = TimeOfDay.now();
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
                errorMessage: widget.errorMessage,
                onChanged: (String value) {},
              ),
            ),
          ],
        ),
      ],
    );
  }

  void selectTime() {
    if (Platform.isAndroid) {
      androidTimePicker(
        context: context,
        selectedTime: selectedTime,
        onSelectTime: (time) {
          if (time == null) return;
          controller.text = _formatTimeOfDay(time);
          widget.pickTime(controller.text);
          selectedTime = time;
          setState(() {});
        },
      );
    } else {
      iosTimePicker(
        context: context,
        selectedTime: selectedTime,
        onChange: (time) {
          dateSelected = time;
        },
        onCancel: () {
          Navigator.of(context).pop();
          dateSelected = selectedTime;
        },
        onDone: () {
          selectedTime = dateSelected;
          if (selectedTime != null) {
            selectedTime = dateSelected;
          } else {
            selectedTime = TimeOfDay.now();
            dateSelected = selectedTime;
          }
          Navigator.of(context).pop();
          controller.text = selectedTime.format(context) ?? '';
          widget.pickTime(controller.text);
        },
      );
    }
  }

  String _formatTimeOfDay(TimeOfDay time) {
    final hour = time.hourOfPeriod;
    final minute = time.minute;
    final period = time.period == DayPeriod.am ? 'AM' : 'PM';
    return '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')} $period';
  }
}
