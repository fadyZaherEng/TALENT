import 'package:talent_link/src/core/utils/validation/half_day_leave_validator.dart';
import 'package:talent_link/src/domain/entities/all_fields/all_fields_mandatory.dart';
import 'package:talent_link/src/presentation/screens/half_day_leave/utils/half_day_leave_controller.dart';

class HalfDayLeaveValidationUseCase {
  List<HalfDayLeaveValidationState> validateFormUseCase({
    required String halfLeaveDate,
    required String startTime,
    required String endTime,
    required List<AllFieldsMandatory> allFieldsMandatory,
    required String file,
    required HalfDayLeaveController halfDayLeaveController,
  }) {
    List<HalfDayLeaveValidationState> validations = List.empty(growable: true);
    HalfDayLeaveValidationState validation;

    for (var element in allFieldsMandatory) {
      if (element.fieldKey == "employeeHalfDayLeaveAttachments") {
        validation = validateFile(file.trim(), element.isRequired);
        if (validation != HalfDayLeaveValidationState.valid) {
          validations.add(validation);
        }
      }
    }

    for (var element in allFieldsMandatory) {
      if (element.fieldKey == "reason") {
        validation = validateLeaveReasons(
            halfDayLeaveController.leaveReasons.text.trim(),
            element.isRequired);
        if (validation != HalfDayLeaveValidationState.valid) {
          validations.add(validation);
        }
      }
    }
    for (var element in allFieldsMandatory) {
      if (element.fieldKey == "remarks") {
        validation = validateRemarks(
            halfDayLeaveController.remarks.text.trim(), element.isRequired);
        if (validation != HalfDayLeaveValidationState.valid) {
          validations.add(validation);
        }
      }
    }
    validation = validateNumberOfMinute(
        halfDayLeaveController.numberOfMinute.text.trim());
    if (validation != HalfDayLeaveValidationState.valid) {
      validations.add(validation);
    }
    validation = validateEndTime(endTime.trim(),startTime.trim());
    if (validation != HalfDayLeaveValidationState.valid) {
      validations.add(validation);
    }

    validation = validateStartTime(startTime.trim(),endTime.trim());
    if (validation != HalfDayLeaveValidationState.valid) {
      validations.add(validation);
    }

    validation = validateHalfLeaveDate(halfLeaveDate.trim());
    if (validation != HalfDayLeaveValidationState.valid) {
      validations.add(validation);
    }

    validation =
        validateHalfLeaveType(halfDayLeaveController.halfLeaveType.text.trim());
    if (validation != HalfDayLeaveValidationState.valid) {
      validations.add(validation);
    }

    return validations;
  }

  HalfDayLeaveValidationState validateNumberOfMinute(String numberOfMinute) {
    return HalfDayLeaveValidator.validateNumberOfMinute(
      numberOfMinute,
    );
  }

  HalfDayLeaveValidationState validateEndTime(String endTime ,String startTime) {
    return HalfDayLeaveValidator.validateEndTime(
      endTime,
      startTime
    );
  }

  HalfDayLeaveValidationState validateStartTime(String startTime,String endTime) {
    return HalfDayLeaveValidator.validateStartTime(
      startTime,
      endTime
    );
  }

  HalfDayLeaveValidationState validateHalfLeaveDate(String halfLeaveDate) {
    return HalfDayLeaveValidator.validateHalfLeaveDate(
      halfLeaveDate,
    );
  }

  HalfDayLeaveValidationState validateHalfLeaveType(String halfLeaveType) {
    return HalfDayLeaveValidator.validateHalfLeaveType(
      halfLeaveType,
    );
  }

  HalfDayLeaveValidationState validateLeaveReasons(
      String leaveReasons, bool isMandatory) {
    return HalfDayLeaveValidator.validateLeaveReasons(
        leaveReasons, isMandatory);
  }

  HalfDayLeaveValidationState validateRemarks(
      String remarks, bool isMandatory) {
    return HalfDayLeaveValidator.validateRemarks(remarks, isMandatory);
  }

  HalfDayLeaveValidationState validateFile(String file, bool isMandatory) {
    return HalfDayLeaveValidator.validateFile(file, isMandatory);
  }
}
