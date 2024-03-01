part of 'asset_bloc.dart';

@immutable
abstract class AssetEvent extends Equatable {
  @override
  List<Object?> get props => [identityHashCode(this)];
}

class AssetBackEvent extends AssetEvent {}

class AssetDataFillingEvent extends AssetEvent {
  AssetController assetController;
  AssetDataFillingEvent({required this.assetController});
}

class AssetValidationQuantityEvent extends AssetEvent {
  final String value;

  AssetValidationQuantityEvent({
    required this.value,
  });
}

class AssetValidationAssetTypeEvent extends AssetEvent {
  final String value;

  AssetValidationAssetTypeEvent({required this.value});
}

class AssetSubmitEvent extends AssetEvent {
  final AssetController assetController;
  final int typeId;

  AssetSubmitEvent({
    required this.assetController,
    required this.typeId,
  });
}

class GetAssetTypeListEvent extends AssetEvent {}

class OpenAssetTypeBottomSheetEvent extends AssetEvent {}

class SelectAssetTypeEvent extends AssetEvent {
  final RequestType requestType;

  SelectAssetTypeEvent({
    required this.requestType,
  });
}
