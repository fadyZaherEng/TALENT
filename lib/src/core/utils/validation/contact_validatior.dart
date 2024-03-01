class ContactValidator {
  static ContactValidationState validateContactType(String contactType) {
    if (contactType.isEmpty) {
      return ContactValidationState.contactTypeEmpty;
    } else {
      return ContactValidationState.valid;
    }
  }

  static ContactValidationState validateContactNo(String contactNo) {
    if (contactNo.isEmpty) {
      return ContactValidationState.contactNoEmpty;
    } else {
      return ContactValidationState.valid;
    }
  }
}

enum ContactValidationState {
  contactTypeEmpty,
  contactNoEmpty,
  valid,
}
