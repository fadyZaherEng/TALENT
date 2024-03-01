import 'package:flutter/material.dart';

import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/presentation/screens/asset/utils/asset_controller.dart';
import 'package:talent_link/src/presentation/screens/asset/utils/asset_error_message.dart';
import 'package:talent_link/src/presentation/screens/asset/utils/asset_functions.dart';
import 'package:talent_link/src/presentation/screens/asset/utils/asset_global_key.dart';
import 'package:talent_link/src/presentation/widgets/custom_card_widget.dart';
import 'package:talent_link/src/presentation/widgets/custom_dropdown_text_field_with_label_widget.dart';
import 'package:talent_link/src/presentation/widgets/custom_gradient_button_widget.dart';
import 'package:talent_link/src/presentation/widgets/custom_numeric_text_field_with_label_widget.dart';
import 'package:talent_link/src/presentation/widgets/remark_text_field_widget.dart';

class AssetContentWidget extends StatelessWidget {
  final AssetGlobalKey assetGlobalKey;
  final AssetController assetController;
  final AssetFunctions assetFunctions;
  final AssetErrorMassage assetErrorMassage;

  const AssetContentWidget({
    super.key,
    required this.assetGlobalKey,
    required this.assetController,
    required this.assetFunctions,
    required this.assetErrorMassage,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(children: [
          CustomCardWidget(widget: [
            CustomDropdownTextFieldWithLabelWidget(
                controller: assetController.assetType,
                errorMessage: assetErrorMassage.assetType,
                globalKey: assetGlobalKey.assetType,
                title: S.of(context).assetType,
                onTap: assetFunctions.onTapAssetType),
            const SizedBox(height: 20),
            CustomNumericTextFieldWithLabelWidget(
                title: S.of(context).quantity,
                globalKey: assetGlobalKey.quantity,
                onChange: (value) => assetFunctions.onChangeQuantity(value),
                controller: assetController.quantity,
                errorMassage: assetErrorMassage.quantity),
            const SizedBox(height: 20),
            RemarkTextFieldWidget(
                isRemarkValid: true,
                remarkController: assetController.remarks,
                onRemarkChanged: (String value) {},
                text: S.of(context).remarks,
                errorMassage: null,
                globalKey: GlobalKey()),
          ]),
          Padding(
            padding: const EdgeInsets.all(16),
            child: CustomGradientButtonWidget(
              text: S.of(context).submit,
              onTap: assetFunctions.onTapSubmit,
            ),
          )
        ]));
  }
}
