class LoansValidator {
  static LoansValidationState validateType(String type) {
    if (type.trim().isEmpty) {
      return LoansValidationState.typeEmpty;
    } else {
      return LoansValidationState.valid;
    }
  }

  static LoansValidationState validateLoanRequestedDate(String requestedDate) {
    if (requestedDate.trim().isEmpty) {
      return LoansValidationState.loanRequestedDateEmpty;
    } else {
      return LoansValidationState.valid;
    }
  }

  static LoansValidationState validateLoanStartDate(String startDate) {
    if (startDate.trim().isEmpty) {
      return LoansValidationState.loanStartDateEmpty;
    } else {
      return LoansValidationState.valid;
    }
  }

  static LoansValidationState validateLoanRequestedAmount(
      String requestedAmount) {
    if (requestedAmount.trim().isEmpty) {
      return LoansValidationState.loanRequestedAmountEmpty;
    } else {
      return LoansValidationState.valid;
    }
  }

  static LoansValidationState validateLoanProfitRate(String profitRate) {
    if (profitRate.trim().isEmpty) {
      return LoansValidationState.loanProfitRateEmpty;
    } else {
      return LoansValidationState.valid;
    }
  }

  static LoansValidationState validateLoanTotalAmount(String totalAmount) {
    if (totalAmount.trim().isEmpty) {
      return LoansValidationState.loanTotalAmountEmpty;
    } else {
      return LoansValidationState.valid;
    }
  }

  static LoansValidationState validateInstallments(String installments) {
    if (installments.trim().isEmpty) {
      return LoansValidationState.loanInstallmentsEmpty;
    } else {
      return LoansValidationState.valid;
    }
  }

  static LoansValidationState validatePaymentMethod(
      String paymentMethod, bool isVisiblePaymentMethod) {
    if (isVisiblePaymentMethod) {
      if (paymentMethod.trim().isEmpty) {
        return LoansValidationState.loanPaymentMethodEmpty;
      } else {
        return LoansValidationState.valid;
      }
    } else {
      return LoansValidationState.valid;
    }
  }

  static LoansValidationState validateRemarks(
      String remarks, bool isMandatory) {
    if (isMandatory == true) {
      if (remarks.trim().isEmpty) {
        return LoansValidationState.loanRemarksEmpty;
      } else {
        return LoansValidationState.valid;
      }
    } else {
      return LoansValidationState.valid;
    }
  }

  static LoansValidationState validateFile(String file, bool isMandatory) {
    if (isMandatory == true) {
      if (file.trim().isEmpty) {
        return LoansValidationState.fileEmpty;
      } else {
        return LoansValidationState.valid;
      }
    } else {
      return LoansValidationState.valid;
    }
  }
}

enum LoansValidationState {
  typeEmpty,
  fileEmpty,
  loanRequestedDateEmpty,
  loanStartDateEmpty,
  loanRequestedAmountEmpty,
  loanProfitRateEmpty,
  loanTotalAmountEmpty,
  loanInstallmentsEmpty,
  loanPaymentMethodEmpty,
  loanRemarksEmpty,
  valid,
}
