import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/config/theme/color_schemes.dart';
import 'package:talent_link/src/core/resources/image_paths.dart';
import 'package:talent_link/src/presentation/widgets/custom_gradient_button_widget.dart';
import 'package:talent_link/src/presentation/widgets/custom_text_field_with_prefix_icon_widget.dart';
import 'package:talent_link/src/presentation/widgets/password_text_field_widget.dart';

class LoginContentWidget extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final Function(String) onChangeEmail;
  final Function(String) onChangePassword;
  final Function() onLogin;
  final String? emailErrorMessage;
  final String? passwordErrorMessage;
  final Function() forgotPasswordAction;

  const LoginContentWidget(
      {Key? key,
      required this.emailController,
      this.emailErrorMessage,
      required this.onChangeEmail,
      required this.onChangePassword,
      required this.onLogin,
      required this.passwordController,
      this.passwordErrorMessage,
      required this.forgotPasswordAction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 64),
            Text(S.of(context).signIn,
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: ColorSchemes.black)),
            const SizedBox(height: 4),
            Text(S.of(context).toContinue,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: ColorSchemes.gray, fontWeight: FontWeight.normal)),
            const SizedBox(height: 36),
            SvgPicture.asset(ImagePaths.appLogo),
            const SizedBox(height: 34),
            CustomTextFieldWithPrefixIconWidget(
              textInputType: TextInputType.emailAddress,
              onChanged: (value) {
                onChangeEmail(value);
              },
              labelTitle: S.of(context).email,
              controller: emailController,
              prefixIcon: SvgPicture.asset(
                ImagePaths.email,
                fit: BoxFit.scaleDown,
              ),
              errorMessage: emailErrorMessage,
            ),
            const SizedBox(height: 24),
            PasswordTextFieldWidget(
                controller: passwordController,
                labelTitle: S.of(context).password,
                onChange: (value) {
                  onChangePassword(value);
                },
                errorMessage: passwordErrorMessage),
            const SizedBox(height: 12),
            Row(
              children: [
                const Expanded(child: SizedBox()),
                InkWell(
                  onTap: () {
                    forgotPasswordAction();
                  },
                  child: Text(
                    S.of(context).forgotYourPassword,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: ColorSchemes.black,
                        fontWeight: FontWeight.normal),
                  ),
                )
              ],
            ),
            const SizedBox(height: 48),
            CustomGradientButtonWidget(
              onTap: () {
                onLogin();
              },
              text: S.of(context).login,
            ),
          ],
        ),
      ),
    );
  }
}
