part of 'asset_bloc.dart';

@immutable
abstract class AssetState extends Equatable {
  @override
  List<Object?> get props => [identityHashCode(this)];
}

//check if enter data filling
class AssetDataFillingSuccessState extends AssetState {}

class AssetDataFillingErrorState extends AssetState {}

class AssetInitialState extends AssetState {}

class AssetLoadingState extends AssetState {}

class AssetBackState extends AssetState {}

class AssetValidationQuantityEmptyState extends AssetState {
  final String validationMessage;

  AssetValidationQuantityEmptyState({
    required this.validationMessage,
  });
}

class AssetValidationQuantityValidState extends AssetState {}

class AssetValidationAssetTypeEmptyState extends AssetState {
  final String validationMessage;

  AssetValidationAssetTypeEmptyState({
    required this.validationMessage,
  });
}

class AssetValidationAssetTypeValidState extends AssetState {}

class GetAssetTypeListSuccessState extends AssetState {
  final List<RequestType> requestTypes;

  GetAssetTypeListSuccessState({required this.requestTypes});
}

class GetAssetTypeListErrorState extends AssetState {
  final String errorMessage;

  GetAssetTypeListErrorState({required this.errorMessage});
}

class OpenAssetTypeBottomSheetState extends AssetState {}

class SelectAssetTypeState extends AssetState {
  final RequestType requestType;

  SelectAssetTypeState({
    required this.requestType,
  });
}

class AssetSubmitSuccessState extends AssetState {
  final String successMessage;

  AssetSubmitSuccessState({
    required this.successMessage,
  });
}

class AssetSubmitErrorState extends AssetState {
  final String errorMessage;

  AssetSubmitErrorState({
    required this.errorMessage,
  });
}
