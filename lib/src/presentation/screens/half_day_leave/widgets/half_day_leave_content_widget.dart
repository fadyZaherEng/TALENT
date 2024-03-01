import 'package:flutter/material.dart';

import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/domain/entities/all_fields/all_fields_mandatory.dart';
import 'package:talent_link/src/presentation/screens/half_day_leave/utils/half_day_leave_controller.dart';
import 'package:talent_link/src/presentation/screens/half_day_leave/utils/half_day_leave_error_massage.dart';
import 'package:talent_link/src/presentation/screens/half_day_leave/utils/half_day_leave_functions.dart';
import 'package:talent_link/src/presentation/screens/half_day_leave/utils/half_day_leave_global_key.dart';
import 'package:talent_link/src/presentation/screens/half_day_leave/utils/map_half_day_leave_to_widget.dart';
import 'package:talent_link/src/presentation/widgets/custom_card_widget.dart';
import 'package:talent_link/src/presentation/widgets/custom_date_text_field_with_label_widget.dart';
import 'package:talent_link/src/presentation/widgets/custom_dropdown_text_field_with_label_widget.dart';
import 'package:talent_link/src/presentation/widgets/custom_gradient_button_widget.dart';
import 'package:talent_link/src/presentation/widgets/custom_numeric_text_field_with_label_widget.dart';
import 'package:talent_link/src/presentation/widgets/custom_time_text_field_with_label_wigdet.dart';

class HalfDayLeaveContentWidget extends StatefulWidget {
  final HalfDayLeaveController halfDayLeaveController;
  final HalfDayLeaveErrorMassage halfDayLeaveErrorMassage;
  final HalfDayLeaveFunctions halfDayLeaveFunctions;
  final HalfDayLeaveGlobalKey halfDayLeaveGlobalKey;
  final bool isValidLeaveReasons;
  final bool isValidLeaveRemarks;
  final bool fileIsMandatory;
  final String filePath;
  final List<AllFieldsMandatory> allFiledMandatory;

  const HalfDayLeaveContentWidget({
    super.key,
    required this.halfDayLeaveController,
    required this.halfDayLeaveErrorMassage,
    required this.halfDayLeaveGlobalKey,
    required this.halfDayLeaveFunctions,
    required this.isValidLeaveReasons,
    required this.isValidLeaveRemarks,
    required this.fileIsMandatory,
    required this.filePath,
    required this.allFiledMandatory,
  });

  @override
  State<HalfDayLeaveContentWidget> createState() =>
      _HalfDayLeaveContentWidgetState();
}

class _HalfDayLeaveContentWidgetState extends State<HalfDayLeaveContentWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(children: [
          CustomCardWidget(widget: [
            CustomDropdownTextFieldWithLabelWidget(
              controller: widget.halfDayLeaveController.halfLeaveType,
              errorMessage: widget.halfDayLeaveErrorMassage.halfLeaveType,
              globalKey: widget.halfDayLeaveGlobalKey.halfLeaveType,
              title: S.of(context).halfLeaveType,
              onTap: widget.halfDayLeaveFunctions.onTapHalfLeaveType,
            ),
            const SizedBox(height: 20),
            CustomDateTextFieldWithLabelWidget(
              firstDate: DateTime.now(),
              title: S.of(context).halfLeaveDate,
              globalKey: widget.halfDayLeaveGlobalKey.halfLeaveDate,
              errorMassage: widget.halfDayLeaveErrorMassage.halfLeaveDate,
              pickDate: (value) =>
                  widget.halfDayLeaveFunctions.onPickHalfLeaveDate(value),
              deleteDate:
                  widget.halfDayLeaveFunctions.onDeleteHalfLeaveDateAction,
            ),
            const SizedBox(height: 20),
            CustomTimeTextFieldWithLabelWidget(
              controller: widget.halfDayLeaveController.startTime,
              title: S.of(context).startTime,
              globalKey: widget.halfDayLeaveGlobalKey.startTime,
              errorMessage: widget.halfDayLeaveErrorMassage.startTime,
              pickTime: (value) =>
                  widget.halfDayLeaveFunctions.onPickStartTime(value),
              deleteTime: widget.halfDayLeaveFunctions.onDeleteStartTimeAction,
            ),
            const SizedBox(height: 20),
            CustomTimeTextFieldWithLabelWidget(
              controller: widget.halfDayLeaveController.endTime,
              title: S.of(context).endTime,
              globalKey: widget.halfDayLeaveGlobalKey.endTime,
                errorMessage: widget.halfDayLeaveErrorMassage.endTime,
              pickTime: (value) =>
                  widget.halfDayLeaveFunctions.onPickEndTime(value),
              deleteTime: widget.halfDayLeaveFunctions.onDeleteEndTimeAction,
            ),
            const SizedBox(height: 20),
            CustomNumericTextFieldWithLabelWidget(
              readOnly: true,
              title: S.of(context).numberOfMinutes,
              globalKey: widget.halfDayLeaveGlobalKey.numberOfMinute,
              onChange: (value) {},
              controller: widget.halfDayLeaveController.numberOfMinute,
              errorMassage: null,
            ),
          ]),
          widget.allFiledMandatory.isNotEmpty
              ? CustomCardWidget(
                  widget: mapHalfDayLeaveToWidgets(
                      allFiledMandatory: widget.allFiledMandatory,
                      context: context,
                      halfDayLeaveGlobalKey: widget.halfDayLeaveGlobalKey,
                      halfDayLeaveErrorMassage: widget.halfDayLeaveErrorMassage,
                      halfDayLeaveFunctions: widget.halfDayLeaveFunctions,
                      halfDayLeaveController: widget.halfDayLeaveController,
                      isValidLeaveRemarks: widget.isValidLeaveRemarks,
                      isValidLeaveReasons: widget.isValidLeaveReasons,
                      fileIsMandatory: widget.fileIsMandatory,
                      filePath: widget.filePath))
              : const SizedBox.shrink(),
          Padding(
            padding: const EdgeInsets.all(16),
            child: CustomGradientButtonWidget(
              text: S.of(context).submit,
              onTap: widget.halfDayLeaveFunctions.onTapSubmit,
            ),
          )
        ]));
  }


}
