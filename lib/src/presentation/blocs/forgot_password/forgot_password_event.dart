part of 'forgot_password_bloc.dart';

abstract class ForgotPasswordEvent {}

class ForgotPasswordNavigateToConfirmationScreenEvent
    extends ForgotPasswordEvent {}

class ForgotPasswordSendEmailEvent extends ForgotPasswordEvent {
  final String email;

  ForgotPasswordSendEmailEvent({required this.email});
}

class ForgotPasswordPopScreenEvent extends ForgotPasswordEvent {}

class ForgotPasswordValidateEmailEvent extends ForgotPasswordEvent {
  final String email;

  ForgotPasswordValidateEmailEvent({required this.email});
}
