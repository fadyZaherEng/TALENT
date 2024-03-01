class AddressValidator {
  static AddressValidationState validateName(String name) {
    if (name.isEmpty) {
      return AddressValidationState.nameEmpty;
    } else {
      return AddressValidationState.valid;
    }
  }

  static AddressValidationState validateArea(String area) {
    if (area.isEmpty) {
      return AddressValidationState.areaEmpty;
    } else {
      return AddressValidationState.valid;
    }
  }

  static AddressValidationState validateStreet(String street) {
    if (street.isEmpty) {
      return AddressValidationState.streetEmpty;
    } else {
      return AddressValidationState.valid;
    }
  }

  static AddressValidationState validateBuilding(String building) {
    if (building.isEmpty) {
      return AddressValidationState.buildingEmpty;
    } else {
      return AddressValidationState.valid;
    }
  }

  static AddressValidationState validateFloor(String floor) {
    if (floor.isEmpty) {
      return AddressValidationState.floorEmpty;
    } else {
      return AddressValidationState.valid;
    }
  }

  static AddressValidationState validateFlat(String flat) {
    if (flat.isEmpty) {
      return AddressValidationState.flatEmpty;
    } else {
      return AddressValidationState.valid;
    }
  }
}

enum AddressValidationState {
  nameEmpty,
  areaEmpty,
  streetEmpty,
  buildingEmpty,
  floorEmpty,
  flatEmpty,
  valid,
}
