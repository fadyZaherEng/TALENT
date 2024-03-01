import 'package:talent_link/src/core/utils/validation/resume_duty_validator.dart';
import 'package:talent_link/src/domain/entities/all_fields/all_fields_mandatory.dart';
import 'package:talent_link/src/presentation/screens/resume_duty/utils/resume_duty_controller.dart';

class ResumeDutyValidationUseCase {
  List<ResumeDutyValidationState> validateFormUseCase(
      {required List<AllFieldsMandatory> allFieldsMandatory,
      required String file,
      required String actualResumeDutyData,
      required ResumeDutyController resumeDutyController,
      required bool isVisiblePaymentMethod}) {
    List<ResumeDutyValidationState> validations = List.empty(growable: true);
    ResumeDutyValidationState validation;
    for (var element in allFieldsMandatory) {
      if (element.fieldKey == "remarks") {
        validation = validateRemarks(
            resumeDutyController.remarks.text.trim(), element.isRequired);
        if (validation != ResumeDutyValidationState.valid) {
          validations.add(validation);
        }
      }
    }
    for (var element in allFieldsMandatory) {
      if (element.fieldKey == "EmployeeResumeDutyAttachments") {
        validation = validateFile(file.trim(), element.isRequired);
        if (validation != ResumeDutyValidationState.valid) {
          validations.add(validation);
        }
      }
    }
    validation = validateActualResumeDutyDate(actualResumeDutyData.trim());
    if (validation != ResumeDutyValidationState.valid) {
      validations.add(validation);
    }
    validation = validatePaymentMethod(
        resumeDutyController.paymentMethod.text.trim(), isVisiblePaymentMethod);
    if (validation != ResumeDutyValidationState.valid) {
      validations.add(validation);
    }
    validation =
        validateReferenceData(resumeDutyController.referenceData.text.trim());
    if (validation != ResumeDutyValidationState.valid) {
      validations.add(validation);
    }

    validation =
        validateReferenceType(resumeDutyController.referenceType.text.trim());
    if (validation != ResumeDutyValidationState.valid) {
      validations.add(validation);
    }

    return validations;
  }

  ResumeDutyValidationState validateReferenceType(String referenceType) {
    return ResumeDutyValidator.validateReferenceType(referenceType);
  }

  ResumeDutyValidationState validateReferenceData(String referenceData) {
    return ResumeDutyValidator.validateReferenceData(referenceData);
  }

  ResumeDutyValidationState validatePaymentMethod(
      String paymentMethod, bool isVisiblePaymentMethod) {
    return ResumeDutyValidator.validatePaymentMethod(
        paymentMethod, isVisiblePaymentMethod);
  }

  ResumeDutyValidationState validateActualResumeDutyDate(
      String actualResumeDutyData) {
    return ResumeDutyValidator.validateActualResumeDutyDate(
        actualResumeDutyData);
  }

  ResumeDutyValidationState validateRemarks(String remarks, bool isMandatory) {
    return ResumeDutyValidator.validateRemarks(remarks, isMandatory);
  }

  ResumeDutyValidationState validateFile(String file, bool isMandatory) {
    return ResumeDutyValidator.validateFile(file, isMandatory);
  }
}
