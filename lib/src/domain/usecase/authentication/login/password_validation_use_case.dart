import 'package:talent_link/src/core/utils/validation/login_validation.dart';

class PasswordValidationUseCase {
  ValidationState call(String password) {
    return LoginValidation.validatePassword(password);
  }
}
