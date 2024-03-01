import 'package:talent_link/src/core/utils/validation/contact_validatior.dart';
import 'package:talent_link/src/presentation/screens/contact/utils/contact_controller.dart';

class ContactValidationUseCase {
  List<ContactValidationState> validateFormUseCase(
      {required ContactController contactController}) {
    List<ContactValidationState> validations = List.empty(growable: true);
    ContactValidationState validation;

    validation = validateContactNo(contactController.contactNo.text.trim());
    if (validation != ContactValidationState.valid) {
      validations.add(validation);
    }

    validation = validateContactType(contactController.contactType.text.trim());
    if (validation != ContactValidationState.valid) {
      validations.add(validation);
    }

    return validations;
  }

  ContactValidationState validateContactType(String contactType) {
    return ContactValidator.validateContactType(
      contactType,
    );
  }

  ContactValidationState validateContactNo(String contactNo) {
    return ContactValidator.validateContactNo(
      contactNo,
    );
  }
}
