import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/core/utils/validation/login_validation.dart';
import 'package:talent_link/src/domain/entities/user/user.dart';
import 'package:talent_link/src/domain/usecase/authentication/login/login_use_case.dart';
import 'package:talent_link/src/domain/usecase/authentication/login/password_validation_use_case.dart';
import 'package:talent_link/src/domain/usecase/authentication/login/save_company_id_use_case.dart';
import 'package:talent_link/src/domain/usecase/authentication/login/save_employee_id_use_case.dart';
import 'package:talent_link/src/domain/usecase/authentication/login/save_finger_print_number_use_case.dart';
import 'package:talent_link/src/domain/usecase/authentication/login/save_subscriber_id_use_case.dart';
import 'package:talent_link/src/domain/usecase/authentication/login/save_user_id_use_case.dart';
import 'package:talent_link/src/domain/usecase/authentication/login/save_user_name_use_case.dart';
import 'package:talent_link/src/domain/usecase/authentication/login/save_user_type_id_use_case.dart';
import '../../../domain/usecase/authentication/login/email_validation_use_case.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase _loginUseCase;
  final EmailValidationUseCase _emailValidationUseCase;
  final PasswordValidationUseCase _passwordValidationUseCase;
  final SaveUserIdUseCase _saveUserIdUseCase;
  final SaveUserNameUseCase _saveUserNameUseCase;
  final SaveUserTypeIdUseCase _saveUserTypeIdUseCase;
  final SaveCompanyIdUseCase _saveCompanyIdUseCase;
  final SaveSubscriberIdUseCase _saveSubscriberIdUseCase;
  final SaveEmployeeIdUseCase _saveEmployeeIdUseCase;
  final SaveFingerPrintNumberUseCase _saveFingerPrintNumberUseCase;

  LoginBloc(
      this._emailValidationUseCase,
      this._loginUseCase,
      this._passwordValidationUseCase,
      this._saveUserIdUseCase,
      this._saveUserNameUseCase,
      this._saveCompanyIdUseCase,
      this._saveSubscriberIdUseCase,
      this._saveEmployeeIdUseCase,
      this._saveFingerPrintNumberUseCase,
      this._saveUserTypeIdUseCase)
      : super(LoginInitial()) {
    on<ValidateEmailEvent>(_onValidateEmailEvent);
    on<ValidatePasswordEvent>(_onValidatePasswordEvent);
    on<LoginApiEvent>(_onLoginApiEvent);
    on<LoginPopEvent>(_onLoginPopEvent);
    on<NavigateToForgetPasswordEvent>(_onNavigateToForgetPasswordEvent);
  }

  void _onValidateEmailEvent(
      ValidateEmailEvent event, Emitter<LoginState> emit) {
    ValidationState validationState = _emailValidationUseCase(event.email);

    if (validationState == ValidationState.emailEmpty) {
      emit(LoginEmailNotValidState(
          errorMassage: S.current.emailAddressIsRequired));
    } else if (validationState == ValidationState.emailNotValid) {
      emit(LoginEmailNotValidState(
          errorMassage: S.current.pleaseEnterAValidEmailAddressForExample));
    } else {
      emit(LoginEmailValidState());
    }
  }

  void _onValidatePasswordEvent(
      ValidatePasswordEvent event, Emitter<LoginState> emit) {
    ValidationState validationState =
        _passwordValidationUseCase(event.password);

    if (validationState == ValidationState.passwordEmpty) {
      emit(LoginPasswordNotValidState(
          errorMassage: S.current.passwordIsRequired));
    } else {
      emit(LoginPasswordValidState());
    }
  }

  Future<void> _onLoginApiEvent(
      LoginApiEvent event, Emitter<LoginState> emit) async {
    ValidationState emailValidationState = _emailValidationUseCase(event.email);
    ValidationState passwordValidationState =
        _passwordValidationUseCase(event.password);
    if (emailValidationState == ValidationState.emailValid &&
        passwordValidationState == ValidationState.passwordValid) {
      emit(LoginLoadingState());
      DataState<User> dataState =
          await _loginUseCase(email: event.email, password: event.password);
      if (dataState is DataSuccess) {
        await _saveUserIdUseCase(dataState.data?.userId ?? 0);
        await _saveUserTypeIdUseCase(dataState.data?.userTypeId ?? 0);
        await _saveSubscriberIdUseCase(dataState.data?.subscriberId ?? 0);
        await _saveCompanyIdUseCase(dataState.data?.companyId ?? 0);
        await _saveUserNameUseCase(dataState.data?.employeeName ?? "");
        await _saveEmployeeIdUseCase(dataState.data?.employeeId ?? 0);
        await _saveFingerPrintNumberUseCase(
            dataState.data?.fingerPrintNo ?? "");
        emit(LoginSuccessState());
      } else {
        emit(LoginFailApiState(errorMassage: dataState.message ?? ""));
      }
    } else {
      add(ValidateEmailEvent(email: event.email));
      add(ValidatePasswordEvent(password: event.password));
    }
  }

  void _onLoginPopEvent(LoginPopEvent event, Emitter<LoginState> emit) {
    emit(LoginPopState());
  }

  void _onNavigateToForgetPasswordEvent(
      NavigateToForgetPasswordEvent event, Emitter<LoginState> emit) {
    emit(LoginNavigateToForgetPasswordState());
  }
}
