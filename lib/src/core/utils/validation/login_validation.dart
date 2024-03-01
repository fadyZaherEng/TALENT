class LoginValidation {
  static bool isEmailValid(String email) {
    const String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    var regExp = RegExp(pattern);

    return regExp.hasMatch(email.trim());
  }

  static bool isMobileNumberValid(String mobileNumber, String pattern) {
    var reqExp = RegExp(pattern);

    return reqExp.hasMatch(mobileNumber.trim());
  }

  static bool isFullNameValid(String fullName) {
    const String pattern =
        r"([a-zA-Z]{3,}\s[a-zA-Z]{2,}'?-?[a-zA-Z]{1,}\s?([a-zA-Z]{1,})?)";

    var regExp = RegExp(pattern);

    return regExp.hasMatch(fullName.trim());
  }

  static ValidationState validateEmail(String email) {
    if (email == null || email.isEmpty) {
      return ValidationState.emailEmpty;
    } else if (!isEmailValid(email)) {
      return ValidationState.emailNotValid;
    } else {
      return ValidationState.emailValid;
    }
  }

  static ValidationState validatePassword(String password) {
    if (password == null || password.isEmpty) {
      return ValidationState.passwordEmpty;
    } else {
      return ValidationState.passwordValid;
    }
  }
}

enum ValidationState {
  passwordEmpty,
  passwordNotValid,
  passwordValid,
  emailEmpty,
  emailNotValid,
  emailValid,
}
