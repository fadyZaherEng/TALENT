import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/core/utils/validation/login_validation.dart';
import 'package:talent_link/src/domain/entities/forgot_password/forgot_password_status.dart';
import 'package:talent_link/src/domain/usecase/authentication/forgot_password/forgot_password_send_email_use_case.dart';
import '../../../domain/usecase/authentication/forgot_password/forgot_password_email_validation_use_case.dart';

part 'forgot_password_event.dart';

part 'forgot_password_state.dart';

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  final ForgotPasswordEmailValidationUseCase
      _forgotPasswordEmailValidationUseCase;
  final ForgotPasswordSendEmailUseCase _forgotPasswordSendEmailUseCase;

  ForgotPasswordBloc(this._forgotPasswordEmailValidationUseCase,
      this._forgotPasswordSendEmailUseCase)
      : super(ForgotPasswordInitial()) {
    on<ForgotPasswordValidateEmailEvent>(_onForgotPasswordValidateEmailEvent);
    on<ForgotPasswordSendEmailEvent>(_onForgotPasswordSendEmailEvent);
  }

  void _onForgotPasswordValidateEmailEvent(
      ForgotPasswordValidateEmailEvent event,
      Emitter<ForgotPasswordState> emit) {
    ValidationState validationState =
        _forgotPasswordEmailValidationUseCase(event.email);

    if (validationState == ValidationState.emailEmpty) {
      emit(ForgotPasswordEmailNotValidState(
          errorMessage: S.current.emailAddressIsRequired));
    } else if (validationState == ValidationState.emailNotValid) {
      emit(ForgotPasswordEmailNotValidState(
          errorMessage: S.current.pleaseEnterAValidEmailAddressForExample));
    } else {
      emit(ForgotPasswordEmailValidState());
    }
  }

  Future<void> _onForgotPasswordSendEmailEvent(
      ForgotPasswordSendEmailEvent event,
      Emitter<ForgotPasswordState> emit) async {
    emit(ForgotPasswordLoadingState());
    ValidationState validationState =
        _forgotPasswordEmailValidationUseCase(event.email);
    if (validationState == ValidationState.emailValid) {
      emit(ForgotPasswordLoadingState());
      DataState<ForgotPasswordStatus> dataState =
          await _forgotPasswordSendEmailUseCase(email: event.email);
      if (dataState is DataSuccess) {
        if (dataState.data!.status == true) {
          emit(ForgotPasswordSuccessState());
        } else {
          emit(ForgotPasswordFailApiState(
              errorMessage: dataState.data!.message ?? ""));
        }
      } else {
        emit(ForgotPasswordFailApiState(errorMessage: dataState.message ?? ""));
      }
    }
  }
}
