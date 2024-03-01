import 'package:talent_link/src/core/utils/validation/asset_validator.dart';
import 'package:talent_link/src/presentation/screens/asset/utils/asset_controller.dart';

class AssetValidationUseCase {
  List<AssetValidationState> validateAssetFormUseCase({
    required AssetController assetController,
  }) {
    List<AssetValidationState> validations = List.empty(growable: true);
    AssetValidationState validation;

    validation = validateAssetType(assetController.assetType.text.trim());
    if (validation != AssetValidationState.valid) {
      validations.add(validation);
    }

    validation = validateQuantity(assetController.quantity.text.trim());
    if (validation != AssetValidationState.valid) {
      validations.add(validation);
    }

    return validations;
  }

  AssetValidationState validateAssetType(String type) {
    return AssetValidator.validateAssetType(
      type,
    );
  }

  AssetValidationState validateQuantity(String quantity) {
    return AssetValidator.validateQuantity(
      quantity,
    );
  }
}
