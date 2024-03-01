import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/core/base/widget/base_stateful_widget.dart';
import 'package:talent_link/src/core/resources/image_paths.dart';
import 'package:talent_link/src/core/utils/show_massage_dialog_widget.dart';
import 'package:talent_link/src/presentation/blocs/login/login_bloc.dart';
import 'package:talent_link/src/presentation/screens/login/widgets/login_content_widget.dart';

class LoginScreen extends BaseStatefulWidget {
  const LoginScreen({super.key});

  @override
  BaseState<BaseStatefulWidget> baseCreateState() => _LoginScreenState();
}

class _LoginScreenState extends BaseState<LoginScreen> {
  LoginBloc get _bloc => BlocProvider.of<LoginBloc>(context);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String? _emailErrorMessage;
  String? _passwordErrorMessage;

  @override
  Widget baseBuild(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginLoadingState) {
            showLoading();
          } else {
            hideLoading();
          }
          if (state is LoginEmailNotValidState) {
            _emailErrorMessage = state.errorMassage;
          } else if (state is LoginEmailValidState) {
            _emailErrorMessage = null;
          } else if (state is LoginPasswordNotValidState) {
            _passwordErrorMessage = state.errorMassage;
          } else if (state is LoginPasswordValidState) {
            _passwordErrorMessage = null;
          } else if (state is LoginFailApiState) {
            _showErrorMessage(state.errorMassage);
          } else if (state is LoginPopState) {
            _pop();
          } else if (state is LoginNavigateToForgetPasswordState) {
            _navigateToForgotPasswordScreen();
          } else if (state is LoginSuccessState) {
            _navigateToHomeScreen();
          }
        },
        builder: (context, state) {
          return LoginContentWidget(
              emailController: emailController,
              passwordController: passwordController,
              emailErrorMessage: _emailErrorMessage,
              passwordErrorMessage: _passwordErrorMessage,
              forgotPasswordAction: () {
                _navigateToForgotPasswordScreenEvent();
              },
              onChangeEmail: (value) {
                _validateEmailAddress(value);
              },
              onChangePassword: (value) {
                _validatePassword(value);
              },
              onLogin: () {
                _login();
              });
        },
      ),
    );
  }

  void _login() {
    _bloc.add(LoginApiEvent(
        email: emailController.text, password: passwordController.text));
  }

  void _validatePassword(String password) {
    _bloc.add(ValidatePasswordEvent(password: password));
  }

  void _validateEmailAddress(String email) {
    _bloc.add(ValidateEmailEvent(email: email));
  }

  void _navigateToForgotPasswordScreenEvent() {
    _bloc.add(NavigateToForgetPasswordEvent());
  }

  void _navigateToForgotPasswordScreen() {
    Navigator.of(context).pushNamed('/forgetPassword');
  }

  void _navigateToHomeScreen() {
    Navigator.of(context).pushNamed('/main' , arguments: 0);
  }

  void _pop() {
    Navigator.of(context).pop();
  }

  void _popEvent() {
    _bloc.add(LoginPopEvent());
  }

  void _showErrorMessage(String errorMessage) {
    showMassageDialogWidget(
        context: context,
        text: errorMessage,
        icon: ImagePaths.profile,
        buttonText: S.of(context).ok,
        onTap: () {
          _popEvent();
        });
  }
}
