class AirTicketValidator {
  static AirTicketValidationState validatePaymentMethod(
      String paymentMethod, bool isVisible) {
    if (isVisible) {
      if (paymentMethod.isEmpty) {
        return AirTicketValidationState.paymentMethodEmpty;
      } else {
        return AirTicketValidationState.valid;
      }
    } else {
      return AirTicketValidationState.valid;
    }
  }

  static AirTicketValidationState validateRequestedDate(String requestedDate) {
    if (requestedDate.isEmpty) {
      return AirTicketValidationState.requestedDateEmpty;
    } else {
      return AirTicketValidationState.valid;
    }
  }

  static AirTicketValidationState validateAirTicketDueMonth(
      String airTicketDueMonth) {
    if (airTicketDueMonth.isEmpty) {
      return AirTicketValidationState.airTicketDueMonthEmpty;
    } else {
      return AirTicketValidationState.valid;
    }
  }

  static AirTicketValidationState validateAirTicketDueYear(
      String airTicketDueYear) {
    if (airTicketDueYear.isEmpty) {
      return AirTicketValidationState.airTicketDueYearEmpty;
    } else {
      return AirTicketValidationState.valid;
    }
  }
}

enum AirTicketValidationState {
  paymentMethodEmpty,
  requestedDateEmpty,
  airTicketDueMonthEmpty,
  airTicketDueYearEmpty,
  valid,
}
