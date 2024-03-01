class EducationValidator {
  static EducationValidationState validateQualificationType(
      String qualificationType) {
    if (qualificationType.isEmpty) {
      return EducationValidationState.qualificationTypeEmpty;
    } else {
      return EducationValidationState.valid;
    }
  }

  static EducationValidationState validateQualificationPlaceName(
      String qualificationPlaceName) {
    if (qualificationPlaceName.isEmpty) {
      return EducationValidationState.qualificationPlaceNameEmpty;
    } else {
      return EducationValidationState.valid;
    }
  }

  static EducationValidationState validateCountry(
      String country) {
    if (country.isEmpty) {
      return EducationValidationState.countryEmpty;
    } else {
      return EducationValidationState.valid;
    }
  }

  static EducationValidationState validateIssueDate(
      String issueDate) {
    if (issueDate.isEmpty) {
      return EducationValidationState.issueDateEmpty;
    } else {
      return EducationValidationState.valid;
    }
  }

  static EducationValidationState validateExpiryDate(
      String expiryDate) {
    if (expiryDate.isEmpty) {
      return EducationValidationState.expiryDateEmpty;
    } else {
      return EducationValidationState.valid;
    }
  }
}

enum EducationValidationState {
  qualificationTypeEmpty,
  qualificationPlaceNameEmpty,
  countryEmpty,
  issueDateEmpty,
  expiryDateEmpty,
  valid,
}
