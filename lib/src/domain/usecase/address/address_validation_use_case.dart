import 'package:talent_link/src/core/utils/validation/address_validator.dart';
import 'package:talent_link/src/presentation/screens/address/utils/address_controller.dart';

class AddressValidationUseCase {
  List<AddressValidationState> validateAddressFormUseCase({
    required AddressController addressController,
  }) {
    List<AddressValidationState> validations = List.empty(growable: true);
    AddressValidationState validation;

    validation = validateFlat(addressController.flat.text.trim());
    if (validation != AddressValidationState.valid) {
      validations.add(validation);
    }
    validation = validateFloor(addressController.floor.text.trim());
    if (validation != AddressValidationState.valid) {
      validations.add(validation);
    }

    validation = validateBuilding(addressController.building.text.trim());
    if (validation != AddressValidationState.valid) {
      validations.add(validation);
    }

    validation = validateStreet(addressController.street.text.trim());
    if (validation != AddressValidationState.valid) {
      validations.add(validation);
    }
    validation = validateArea(addressController.area.text.trim());
    if (validation != AddressValidationState.valid) {
      validations.add(validation);
    }

    validation = validateName(addressController.name.text.trim());
    if (validation != AddressValidationState.valid) {
      validations.add(validation);
    }

    return validations;
  }

  AddressValidationState validateFlat(String flat) {
    return AddressValidator.validateFlat(
      flat,
    );
  }

  AddressValidationState validateFloor(String floor) {
    return AddressValidator.validateFloor(
      floor,
    );
  }

  AddressValidationState validateBuilding(String building) {
    return AddressValidator.validateBuilding(
      building,
    );
  }

  AddressValidationState validateStreet(String street) {
    return AddressValidator.validateStreet(
      street,
    );
  }

  AddressValidationState validateArea(String area) {
    return AddressValidator.validateArea(
      area,
    );
  }

  AddressValidationState validateName(String name) {
    return AddressValidator.validateName(
      name,
    );
  }
}
