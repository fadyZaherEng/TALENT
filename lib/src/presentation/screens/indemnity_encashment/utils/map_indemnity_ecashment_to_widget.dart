import 'package:flutter/material.dart';

import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/domain/entities/all_fields/all_fields_mandatory.dart';
import 'package:talent_link/src/presentation/screens/indemnity_encashment/utils/indemnity_encashment_controller.dart';
import 'package:talent_link/src/presentation/screens/indemnity_encashment/utils/indemnity_encashment_error_massage.dart';
import 'package:talent_link/src/presentation/screens/indemnity_encashment/utils/indemnity_encashment_functions.dart';
import 'package:talent_link/src/presentation/screens/indemnity_encashment/utils/indemnity_encashment_global_key.dart';
import 'package:talent_link/src/presentation/widgets/remark_text_field_widget.dart';
import 'package:talent_link/src/presentation/widgets/upload_file_widget.dart';

List<Widget> mapIndemnityEncashmentToWidgets({
  required List<AllFieldsMandatory> allFieldsMandatory,
  required BuildContext context,
  required IndemnityEncashmentGlobalKey indemnityEncashmentGlobalKey,
  required IndemnityEncashmentErrorMassage indemnityEncashmentErrorMassage,
  required IndemnityEncashmentFunctions indemnityEncashmentFunctions,
  required IndemnityEncashmentController indemnityEncashmentController,
  required bool isValidLeaveRemarks,
  required bool fileIsMandatory,
  required String filePath,
}) {
  return allFieldsMandatory.map((indemnityEncashment) {
    if (indemnityEncashment.fieldKey == 'remarks') {
      return Visibility(
          visible: !indemnityEncashment.isHidden,
          child: Column(
            children: [
              RemarkTextFieldWidget(
                isRemarkValid: isValidLeaveRemarks,
                remarkController: indemnityEncashmentController.remarks,
                onRemarkChanged: (String value) => indemnityEncashmentFunctions
                    .onChangeRemarks(value, indemnityEncashment.isRequired),
                text: S.of(context).remarks,
                errorMassage: indemnityEncashmentErrorMassage.remarks,
                globalKey: indemnityEncashmentGlobalKey.remarks,
              ),
              const SizedBox(height: 20),
            ],
          ));
    }
    if (indemnityEncashment.fieldKey ==
        'employeeIndemnityEncashmentAttachments') {
      return Visibility(
          visible: !indemnityEncashment.isHidden,
          child: Column(
            children: [
              UploadFileWidget(
                filePath: filePath,
                showUploadFileBottomSheet: () => indemnityEncashmentFunctions
                    .showUploadFileBottomSheet(indemnityEncashment.isRequired),
                deleteFileAction: (String filePath) =>
                    indemnityEncashmentFunctions.deleteFileAction(
                        filePath, indemnityEncashment.isRequired),
                globalKey: indemnityEncashmentGlobalKey.file,
                isMandatory: fileIsMandatory,
                fileErrorMassage: indemnityEncashmentErrorMassage.file,
              ),
              const SizedBox(height: 20),
            ],
          ));
    } else {
      return const SizedBox.shrink();
    }
  }).toList();
}
