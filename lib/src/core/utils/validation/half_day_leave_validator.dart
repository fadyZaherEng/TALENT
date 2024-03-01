import 'package:intl/intl.dart';

class HalfDayLeaveValidator {
  static HalfDayLeaveValidationState validateHalfLeaveType(
      String halfLeaveType) {
    if (halfLeaveType.trim().isEmpty) {
      return HalfDayLeaveValidationState.halfLeaveTypeEmpty;
    } else {
      return HalfDayLeaveValidationState.valid;
    }
  }

  static HalfDayLeaveValidationState validateHalfLeaveDate(
      String halfLeaveDate) {
    if (halfLeaveDate.trim().isEmpty) {
      return HalfDayLeaveValidationState.halfLeaveDateEmpty;
    } else {
      return HalfDayLeaveValidationState.valid;
    }
  }

  static HalfDayLeaveValidationState validateStartTime(
      String startTime, String endTime) {
    if (startTime.trim().isEmpty) {
      return HalfDayLeaveValidationState.startTimeEmpty;
    } else {
      final format = DateFormat('hh:mm a',"en");
      final startTimeDateTime = format.parse(startTime);
      if (endTime.trim().isNotEmpty) {
        final endTimeDateTime = format.parse(endTime);
        if (startTimeDateTime.isBefore(endTimeDateTime)) {
          return HalfDayLeaveValidationState.valid;
        } else {
          return HalfDayLeaveValidationState.startTimeNotValid;
        }
      } else {
        return HalfDayLeaveValidationState.valid;
      }
    }
  }

  static HalfDayLeaveValidationState validateEndTime(
      String endTime, String startTime) {
    if (endTime.trim().isEmpty) {
      return HalfDayLeaveValidationState.endTimeEmpty;
    } else {
      final format = DateFormat('hh:mm a',"en");
      final endTimeDateTime = format.parse(endTime);
      if (startTime.trim().isNotEmpty) {
        final startTimeDateTime = format.parse(startTime);
        if (endTimeDateTime.isAfter(startTimeDateTime)) {
          return HalfDayLeaveValidationState.valid;
        } else {
          return HalfDayLeaveValidationState.endTimeNotValid;
        }
      } else {
        return HalfDayLeaveValidationState.valid;
      }
    }
  }

  static HalfDayLeaveValidationState validateNumberOfMinute(
      String numberOfMinute) {
    if (numberOfMinute.trim().isEmpty) {
      return HalfDayLeaveValidationState.numberOfMinuteEmpty;
    } else {
      return HalfDayLeaveValidationState.valid;
    }
  }

  static HalfDayLeaveValidationState validateLeaveReasons(
      String reasons, bool isMandatory) {
    if (isMandatory == true) {
      if (reasons.trim().isEmpty) {
        return HalfDayLeaveValidationState.leaveReasonsEmpty;
      } else {
        return HalfDayLeaveValidationState.valid;
      }
    } else {
      return HalfDayLeaveValidationState.valid;
    }
  }

  static HalfDayLeaveValidationState validateRemarks(
      String remarks, bool isMandatory) {
    if (isMandatory == true) {
      if (remarks.trim().isEmpty) {
        return HalfDayLeaveValidationState.leaveRemarksEmpty;
      } else {
        return HalfDayLeaveValidationState.valid;
      }
    } else {
      return HalfDayLeaveValidationState.valid;
    }
  }

  static HalfDayLeaveValidationState validateFile(
      String file, bool isMandatory) {
    if (isMandatory == true) {
      if (file.trim().isEmpty) {
        return HalfDayLeaveValidationState.fileEmpty;
      } else {
        return HalfDayLeaveValidationState.valid;
      }
    } else {
      return HalfDayLeaveValidationState.valid;
    }
  }
}

enum HalfDayLeaveValidationState {
  halfLeaveTypeEmpty,
  halfLeaveDateEmpty,
  startTimeEmpty,
  endTimeEmpty,
  numberOfMinuteEmpty,
  leaveRemarksEmpty,
  leaveReasonsEmpty,
  endTimeNotValid,
  startTimeNotValid,
  fileEmpty,
  valid,
}
