import 'package:flutter/material.dart';

import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/domain/entities/all_fields/all_fields_mandatory.dart';
import 'package:talent_link/src/presentation/screens/short_leave/utils/short_leave_controller.dart';
import 'package:talent_link/src/presentation/screens/short_leave/utils/short_leave_error_massage.dart';
import 'package:talent_link/src/presentation/screens/short_leave/utils/short_leave_functions.dart';
import 'package:talent_link/src/presentation/screens/short_leave/utils/short_leave_global_key.dart';
import 'package:talent_link/src/presentation/widgets/custom_numeric_text_field_with_label_widget.dart';
import 'package:talent_link/src/presentation/widgets/custom_text_field_with_label_widget.dart';
import 'package:talent_link/src/presentation/widgets/remark_text_field_widget.dart';
import 'package:talent_link/src/presentation/widgets/upload_file_widget.dart';

List<Widget> mapShortLeavesToWidgets({
  required BuildContext context,
  required List<AllFieldsMandatory> allFieldsMandatory,
  required ShortLeaveController shortLeaveController,
  required ShortLeaveErrorMassage shortLeaveErrorMassage,
  required ShortLeaveFunctions shortLeaveFunctions,
  required ShortLeaveGlobalKey shortLeaveGlobalKey,
  required bool isValidLeaveReasons,
  required bool isValidRemarks,
  required bool fileIsMandatory,
  required String filePath,
}) {
  return allFieldsMandatory.map((allFieldsMandatory) {
    if (allFieldsMandatory.fieldKey == "referenceName") {
      return Visibility(
          visible: !allFieldsMandatory.isHidden,
          child: Column(
            children: [
              CustomTextFieldWithLabelWidget(
                title: S.of(context).referenceName,
                globalKey: shortLeaveGlobalKey.referenceName,
                onChange: (String value) => shortLeaveFunctions
                    .onChangeReferenceName(value, allFieldsMandatory.isRequired),
                controller: shortLeaveController.referenceName,
                errorMassage:shortLeaveErrorMassage.referenceName ,
              ),
              const SizedBox(height: 20),
            ],
          ));
    } else if (allFieldsMandatory.fieldKey == "referenceContactNo") {
      return Visibility(
          visible:  !allFieldsMandatory.isHidden,
          child: Column(
            children: [
              CustomNumericTextFieldWithLabelWidget(
                title: S.of(context).referenceContactNo,
                globalKey: shortLeaveGlobalKey.referenceContactNo,
                onChange: (value) => shortLeaveFunctions.onChangeReferenceContactNo(
                    value, allFieldsMandatory.isRequired),
                controller: shortLeaveController.referenceContactNo,
                errorMassage: shortLeaveErrorMassage.referenceContactNo,
              ),
              const SizedBox(height: 20),
            ],
          ));
    } else if (allFieldsMandatory.fieldKey == "currentbalance") {
      return Visibility(
          visible:  !allFieldsMandatory.isHidden,
          child: Column(
            children: [
              CustomNumericTextFieldWithLabelWidget(
                readOnly: true,
                title: S.of(context).currentBalance,
                globalKey: shortLeaveGlobalKey.currentBalance,
                onChange: (value) => shortLeaveFunctions.onChangeCurrentBalance(
                    value, allFieldsMandatory.isRequired),
                controller: shortLeaveController.currentBalance,
                errorMassage: shortLeaveErrorMassage.currentBalance,
              ),
              const SizedBox(height: 20),
            ],
          ));
    }else if (allFieldsMandatory.fieldKey == "remainingbalance") {
      return Visibility(
          visible:  !allFieldsMandatory.isHidden,
          child: Column(
            children: [
              CustomNumericTextFieldWithLabelWidget(
                readOnly: true,
                title: S.of(context).remainingBalance,
                globalKey: shortLeaveGlobalKey.remainingBalance,
                onChange: (value) => shortLeaveFunctions.onChangeRemainingBalance(
                    value, allFieldsMandatory.isRequired),
                controller: shortLeaveController.remainingBalance,
                errorMassage: shortLeaveErrorMassage.remainingBalance,
              ),
              const SizedBox(height: 20),
            ],
          ));
    }  else if (allFieldsMandatory.fieldKey == "reason") {
      return Visibility(
          visible:  !allFieldsMandatory.isHidden,
          child: Column(
            children: [
              RemarkTextFieldWidget(
                isRemarkValid: isValidLeaveReasons,
                remarkController: shortLeaveController.leaveReasons,
                onRemarkChanged: (String value) => shortLeaveFunctions
                    .onChangeLeaveReasons(value,   allFieldsMandatory.isRequired,),
                text: S.of(context).leaveReasons,
                errorMassage: shortLeaveErrorMassage.leaveReasons,
                globalKey: shortLeaveGlobalKey.leaveReasons,
              ),
              const SizedBox(height: 20),
            ],
          ));
    } else if (allFieldsMandatory.fieldKey == "remarks") {
      return Visibility(
          visible: !allFieldsMandatory.isHidden,
          child: Column(
            children: [
              RemarkTextFieldWidget(
                isRemarkValid: isValidRemarks,
                remarkController: shortLeaveController.remarks,
                onRemarkChanged: (String value) => shortLeaveFunctions
                    .onChangeRemarks(value, allFieldsMandatory.isRequired),
                text: S.of(context).remarks,
                errorMassage: shortLeaveErrorMassage.remarks,
                globalKey: shortLeaveGlobalKey.remarks,
              ),
              const SizedBox(height: 20),
            ],
          ));
    } else if (allFieldsMandatory.fieldKey == "employeeShortLeaveAttachments") {
      return Visibility(
          visible:  !allFieldsMandatory.isHidden,
          child: Column(
            children: [
              UploadFileWidget(
                filePath: filePath,
                showUploadFileBottomSheet: () => shortLeaveFunctions
                    .showUploadFileBottomSheet(allFieldsMandatory.isRequired),
                deleteFileAction: (String filePath) => shortLeaveFunctions
                    .deleteFileAction(filePath,allFieldsMandatory.isRequired),
                globalKey: shortLeaveGlobalKey.uploadFile,
                isMandatory: fileIsMandatory,
                fileErrorMassage: shortLeaveErrorMassage.file,
              ),
              const SizedBox(height: 20),
            ],
          ));
    } else {
      return const SizedBox.shrink();
    }
  }).toList();
}
