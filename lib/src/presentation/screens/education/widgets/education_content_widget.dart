import 'package:flutter/material.dart';

import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/presentation/screens/education/utils/education_controller.dart';
import 'package:talent_link/src/presentation/screens/education/utils/education_error_message.dart';
import 'package:talent_link/src/presentation/screens/education/utils/education_functions.dart';
import 'package:talent_link/src/presentation/screens/education/utils/education_global_key.dart';
import 'package:talent_link/src/presentation/widgets/custom_card_widget.dart';
import 'package:talent_link/src/presentation/widgets/custom_date_text_field_with_label_widget.dart';
import 'package:talent_link/src/presentation/widgets/custom_dropdown_text_field_with_label_widget.dart';
import 'package:talent_link/src/presentation/widgets/custom_gradient_button_widget.dart';
import 'package:talent_link/src/presentation/widgets/custom_text_field_with_label_widget.dart';
import 'package:talent_link/src/presentation/widgets/remark_text_field_widget.dart';
import 'package:talent_link/src/presentation/widgets/upload_file_widget.dart';

class EducationContentWidget extends StatelessWidget {
  final EducationController educationController;
  final EducationGlobalKey educationGlobalKey;
  final EducationErrorMassage educationErrorMassage;
  final EducationFunctions educationFunctions;
  final String filePath;

  const EducationContentWidget({
    super.key,
    required this.educationController,
    required this.educationGlobalKey,
    required this.educationErrorMassage,
    required this.educationFunctions,
    required this.filePath,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(children: [
          CustomCardWidget(widget: [
            CustomDropdownTextFieldWithLabelWidget(
                controller: educationController.qualificationType,
                errorMessage: educationErrorMassage.qualificationType,
                globalKey: educationGlobalKey.qualificationType,
                title: S.of(context).qualificationType,
                onTap: educationFunctions.onTapQualificationType),
            const SizedBox(height: 20),
            CustomTextFieldWithLabelWidget(
              title: S.of(context).qualificationPlaceName,
              globalKey: educationGlobalKey.qualificationPlaceName,
              onChange: (value) =>
                  educationFunctions.onChangeQualificationPlaceName(value),
              controller: educationController.qualificationPlaceName,
              errorMassage: educationErrorMassage.qualificationPlaceName,
            ),
            const SizedBox(height: 20),
            CustomDropdownTextFieldWithLabelWidget(
                controller: educationController.country,
                errorMessage: educationErrorMassage.country,
                globalKey: educationGlobalKey.country,
                title: S.of(context).country,
                onTap: educationFunctions.onTapCountry),
            const SizedBox(height: 20),
            CustomDateTextFieldWithLabelWidget(
              lastDate: DateTime(DateTime.now().year, DateTime.now().month,
                  DateTime.now().day, DateTime.now().hour + 1),
              pickDate: (String date) =>
                  educationFunctions.onPickIssueDate(date),
              deleteDate: educationFunctions.onDeleteIssueDate,
              title: S.of(context).issueDate,
              globalKey: educationGlobalKey.issueDate,
              errorMassage: educationErrorMassage.issueDate,
            ),
            const SizedBox(height: 20),
            CustomDateTextFieldWithLabelWidget(
                firstDate: DateTime(
                    DateTime.now().year,
                    DateTime.now().month,
                    DateTime.now().day,
                    DateTime.now().hour - 1),
                pickDate: (String date) =>
                    educationFunctions.onPickExpiryDate(date),
                deleteDate: educationFunctions.onDeleteExpiryDate,
                title: S.of(context).expiryDate,
                globalKey: educationGlobalKey.expiryDate,
                errorMassage: educationErrorMassage.expiryDate),
            const SizedBox(height: 20),
            RemarkTextFieldWidget(
              isRemarkValid: true,
              remarkController: educationController.remarks,
              onRemarkChanged: (String value) {},
              text: S.of(context).remarks,
              errorMassage: null,
              globalKey: GlobalKey(),
            ),
            const SizedBox(height: 20),
            UploadFileWidget(
                deleteFileAction: (String file) =>
                    educationFunctions.deleteFileAction(file),
                showUploadFileBottomSheet:
                    educationFunctions.showUploadFileBottomSheet,
                globalKey: GlobalKey(),
                filePath: filePath),
          ]),
          Padding(
            padding: const EdgeInsets.all(16),
            child: CustomGradientButtonWidget(
              text: S.of(context).submit,
              onTap: educationFunctions.onTapSubmit,
            ),
          )
        ]));
  }
}
