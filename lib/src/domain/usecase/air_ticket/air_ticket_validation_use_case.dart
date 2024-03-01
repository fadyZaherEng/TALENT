import 'package:talent_link/src/core/utils/validation/air_ticket_validator.dart';
import 'package:talent_link/src/presentation/screens/air_ticket/utils/air_ticket_controller.dart';

class AirTicketValidationUseCase {
  List<AirTicketValidationState> validateFormUseCase({
    required AirTicketController airTicketController,
    required String requestedDate,
    required String airTicketDueMonth,
    required String airTicketDueYear,
    required bool isVisible,
  }) {
    List<AirTicketValidationState> validations = List.empty(growable: true);
    AirTicketValidationState validation;

    validation = validatePaymentMethod(
        airTicketController.paymentMethod.text.trim(), isVisible);
    if (validation != AirTicketValidationState.valid) {
      validations.add(validation);
    }
    validation = validateRequestedDate(requestedDate.trim());
    if (validation != AirTicketValidationState.valid) {
      validations.add(validation);
    }

    validation = validateAirTicketDueMonth(airTicketDueMonth.trim());
    if (validation != AirTicketValidationState.valid) {
      validations.add(validation);
    }

    validation = validateAirTicketDueYear(airTicketDueYear.trim());
    if (validation != AirTicketValidationState.valid) {
      validations.add(validation);
    }

    return validations;
  }

  AirTicketValidationState validatePaymentMethod(
      String paymentMethod, bool isVisible) {
    return AirTicketValidator.validatePaymentMethod(paymentMethod, isVisible);
  }

  AirTicketValidationState validateRequestedDate(String requestedDate) {
    return AirTicketValidator.validateRequestedDate(
      requestedDate,
    );
  }

  AirTicketValidationState validateAirTicketDueMonth(String airTicketDueMonth) {
    return AirTicketValidator.validateAirTicketDueMonth(
      airTicketDueMonth,
    );
  }

  AirTicketValidationState validateAirTicketDueYear(String airTicketDueYear) {
    return AirTicketValidator.validateAirTicketDueYear(
      airTicketDueYear,
    );
  }
}
