import 'package:talent_link/src/core/utils/validation/education_validator.dart';
import 'package:talent_link/src/presentation/screens/education/utils/education_controller.dart';

class EducationValidationUseCase {
  List<EducationValidationState> validateFormUseCase({
    required EducationController educationController,
    required String issueDate,
    required String expiryDate,
  }) {
    List<EducationValidationState> validations = List.empty(growable: true);
    EducationValidationState validation;
    validation = validateExpiryDate(expiryDate.trim());
    if (validation != EducationValidationState.valid) {
      validations.add(validation);
    }
    validation = validateIssueDate(issueDate.trim());
    if (validation != EducationValidationState.valid) {
      validations.add(validation);
    }

    validation = validateCountry(educationController.country.text.trim());
    if (validation != EducationValidationState.valid) {
      validations.add(validation);
    }

    validation = validateQualificationPlaceName(
        educationController.qualificationPlaceName.text.trim());
    if (validation != EducationValidationState.valid) {
      validations.add(validation);
    }

    validation = validateQualificationType(
        educationController.qualificationType.text.trim());
    if (validation != EducationValidationState.valid) {
      validations.add(validation);
    }

    return validations;
  }

  EducationValidationState validateQualificationType(String qualificationType) {
    return EducationValidator.validateQualificationType(
      qualificationType,
    );
  }

  EducationValidationState validateQualificationPlaceName(
      String qualificationPlaceName) {
    return EducationValidator.validateQualificationPlaceName(
      qualificationPlaceName,
    );
  }

  EducationValidationState validateCountry(String country) {
    return EducationValidator.validateCountry(
      country,
    );
  }

  EducationValidationState validateIssueDate(String issueDate) {
    return EducationValidator.validateIssueDate(
      issueDate,
    );
  }

  EducationValidationState validateExpiryDate(String expiryDate) {
    return EducationValidator.validateExpiryDate(
      expiryDate,
    );
  }
}
