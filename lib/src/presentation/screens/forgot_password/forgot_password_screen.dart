import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/config/theme/color_schemes.dart';
import 'package:talent_link/src/core/base/widget/base_stateful_widget.dart';
import 'package:talent_link/src/core/resources/image_paths.dart';
import 'package:talent_link/src/core/utils/show_massage_dialog_widget.dart';
import 'package:talent_link/src/presentation/blocs/forgot_password/forgot_password_bloc.dart';
import 'package:talent_link/src/presentation/widgets/build_app_bar_widget.dart';
import 'package:talent_link/src/presentation/widgets/custom_gradient_button_widget.dart';
import 'package:talent_link/src/presentation/widgets/custom_text_field_with_prefix_icon_widget.dart';

class ForgotPasswordScreen extends BaseStatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  BaseState<BaseStatefulWidget> baseCreateState() =>
      _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends BaseState<ForgotPasswordScreen> {
  ForgotPasswordBloc get _bloc => BlocProvider.of<ForgotPasswordBloc>(context);
  TextEditingController emailController = TextEditingController();
  String? emailErrorMessage;
  bool _emailValid = false;

  @override
  Widget baseBuild(BuildContext context) {
    return BlocConsumer<ForgotPasswordBloc, ForgotPasswordState>(
      listener: (context, state) {
        if (state is ForgotPasswordLoadingState) {
          showLoading();
        } else {
          hideLoading();
        }
        if (state is ForgotPasswordEmailValidState) {
          emailErrorMessage = null;
          _emailValid = true;
        } else if (state is ForgotPasswordEmailNotValidState) {
          emailErrorMessage = state.errorMessage;
          _emailValid = false;
        } else if (state is ForgotPasswordSuccessState) {
          _navigateToConfirmationScreen();
        } else if (state is ForgotPasswordFailApiState) {
          _showErrorMessage(state.errorMessage);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: buildAppBarWidget(context,
              title: S.of(context).forgetPassword,
              isHaveBackButton: true, onBackButtonPressed: () {
            _popScreen();
          }),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const SizedBox(height: 34),
                  SvgPicture.asset(ImagePaths.forgetPasswordEmail),
                  const SizedBox(height: 34),
                  Text(S.of(context).enterYourEmailAddress,
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .copyWith(color: ColorSchemes.semiBlack)),
                  const SizedBox(height: 2),
                  Text(S.of(context).associatedWithYourAccount,
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .copyWith(color: ColorSchemes.semiBlack)),
                  const SizedBox(height: 46),
                  CustomTextFieldWithPrefixIconWidget(
                    onChanged: (value) {
                      _validateEmailEvent();
                    },
                    labelTitle: S.of(context).email,
                    controller: emailController,
                    prefixIcon: SvgPicture.asset(
                      ImagePaths.email,
                      fit: BoxFit.scaleDown,
                    ),
                    errorMessage: emailErrorMessage,
                  ),
                  const SizedBox(height: 46),
                  CustomGradientButtonWidget(
                    onTap: () {
                      _sendForPasswordEmail();
                    },
                    text: S.of(context).send,
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _sendForPasswordEmail() {
    _emailValid
        ? _bloc.add(ForgotPasswordSendEmailEvent(email: emailController.text))
        : _bloc
            .add(ForgotPasswordValidateEmailEvent(email: emailController.text));
  }

  void _navigateToConfirmationScreen() {
    Navigator.of(context).pushReplacementNamed("/confirmationEmail");
  }

  void _popScreen() {
    Navigator.of(context).pop();
  }

  void _validateEmailEvent() {
    _bloc.add(ForgotPasswordValidateEmailEvent(email: emailController.text));
  }

  void _showErrorMessage(String errorMessage) {
    showMassageDialogWidget(
        context: context,
        text: errorMessage,
        icon: ImagePaths.profile,
        buttonText: S.of(context).ok,
        onTap: () {
          _popScreen();
        });
  }
}
