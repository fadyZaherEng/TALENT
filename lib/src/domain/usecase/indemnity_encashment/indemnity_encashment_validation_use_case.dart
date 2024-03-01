import 'package:talent_link/src/core/utils/validation/indemnity_encashment_validator.dart';
import 'package:talent_link/src/domain/entities/all_fields/all_fields_mandatory.dart';
import 'package:talent_link/src/presentation/screens/indemnity_encashment/utils/indemnity_encashment_controller.dart';

class IndemnityEncashmentValidationUseCase {
  List<IndemnityEncashmentValidationState> validateFormUseCase(
      {required String requestedDate,
      required String paymentMonth,
      required List<AllFieldsMandatory> allFieldsMandatory,
      required String file,
      required IndemnityEncashmentController indemnityEncashmentController,
      required int maximDays,
      required bool isVisiblePaymentMethod}) {
    List<IndemnityEncashmentValidationState> validations =
        List.empty(growable: true);
    IndemnityEncashmentValidationState validation;

    for (var element in allFieldsMandatory) {
      if (element.fieldKey == 'employeeIndemnityEncashmentAttachments') {
        validation = validateFile(file.trim(), element.isRequired);
        if (validation != IndemnityEncashmentValidationState.valid) {
          validations.add(validation);
        }
      }
    }
    for (var element in allFieldsMandatory) {
      if (element.fieldKey == 'remarks') {
        validation = validateRemarks(
            indemnityEncashmentController.remarks.text.trim(),
            element.isRequired);
        if (validation != IndemnityEncashmentValidationState.valid) {
          validations.add(validation);
        }
      }
    }

    validation = validatePaymentMethod(
        indemnityEncashmentController.paymentMethod.text.trim(),isVisiblePaymentMethod);
    if (validation != IndemnityEncashmentValidationState.valid) {
      validations.add(validation);
    }

    validation = validatePaymentMonth(paymentMonth.trim());
    if (validation != IndemnityEncashmentValidationState.valid) {
      validations.add(validation);
    }

    validation = validateRequestedDays(
        indemnityEncashmentController.requestedDays.text.toString().trim(),
        maximDays);
    if (validation != IndemnityEncashmentValidationState.valid) {
      validations.add(validation);
    }

    validation = validateRequestDate(requestedDate.trim());
    if (validation != IndemnityEncashmentValidationState.valid) {
      validations.add(validation);
    }

    return validations;
  }

  IndemnityEncashmentValidationState validateRequestDate(String requestedDate) {
    return IndemnityEncashmentValidator.validateRequestDate(
      requestedDate,
    );
  }

  IndemnityEncashmentValidationState validateRequestedDays(
      String requestedDays, int maximDays) {
    return IndemnityEncashmentValidator.validateRequestedDays(
        requestedDays, maximDays);
  }

  IndemnityEncashmentValidationState validatePaymentMonth(String paymentMonth) {
    return IndemnityEncashmentValidator.validatePaymentMonth(
      paymentMonth,
    );
  }

  IndemnityEncashmentValidationState validatePaymentMethod(
      String paymentMethod,bool isVisiblePaymentMethod) {
    return IndemnityEncashmentValidator.validatePaymentMethod(
      paymentMethod,
        isVisiblePaymentMethod
    );
  }

  IndemnityEncashmentValidationState validateRemarks(
      String remarks, bool isMandatory) {
    return IndemnityEncashmentValidator.validateRemarks(remarks, isMandatory);
  }

  IndemnityEncashmentValidationState validateFile(
      String file, bool isMandatory) {
    return IndemnityEncashmentValidator.validateFile(file, isMandatory);
  }
}
