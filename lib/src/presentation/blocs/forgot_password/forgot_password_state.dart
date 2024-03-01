part of 'forgot_password_bloc.dart';

abstract class ForgotPasswordState {}

class ForgotPasswordInitial extends ForgotPasswordState {}

class ForgotPasswordLoadingState extends ForgotPasswordState {}

class ForgotPasswordSuccessState extends ForgotPasswordState {}

class ForgotPasswordFailApiState extends ForgotPasswordState {
  final String errorMessage;

  ForgotPasswordFailApiState({required this.errorMessage});
}

class ForgotPasswordEmailNotValidState extends ForgotPasswordState {
  final String errorMessage;

  ForgotPasswordEmailNotValidState({required this.errorMessage});
}

class ForgotPasswordEmailValidState extends ForgotPasswordState {}
