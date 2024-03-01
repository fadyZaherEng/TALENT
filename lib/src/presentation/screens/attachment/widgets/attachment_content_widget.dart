import 'package:flutter/material.dart';

import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/presentation/screens/attachment/utils/attachment_controller.dart';
import 'package:talent_link/src/presentation/screens/attachment/utils/attachment_error_message.dart';
import 'package:talent_link/src/presentation/screens/attachment/utils/attachment_functions.dart';
import 'package:talent_link/src/presentation/screens/attachment/utils/attachment_global_key.dart';
import 'package:talent_link/src/presentation/widgets/custom_card_widget.dart';
import 'package:talent_link/src/presentation/widgets/custom_date_text_field_with_label_widget.dart';
import 'package:talent_link/src/presentation/widgets/custom_dropdown_text_field_with_label_widget.dart';
import 'package:talent_link/src/presentation/widgets/custom_gradient_button_widget.dart';
import 'package:talent_link/src/presentation/widgets/custom_numeric_text_field_with_label_widget.dart';
import 'package:talent_link/src/presentation/widgets/remark_text_field_widget.dart';
import 'package:talent_link/src/presentation/widgets/upload_file_widget.dart';

class AttachmentContentWidget extends StatelessWidget {
  final String filePath;
  final bool isFileMandatory;
  final AttachmentErrorMassage attachmentErrorMassage;
  final AttachmentController attachmentController;
  final AttachmentGlobalKey attachmentGlobalKey;
  final AttachmentFunctions attachmentFunctions;

  const AttachmentContentWidget({
    super.key,
    required this.filePath,
    required this.isFileMandatory,
    required this.attachmentErrorMassage,
    required this.attachmentController,
    required this.attachmentGlobalKey,
    required this.attachmentFunctions,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(children: [
          CustomCardWidget(widget: [
            CustomDropdownTextFieldWithLabelWidget(
                controller: attachmentController.attachmentType,
                errorMessage: attachmentErrorMassage.attachmentType,
                globalKey: attachmentGlobalKey.attachmentType,
                title: S.of(context).attachmentType,
                onTap: attachmentFunctions.onTapAttachmentType),
            const SizedBox(height: 20),
            CustomNumericTextFieldWithLabelWidget(
              title: S.of(context).documentNo,
              globalKey: attachmentGlobalKey.documentNo,
              onChange: (value) =>
                  attachmentFunctions.onChangeDocumentNumber(value),
              controller: attachmentController.documentNo,
              errorMassage: attachmentErrorMassage.documentNo,
            ),
            const SizedBox(height: 20),
            CustomDateTextFieldWithLabelWidget(
              lastDate: DateTime(DateTime.now().year, DateTime.now().month,
                  DateTime.now().day, DateTime.now().hour + 1),
              title: S.of(context).issueDate,
              globalKey: attachmentGlobalKey.issueDate,
              errorMassage: attachmentErrorMassage.issueDate,
              pickDate: (value) => attachmentFunctions.onPickIssueDate(value),
              deleteDate: attachmentFunctions.onDeleteIssueDate,
            ),
            const SizedBox(height: 20),
            CustomDateTextFieldWithLabelWidget(
              firstDate: DateTime(
                  DateTime.now().year,
                  DateTime.now().month,
                  DateTime.now().day,
                  DateTime.now().hour - 1),
              title: S.of(context).expiryDate,
              globalKey: GlobalKey(),
              errorMassage: null,
              pickDate: (value) => attachmentFunctions.onPickExpiryDate(value),
              deleteDate: attachmentFunctions.onDeleteExpiryDate,
            ),
            const SizedBox(height: 20),
            RemarkTextFieldWidget(
                isRemarkValid: true,
                remarkController: attachmentController.remarks,
                onRemarkChanged: (String value) {},
                text: S.of(context).remarks,
                globalKey: GlobalKey()),
            const SizedBox(height: 20),
            UploadFileWidget(
                isMandatory: isFileMandatory,
                fileErrorMassage: attachmentErrorMassage.file,
                deleteFileAction: attachmentFunctions.deleteFileAction,
                showUploadFileBottomSheet:
                    attachmentFunctions.showUploadFileBottomSheet,
                globalKey: attachmentGlobalKey.file,
                filePath: filePath)
          ]),
          Padding(
            padding: const EdgeInsets.all(16),
            child: CustomGradientButtonWidget(
              text: S.of(context).submit,
              onTap: attachmentFunctions.onTapSubmit,
            ),
          )
        ]));
  }
}
