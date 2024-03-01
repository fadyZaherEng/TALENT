import 'package:flutter/material.dart';

import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/presentation/screens/address/utils/address_controller.dart';
import 'package:talent_link/src/presentation/screens/address/utils/address_error_message.dart';
import 'package:talent_link/src/presentation/screens/address/utils/address_functions.dart';
import 'package:talent_link/src/presentation/screens/address/utils/address_global_key.dart';
import 'package:talent_link/src/presentation/widgets/custom_card_widget.dart';
import 'package:talent_link/src/presentation/widgets/custom_dropdown_text_field_with_label_widget.dart';
import 'package:talent_link/src/presentation/widgets/custom_gradient_button_widget.dart';
import 'package:talent_link/src/presentation/widgets/custom_numeric_text_field_with_label_widget.dart';
import 'package:talent_link/src/presentation/widgets/custom_text_field_with_label_widget.dart';
import 'package:talent_link/src/presentation/widgets/remark_text_field_widget.dart';

class AddressContentWidget extends StatelessWidget {
  final AddressController addressController;
  final AddressErrorMassage addressErrorMassage;
  final AddressGlobalKey addressGlobalKey;
  final AddressFunctions addressFunctions;

  const AddressContentWidget({
    super.key,
    required this.addressController,
    required this.addressErrorMassage,
    required this.addressGlobalKey,
    required this.addressFunctions,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          CustomCardWidget(widget: [
            CustomTextFieldWithLabelWidget(
              title: S.of(context).name,
              globalKey: addressGlobalKey.name,
              onChange: (value) => addressFunctions
                  .onChangeName(value.startsWith(" ") ? value.trim() : value),
              controller: addressController.name,
              errorMassage: addressErrorMassage.name,
            ),
            const SizedBox(height: 20),
            CustomDropdownTextFieldWithLabelWidget(
              onTapClearIcon: addressFunctions.onClearArea,
                hasClearButton: true,
                controller: addressController.area,
                errorMessage: addressErrorMassage.area,
                globalKey: addressGlobalKey.area,
                title: S.of(context).area,
                onTap: addressFunctions.onTapArea),
            const SizedBox(height: 20),
            CustomTextFieldWithLabelWidget(
              title: S.of(context).street,
              globalKey: addressGlobalKey.street,
              onChange: (value) => addressFunctions
                  .onChangeStreet(value.startsWith(" ") ? value.trim() : value),
              controller: addressController.street,
              errorMassage: addressErrorMassage.street,
            ),
            const SizedBox(height: 20),
            CustomTextFieldWithLabelWidget(
              title: S.of(context).building,
              globalKey: addressGlobalKey.building,
              onChange: (value) => addressFunctions.onChangeBuilding(
                  value.startsWith(" ") ? value.trim() : value),
              controller: addressController.building,
              errorMassage: addressErrorMassage.building,
            ),
            const SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: CustomNumericTextFieldWithLabelWidget(
                      title: S.of(context).floor,
                      globalKey: addressGlobalKey.floor,
                      onChange: (value) => addressFunctions.onChangeFloor(
                          value.startsWith(" ") ? value.trim() : value),
                      controller: addressController.floor,
                      errorMassage: addressErrorMassage.floor),
                ),
                const SizedBox(width: 30),
                Expanded(
                  child: CustomNumericTextFieldWithLabelWidget(
                      title: S.of(context).flat,
                      globalKey: addressGlobalKey.flat,
                      onChange: (value) => addressFunctions.onChangeFlat(
                          value.startsWith(" ") ? value.trim() : value),
                      controller: addressController.flat,
                      errorMassage: addressErrorMassage.flat),
                ),
              ],
            ),
            const SizedBox(height: 20),
            RemarkTextFieldWidget(
              isRemarkValid: true,
              remarkController: addressController.addressDetails,
              onRemarkChanged: (String value) {},
              text: S.of(context).addressDetails,
              errorMassage: null,
              globalKey: GlobalKey(),
            ),
            const SizedBox(height: 20),
            RemarkTextFieldWidget(
              isRemarkValid: true,
              remarkController: addressController.remarks,
              onRemarkChanged: (String value) {},
              text: S.of(context).remarks,
              errorMassage: null,
              globalKey: GlobalKey(),
            ),
          ]),
          Padding(
            padding: const EdgeInsets.all(16),
            child: CustomGradientButtonWidget(
              text: S.of(context).submit,
              onTap: addressFunctions.onTapSubmit,
            ),
          )
        ],
      ),
    );
  }
}
