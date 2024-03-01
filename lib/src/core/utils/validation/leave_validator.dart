import 'package:intl/intl.dart';

class LeaveValidator {
  static LeaveValidationState validateType(String type) {
    if (type.trim().isEmpty) {
      return LeaveValidationState.typeEmpty;
    } else {
      return LeaveValidationState.valid;
    }
  }

  static LeaveValidationState validateStartDate(
      String startDate, String endDate) {
    if (startDate.trim().isEmpty) {
      return LeaveValidationState.startDateEmpty;
    } else {
      if (endDate.trim().isNotEmpty) {
        final format = DateFormat('dd-MM-yyyy',"en");
        final startDateDateTime = format.parse(startDate);
        final endDateDateTime = format.parse(endDate);
        if (startDateDateTime.isAfter(endDateDateTime)) {
          return LeaveValidationState.startDateNotValid;
        }
      }

      return LeaveValidationState.valid;
    }
  }

  static LeaveValidationState validateEndDate(
      String endDate, String startDate, String expectedResumingDate) {
    if (endDate.trim().isEmpty) {
      return LeaveValidationState.endDateEmpty;
    } else {
      if (startDate.trim().isNotEmpty) {
        final format = DateFormat('dd-MM-yyyy',"en");
        final endDateDateTime = format.parse(endDate);
        final startDateDateTime = format.parse(startDate);
        if (endDateDateTime.isBefore(startDateDateTime)) {
          return LeaveValidationState.endDateNotValid;
        }
      }
      if (expectedResumingDate.trim().isNotEmpty) {
        final format = DateFormat('dd-MM-yyyy',"en");
        final endDateDateTime = format.parse(endDate);
        final expectedResumingDateTime = format.parse(expectedResumingDate);
        if (expectedResumingDateTime.isBefore(endDateDateTime)) {
          return LeaveValidationState.expectedResumingDateNotValid;
        }
      }
      return LeaveValidationState.valid;
    }
  }

  static LeaveValidationState validatePaymentMethod(
      String paymentMethod, bool isVisiblePaymentMethod) {
    if (isVisiblePaymentMethod) {
      if (paymentMethod.trim().isEmpty) {
        return LeaveValidationState.paymentMethodEmpty;
      } else {
        return LeaveValidationState.valid;
      }
    } else {
      return LeaveValidationState.valid;
    }
  }

  static LeaveValidationState validateExpectedResumingDate(
      String expectedResumingDate, bool isMandatory, String endDate) {
    if (expectedResumingDate.isNotEmpty) {
      if (isMandatory == true) {
        if (endDate.trim().isNotEmpty) {
          final format = DateFormat('dd-MM-yyyy',"en");
          final endDateDateTime = format.parse(endDate);
          final expectedResumingDateTime = format.parse(expectedResumingDate);
          if (expectedResumingDateTime.isBefore(endDateDateTime)) {
            return LeaveValidationState.expectedResumingDateNotValid;
          }
          return LeaveValidationState.valid;
        }
        return LeaveValidationState.valid;
      } else {
        if (endDate.trim().isNotEmpty) {
          final format = DateFormat('dd-MM-yyyy',"en");
          final endDateDateTime = format.parse(endDate);
          final expectedResumingDateTime = format.parse(expectedResumingDate);
          if (expectedResumingDateTime.isBefore(endDateDateTime)) {
            return LeaveValidationState.expectedResumingDateNotValid;
          }
          return LeaveValidationState.valid;
        }
        return LeaveValidationState.valid;
      }
    } else {
      return LeaveValidationState.valid;
    }
  }

  static LeaveValidationState validateContactNumber(
      String contactNumber, bool isMandatory) {
    if (isMandatory == true) {
      if (contactNumber.trim().isEmpty) {
        return LeaveValidationState.contactNumberEmpty;
      } else {
        return LeaveValidationState.valid;
      }
    } else {
      return LeaveValidationState.valid;
    }
  }

  static LeaveValidationState validateAddressDuringLeave(
      String addressDuringLeave, bool isMandatory) {
    if (isMandatory == true) {
      if (addressDuringLeave.trim().isEmpty) {
        return LeaveValidationState.addressDuringLeaveEmpty;
      } else {
        return LeaveValidationState.valid;
      }
    } else {
      return LeaveValidationState.valid;
    }
  }

  static LeaveValidationState validateAlternativeEmployee(
      String alternativeEmployee, bool isMandatory) {
    if (isMandatory == true) {
      if (alternativeEmployee.trim().isEmpty) {
        return LeaveValidationState.alternativeEmployeeEmpty;
      } else {
        return LeaveValidationState.valid;
      }
    } else {
      return LeaveValidationState.valid;
    }
  }

  static LeaveValidationState validateCurrantBalance(
      String currantBalance, bool isMandatory) {
    if (isMandatory == true) {
      if (currantBalance.trim().isEmpty) {
        return LeaveValidationState.currantBalanceEmpty;
      } else {
        return LeaveValidationState.valid;
      }
    } else {
      return LeaveValidationState.valid;
    }
  }

  static LeaveValidationState validateYearlyBalance(
      String yearlyBalance, bool isMandatory) {
    if (isMandatory == true) {
      if (yearlyBalance.trim().isEmpty) {
        return LeaveValidationState.yearlyBalanceEmpty;
      } else {
        return LeaveValidationState.valid;
      }
    } else {
      return LeaveValidationState.valid;
    }
  }

  static LeaveValidationState validateRemainingBalance(
      String remainingBalance, bool isMandatory) {
    if (isMandatory == true) {
      if (remainingBalance.trim().isEmpty) {
        return LeaveValidationState.remainingBalanceEmpty;
      } else {
        return LeaveValidationState.valid;
      }
    } else {
      return LeaveValidationState.valid;
    }
  }

  static LeaveValidationState validateLeaveDays(
      String leaveDays, bool isMandatory) {
    if (isMandatory == true) {
      if (leaveDays.trim().isEmpty) {
        return LeaveValidationState.leaveDaysEmpty;
      } else {
        return LeaveValidationState.valid;
      }
    } else {
      return LeaveValidationState.valid;
    }
  }

  static LeaveValidationState validateTotalAmount(
      String totalAmount, bool isMandatory) {
    if (isMandatory == true) {
      if (totalAmount.trim().isEmpty) {
        return LeaveValidationState.totalAmountEmpty;
      } else {
        return LeaveValidationState.valid;
      }
    } else {
      return LeaveValidationState.valid;
    }
  }

  static LeaveValidationState validateRemarks(
      String remarks, bool isMandatory) {
    if (isMandatory == true) {
      if (remarks.trim().isEmpty) {
        return LeaveValidationState.remarksEmpty;
      } else {
        return LeaveValidationState.valid;
      }
    } else {
      return LeaveValidationState.valid;
    }
  }

  static LeaveValidationState validateLeaveReasons(
      String leaveReasons, bool isMandatory) {
    if (isMandatory == true) {
      if (leaveReasons.trim().isEmpty) {
        return LeaveValidationState.leaveReasonsEmpty;
      } else {
        return LeaveValidationState.valid;
      }
    } else {
      return LeaveValidationState.valid;
    }
  }

  static LeaveValidationState validateFile(String file, bool isMandatory) {
    if (isMandatory == true) {
      if (file.trim().isEmpty) {
        return LeaveValidationState.fileEmpty;
      } else {
        return LeaveValidationState.valid;
      }
    } else {
      return LeaveValidationState.valid;
    }
  }
}

enum LeaveValidationState {
  typeEmpty,
  startDateEmpty,
  endDateEmpty,
  paymentMethodEmpty,
  expectedResumingDateEmpty,
  contactNumberEmpty,
  addressDuringLeaveEmpty,
  alternativeEmployeeEmpty,
  currantBalanceEmpty,
  yearlyBalanceEmpty,
  remainingBalanceEmpty,
  leaveDaysEmpty,
  totalAmountEmpty,
  leaveReasonsEmpty,
  remarksEmpty,
  fileEmpty,
  startDateNotValid,
  endDateNotValid,
  expectedResumingDateNotValid,
  valid,
}
