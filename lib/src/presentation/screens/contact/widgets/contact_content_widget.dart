import 'package:flutter/material.dart';

import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/presentation/screens/contact/utils/contact_controller.dart';
import 'package:talent_link/src/presentation/screens/contact/utils/contact_error_message.dart';
import 'package:talent_link/src/presentation/screens/contact/utils/contact_functions.dart';
import 'package:talent_link/src/presentation/screens/contact/utils/contact_global_key.dart';
import 'package:talent_link/src/presentation/widgets/custom_card_widget.dart';
import 'package:talent_link/src/presentation/widgets/custom_dropdown_text_field_with_label_widget.dart';
import 'package:talent_link/src/presentation/widgets/custom_gradient_button_widget.dart';
import 'package:talent_link/src/presentation/widgets/custom_numeric_text_field_with_label_widget.dart';
import 'package:talent_link/src/presentation/widgets/remark_text_field_widget.dart';

class ContactContentWidget extends StatelessWidget {
  final ContactController contactController;
  final ContactGlobalKey contactGlobalKey;
  final ContactErrorMassage contactErrorMassage;
  final ContactFunctions contactFunctions;

  const ContactContentWidget({
    super.key,
    required this.contactController,
    required this.contactGlobalKey,
    required this.contactErrorMassage,
    required this.contactFunctions,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          CustomCardWidget(widget: [
            CustomDropdownTextFieldWithLabelWidget(
                controller: contactController.contactType,
                errorMessage: contactErrorMassage.contactType,
                globalKey: contactGlobalKey.contactType,
                title: S.of(context).contactType,
                onTap: contactFunctions.onTapContactType),
            const SizedBox(height: 20),
            CustomNumericTextFieldWithLabelWidget(
              title: S.of(context).contactNo,
              globalKey: contactGlobalKey.contactNo,
              onChange: (value) => contactFunctions.onChangeContactNo(
                  value.startsWith(" ") ? value.trim() : value),
              controller: contactController.contactNo,
              errorMassage: contactErrorMassage.contactNo,
            ),
            const SizedBox(height: 20),
            RemarkTextFieldWidget(
              isRemarkValid: true,
              remarkController: contactController.remark,
              onRemarkChanged: (String value) {},
              text: S.of(context).remarks,
              errorMassage: null,
              globalKey: GlobalKey(),
            ),
            const SizedBox(height: 20),
          ]),
          Padding(
            padding: const EdgeInsets.all(16),
            child: CustomGradientButtonWidget(
              text: S.of(context).submit,
              onTap: contactFunctions.onTapSubmit,
            ),
          )
        ],
      ),
    );
  }
}
