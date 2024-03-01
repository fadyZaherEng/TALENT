import 'package:flutter/material.dart';

import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/domain/entities/all_fields/all_fields_mandatory.dart';
import 'package:talent_link/src/presentation/screens/short_leave/utils/map_short_leave_to_widget.dart';
import 'package:talent_link/src/presentation/screens/short_leave/utils/short_leave_controller.dart';
import 'package:talent_link/src/presentation/screens/short_leave/utils/short_leave_error_massage.dart';
import 'package:talent_link/src/presentation/screens/short_leave/utils/short_leave_functions.dart';
import 'package:talent_link/src/presentation/screens/short_leave/utils/short_leave_global_key.dart';
import 'package:talent_link/src/presentation/widgets/custom_card_widget.dart';
import 'package:talent_link/src/presentation/widgets/custom_date_text_field_with_label_widget.dart';
import 'package:talent_link/src/presentation/widgets/custom_dropdown_text_field_with_label_widget.dart';
import 'package:talent_link/src/presentation/widgets/custom_gradient_button_widget.dart';
import 'package:talent_link/src/presentation/widgets/custom_numeric_text_field_with_label_widget.dart';
import 'package:talent_link/src/presentation/widgets/custom_time_text_field_with_label_wigdet.dart';

class ShortLeaveContentWidget extends StatefulWidget {
  final List<AllFieldsMandatory> allFieldsMandatory;
  final ShortLeaveController shortLeaveController;
  final ShortLeaveErrorMassage shortLeaveErrorMassage;
  final ShortLeaveFunctions shortLeaveFunctions;
  final ShortLeaveGlobalKey shortLeaveGlobalKey;
  final bool isValidLeaveReasons;
  final bool isValidRemarks;
  final bool fileIsMandatory;
  final String filePath;

  const ShortLeaveContentWidget({
    super.key,
    required this.shortLeaveController,
    required this.shortLeaveErrorMassage,
    required this.shortLeaveFunctions,
    required this.shortLeaveGlobalKey,
    required this.allFieldsMandatory,
    required this.isValidLeaveReasons,
    required this.isValidRemarks,
    required this.fileIsMandatory,
    required this.filePath,
  });

  @override
  State<ShortLeaveContentWidget> createState() =>
      _ShortLeaveContentWidgetState();
}

class _ShortLeaveContentWidgetState extends State<ShortLeaveContentWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            CustomCardWidget(widget: [
              CustomDropdownTextFieldWithLabelWidget(
                  controller: widget.shortLeaveController.type,
                  errorMessage: widget.shortLeaveErrorMassage.type,
                  globalKey: widget.shortLeaveGlobalKey.type,
                  title: S.of(context).type,
                  onTap: widget.shortLeaveFunctions.onTapType),
              const SizedBox(height: 20),
              CustomDateTextFieldWithLabelWidget(
                firstDate: DateTime.now(),
                  pickDate: (value) =>
                      widget.shortLeaveFunctions.onPickDate(value),
                  deleteDate: widget.shortLeaveFunctions.onDeleteDate,
                  title: S.of(context).date,
                  globalKey: widget.shortLeaveGlobalKey.date,
                  errorMassage: widget.shortLeaveErrorMassage.date),
              const SizedBox(height: 20),
              CustomTimeTextFieldWithLabelWidget(
                controller: widget.shortLeaveController.startTime,
                  pickTime: (value) =>
                      widget.shortLeaveFunctions.onPickStartTime(value),
                  deleteTime: widget.shortLeaveFunctions.onDeleteStartTime,
                  title: S.of(context).startTime,
                  globalKey: widget.shortLeaveGlobalKey.startTime,
                  errorMessage: widget.shortLeaveErrorMassage.startTime),
              const SizedBox(height: 20),
              CustomTimeTextFieldWithLabelWidget(
                controller: widget.shortLeaveController.endTime,
                  pickTime: (value) =>
                      widget.shortLeaveFunctions.onPickEndTime(value),
                  deleteTime: widget.shortLeaveFunctions.onDeleteEndTime,
                  title: S.of(context).endTime,
                  globalKey: widget.shortLeaveGlobalKey.endTime,
                  errorMessage: widget.shortLeaveErrorMassage.endTime),
              const SizedBox(height: 20),
              CustomNumericTextFieldWithLabelWidget(
                readOnly: true,
                title: S.of(context).numberOfMinutes,
                globalKey: widget.shortLeaveGlobalKey.numberOfMinuet,
                onChange: (value) {},
                controller: widget.shortLeaveController.numberOfMinutes,
                errorMassage: widget.shortLeaveErrorMassage.numberOfMinutes,
              )
            ]),
            widget.allFieldsMandatory.isNotEmpty
                ? CustomCardWidget(
                    widget: mapShortLeavesToWidgets(
                    context: context,
                    allFieldsMandatory: widget.allFieldsMandatory,
                    shortLeaveController: widget.shortLeaveController,
                    shortLeaveErrorMassage: widget.shortLeaveErrorMassage,
                    shortLeaveFunctions: widget.shortLeaveFunctions,
                    shortLeaveGlobalKey: widget.shortLeaveGlobalKey,
                    isValidLeaveReasons: widget.isValidLeaveReasons,
                    isValidRemarks: widget.isValidRemarks,
                    fileIsMandatory: widget.fileIsMandatory,
                    filePath: widget.filePath,
                  ))
                : const SizedBox(),
            Padding(
              padding: const EdgeInsets.all(16),
              child: CustomGradientButtonWidget(
                  text: S.of(context).submit,
                  onTap: widget.shortLeaveFunctions.onTapSubmit),
            )
          ],
        ));
  }
}
