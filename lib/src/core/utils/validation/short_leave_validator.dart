import 'package:intl/intl.dart';

class ShortLeaveValidator {
  static ShortLeaveValidationState validateType(String type) {
    if (type.trim().isEmpty) {
      return ShortLeaveValidationState.typeEmpty;
    } else {
      return ShortLeaveValidationState.valid;
    }
  }

  static ShortLeaveValidationState validateDate(String date) {
    if (date.trim().isEmpty) {
      return ShortLeaveValidationState.dateEmpty;
    } else {
      return ShortLeaveValidationState.valid;
    }
  }

  static ShortLeaveValidationState validateStartTime(
      String startTime, String endTime) {
    if (startTime.trim().isEmpty) {
      return ShortLeaveValidationState.startTimeEmpty;
    } else {
      final format = DateFormat('hh:mm a','en');
      final startTimeDateTime = format.parse(startTime);
      if (endTime.isNotEmpty) {
        final endTimeDateTime = format.parse(endTime);
        if (startTimeDateTime.isBefore(endTimeDateTime)) {
          return ShortLeaveValidationState.valid;
        } else {
          return ShortLeaveValidationState.startTimeNotValid;
        }
      } else {
        return ShortLeaveValidationState.valid;
      }
    }
  }

  static ShortLeaveValidationState validateEndTime(
      String startTime, String endTime) {
    if (endTime.trim().isEmpty) {
      return ShortLeaveValidationState.endTimeEmpty;
    } else {
      final format = DateFormat('hh:mm a',"en");
      final endTimeDateTime = format.parse(endTime);

      if (startTime.isNotEmpty) {
        final startTimeDateTime = format.parse(startTime);
        if (endTimeDateTime.isAfter(startTimeDateTime)) {
          return ShortLeaveValidationState.valid;
        } else {
          return ShortLeaveValidationState.endTimeNotValid;
        }
      } else {
        return ShortLeaveValidationState.valid;
      }
    }
  }

  static ShortLeaveValidationState validateEndNumberOfMinute(
      String endNumberOfMinute) {
    if (endNumberOfMinute.trim().isEmpty) {
      return ShortLeaveValidationState.endNumberOfMinuteEmpty;
    } else {
      return ShortLeaveValidationState.valid;
    }
  }

  static ShortLeaveValidationState validateReferenceName(
      String referenceName, bool isMandatory) {
    if (isMandatory == true) {
      if (referenceName.trim().isEmpty) {
        return ShortLeaveValidationState.referenceNameEmpty;
      } else {
        return ShortLeaveValidationState.valid;
      }
    } else {
      return ShortLeaveValidationState.valid;
    }
  }

  static ShortLeaveValidationState validateReferenceContactNo(
      String yearlyBalance, bool isMandatory) {
    if (isMandatory == true) {
      if (yearlyBalance.trim().isEmpty) {
        return ShortLeaveValidationState.referenceContactNoEmpty;
      } else {
        return ShortLeaveValidationState.valid;
      }
    } else {
      return ShortLeaveValidationState.valid;
    }
  }

  static ShortLeaveValidationState validateLeaveReasons(
      String leaveReasons, bool isMandatory) {
    if (isMandatory == true) {
      if (leaveReasons.trim().isEmpty) {
        return ShortLeaveValidationState.leaveReasonsEmpty;
      } else {
        return ShortLeaveValidationState.valid;
      }
    } else {
      return ShortLeaveValidationState.valid;
    }
  }

  static ShortLeaveValidationState validateRemarks(
      String remarks, bool isMandatory) {
    if (isMandatory == true) {
      if (remarks.trim().isEmpty) {
        return ShortLeaveValidationState.remarksEmpty;
      } else {
        return ShortLeaveValidationState.valid;
      }
    } else {
      return ShortLeaveValidationState.valid;
    }
  }

  static ShortLeaveValidationState validateCurrentBalance(
      String currentBalance, bool isMandatory) {
    if (isMandatory == true) {
      if (currentBalance.trim().isEmpty) {
        return ShortLeaveValidationState.currentBalanceEmpty;
      } else {
        return ShortLeaveValidationState.valid;
      }
    } else {
      return ShortLeaveValidationState.valid;
    }
  }

  static ShortLeaveValidationState validateRemainingBalance(
      String remainingBalance, bool isMandatory) {
    if (isMandatory == true) {
      if (remainingBalance.trim().isEmpty) {
        return ShortLeaveValidationState.remainingBalanceEmpty;
      } else {
        return ShortLeaveValidationState.valid;
      }
    } else {
      return ShortLeaveValidationState.valid;
    }
  }

  static ShortLeaveValidationState validateFile(String file, bool isMandatory) {
    if (isMandatory == true) {
      if (file.trim().isEmpty) {
        return ShortLeaveValidationState.fileEmpty;
      } else {
        return ShortLeaveValidationState.valid;
      }
    } else {
      return ShortLeaveValidationState.valid;
    }
  }
}

enum ShortLeaveValidationState {
  typeEmpty,
  dateEmpty,
  startTimeEmpty,
  endTimeEmpty,
  endNumberOfMinuteEmpty,
  referenceNameEmpty,
  referenceContactNoEmpty,
  leaveReasonsEmpty,
  remarksEmpty,
  fileEmpty,
  remainingBalanceEmpty,
  currentBalanceEmpty,
  startTimeNotValid,
  endTimeNotValid,
  valid,
}
