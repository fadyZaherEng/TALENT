import 'package:talent_link/src/core/utils/validation/short_leave_validator.dart';
import 'package:talent_link/src/domain/entities/all_fields/all_fields_mandatory.dart';
import 'package:talent_link/src/presentation/screens/short_leave/utils/short_leave_controller.dart';

class ShortLeaveValidationUseCase {
  List<ShortLeaveValidationState> validateFormUseCase({
    required String date,
    required String startTime,
    required String endTime,
    required List<AllFieldsMandatory> allFieldsMandatory,
    required String file,
    required ShortLeaveController shortLeaveController,
  }) {
    List<ShortLeaveValidationState> validations = List.empty(growable: true);
    ShortLeaveValidationState validation;
    for (var element in allFieldsMandatory) {
      if (element.fieldKey == "employeeShortLeaveAttachments") {
        validation = validateFile(file.trim(), element.isRequired);
        if (validation != ShortLeaveValidationState.valid) {
          validations.add(validation);
        }
      }
    }
    for (var element in allFieldsMandatory) {
      if (element.fieldKey == "remarks") {
        validation = validateRemarks(
            shortLeaveController.remarks.text.trim(), element.isRequired);
        if (validation != ShortLeaveValidationState.valid) {
          validations.add(validation);
        }
      }
    }
    for (var element in allFieldsMandatory) {
      if (element.fieldKey == "reason") {
        validation = validateLeaveReasons(
            shortLeaveController.leaveReasons.text.trim(), element.isRequired);
        if (validation != ShortLeaveValidationState.valid) {
          validations.add(validation);
        }
      }
    }
    for (var element in allFieldsMandatory) {
      if (element.fieldKey == "remainingbalance") {
        validation = validateRemainingBalance(
            shortLeaveController.remainingBalance.text.trim(),
            element.isRequired);
        if (validation != ShortLeaveValidationState.valid) {
          validations.add(validation);
        }
      }
    }
    for (var element in allFieldsMandatory) {
      if (element.fieldKey == "currentbalance") {
        validation = validateCurrentBalance(
            shortLeaveController.currentBalance.text.trim(),
            element.isRequired);
        if (validation != ShortLeaveValidationState.valid) {
          validations.add(validation);
        }
      }
    }

    for (var element in allFieldsMandatory) {
      if (element.fieldKey == "referenceContactNo") {
        validation = validateReferenceContactNo(
            shortLeaveController.referenceContactNo.text.trim(),
            element.isRequired);
        if (validation != ShortLeaveValidationState.valid) {
          validations.add(validation);
        }
      }
    }
    for (var element in allFieldsMandatory) {
      if (element.fieldKey == "referenceName") {
        validation = validateReferenceName(
            shortLeaveController.referenceName.text.trim(), element.isRequired);
        if (validation != ShortLeaveValidationState.valid) {
          validations.add(validation);
        }
      }
    }
    validation = validateEndNumberOfMinute(
        shortLeaveController.numberOfMinutes.text.trim());
    if (validation != ShortLeaveValidationState.valid) {
      validations.add(validation);
    }
    validation = validateEndTime(endTime.trim(), startTime.trim());
    if (validation != ShortLeaveValidationState.valid) {
      validations.add(validation);
    }
    validation = validateStartTime(startTime.trim(), endTime);
    if (validation != ShortLeaveValidationState.valid) {
      validations.add(validation);
    }
    validation = validateDate(date.trim());
    if (validation != ShortLeaveValidationState.valid) {
      validations.add(validation);
    }

    validation = validateType(shortLeaveController.type.text.trim());
    if (validation != ShortLeaveValidationState.valid) {
      validations.add(validation);
    }

    return validations;
  }

  ShortLeaveValidationState validateType(String type) {
    return ShortLeaveValidator.validateType(type);
  }

  ShortLeaveValidationState validateDate(String date) {
    return ShortLeaveValidator.validateDate(date);
  }

  ShortLeaveValidationState validateStartTime(
      String startTime, String endTime) {
    return ShortLeaveValidator.validateStartTime(startTime, endTime);
  }

  ShortLeaveValidationState validateEndTime(String endTime, String startTime) {
    return ShortLeaveValidator.validateEndTime(startTime, endTime);
  }

  ShortLeaveValidationState validateEndNumberOfMinute(
      String endNumberOfMinute) {
    return ShortLeaveValidator.validateEndNumberOfMinute(endNumberOfMinute);
  }

  ShortLeaveValidationState validateReferenceName(
      String referenceName, bool isMandatory) {
    return ShortLeaveValidator.validateReferenceName(
        referenceName, isMandatory);
  }

  ShortLeaveValidationState validateReferenceContactNo(
      String yearlyBalance, bool isMandatory) {
    return ShortLeaveValidator.validateReferenceContactNo(
        yearlyBalance, isMandatory);
  }

  ShortLeaveValidationState validateLeaveReasons(
      String leaveReasons, bool isMandatory) {
    return ShortLeaveValidator.validateLeaveReasons(leaveReasons, isMandatory);
  }

  ShortLeaveValidationState validateRemarks(String remarks, bool isMandatory) {
    return ShortLeaveValidator.validateRemarks(remarks, isMandatory);
  }

  ShortLeaveValidationState validateFile(String file, bool isMandatory) {
    return ShortLeaveValidator.validateFile(file, isMandatory);
  }

  ShortLeaveValidationState validateCurrentBalance(
      String currentBalance, bool isMandatory) {
    return ShortLeaveValidator.validateCurrentBalance(
        currentBalance, isMandatory);
  }

  ShortLeaveValidationState validateRemainingBalance(
      String remainingBalance, bool isMandatory) {
    return ShortLeaveValidator.validateRemainingBalance(
        remainingBalance, isMandatory);
  }
}
