import 'package:flutter/material.dart';

class AssetController {
  final TextEditingController assetType;
  final TextEditingController quantity;
  final TextEditingController remarks;

  AssetController({
    required this.assetType,
    required this.quantity,
    required this.remarks,
  });
}
