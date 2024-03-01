class ResumeDutyValidator {
  static ResumeDutyValidationState validateReferenceType(String referenceType) {
    if (referenceType.trim().isEmpty) {
      return ResumeDutyValidationState.referenceTypeEmpty;
    } else {
      return ResumeDutyValidationState.valid;
    }
  }

  static ResumeDutyValidationState validateReferenceData(String referenceData) {
    if (referenceData.trim().isEmpty) {
      return ResumeDutyValidationState.referenceDataEmpty;
    } else {
      return ResumeDutyValidationState.valid;
    }
  }

  static ResumeDutyValidationState validatePaymentMethod(
      String paymentMethod, bool isVisiblePaymentMethod) {
    if (isVisiblePaymentMethod) {
      if (paymentMethod.trim().isEmpty) {
        return ResumeDutyValidationState.paymentMethodEmpty;
      } else {
        return ResumeDutyValidationState.valid;
      }
    } else {
      return ResumeDutyValidationState.valid;
    }
  }

  static ResumeDutyValidationState validateActualResumeDutyDate(
      String actualResumeDutyDate) {
    if (actualResumeDutyDate.trim().isEmpty) {
      return ResumeDutyValidationState.actualResumeDutyDateEmpty;
    } else {
      return ResumeDutyValidationState.valid;
    }
  }

  static ResumeDutyValidationState validateRemarks(
      String remarks, bool isMandatory) {
    if (isMandatory == true) {
      if (remarks.trim().isEmpty) {
        return ResumeDutyValidationState.remarksEmpty;
      } else {
        return ResumeDutyValidationState.valid;
      }
    } else {
      return ResumeDutyValidationState.valid;
    }
  }

  static ResumeDutyValidationState validateFile(String file, bool isMandatory) {
    if (isMandatory == true) {
      if (file.trim().isEmpty) {
        return ResumeDutyValidationState.fileEmpty;
      } else {
        return ResumeDutyValidationState.valid;
      }
    } else {
      return ResumeDutyValidationState.valid;
    }
  }
}

enum ResumeDutyValidationState {
  referenceTypeEmpty,
  referenceDataEmpty,
  paymentMethodEmpty,
  actualResumeDutyDateEmpty,
  fileEmpty,
  remarksEmpty,
  valid,
}
