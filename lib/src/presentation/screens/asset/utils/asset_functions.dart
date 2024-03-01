class AssetFunctions {
  final Function() onTapAssetType;
  final Function() onTapSubmit;
  final Function(String value) onChangeQuantity;

  AssetFunctions({
    required this.onChangeQuantity,
    required this.onTapAssetType,
    required this.onTapSubmit,
  });
}
