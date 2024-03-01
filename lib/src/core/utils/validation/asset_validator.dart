class AssetValidator {
  static AssetValidationState validateAssetType(String assetType) {
    if (assetType.isEmpty) {
      return AssetValidationState.typeEmpty;
    } else {
      return AssetValidationState.valid;
    }
  }

  static AssetValidationState validateQuantity(String quantity) {
    if (quantity.isEmpty) {
      return AssetValidationState.quantityEmpty;
    } else {
      return AssetValidationState.valid;
    }
  }
}

enum AssetValidationState {
  typeEmpty,
  quantityEmpty,
  valid,
}
