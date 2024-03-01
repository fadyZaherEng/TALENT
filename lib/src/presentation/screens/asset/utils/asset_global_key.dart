import 'package:flutter/material.dart';

class AssetGlobalKey {
  final GlobalKey assetType;
  final GlobalKey quantity;

  AssetGlobalKey({
    required this.quantity,
    required this.assetType,
  });
}
