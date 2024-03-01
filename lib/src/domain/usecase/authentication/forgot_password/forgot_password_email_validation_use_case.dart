import 'package:talent_link/src/core/utils/validation/login_validation.dart';

class ForgotPasswordEmailValidationUseCase {
  ValidationState call(String email) {
    return LoginValidation.validateEmail(email);
  }
}
