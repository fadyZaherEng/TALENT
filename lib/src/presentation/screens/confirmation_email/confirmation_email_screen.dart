import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/config/theme/color_schemes.dart';
import 'package:talent_link/src/core/base/widget/base_stateful_widget.dart';
import 'package:talent_link/src/core/resources/image_paths.dart';
import 'package:talent_link/src/presentation/widgets/build_app_bar_widget.dart';
import 'package:talent_link/src/presentation/widgets/custom_gradient_button_widget.dart';

class ConfirmationEmailScreen extends BaseStatefulWidget {
  const ConfirmationEmailScreen({super.key});

  @override
  BaseState<BaseStatefulWidget> baseCreateState() =>
      _ConfirmationEmailScreenState();
}

class _ConfirmationEmailScreenState extends BaseState<ConfirmationEmailScreen> {
  @override
  Widget baseBuild(BuildContext context) {
    return Scaffold(
      appBar: buildAppBarWidget(context,
          title: S.of(context).confirmationEmail,
          isHaveBackButton: true,
          onBackButtonPressed: () {}),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 34),
            SvgPicture.asset(ImagePaths.confirmationEmail),
            const SizedBox(height: 34),
            Text(S.of(context).pleaseCheckYourEmail,
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .copyWith(color: ColorSchemes.semiBlack)),
            const SizedBox(height: 2),
            Text(S.of(context).address,
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .copyWith(color: ColorSchemes.semiBlack)),
            const SizedBox(height: 46),
            CustomGradientButtonWidget(
              onTap: () {
                _popScreen();
              },
              text: S.of(context).backToLogin,
            )
          ],
        ),
      ),
    );
  }

  void _popScreen() {
    Navigator.pop(context);
  }
}
