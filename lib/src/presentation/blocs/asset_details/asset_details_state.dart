part of 'asset_details_bloc.dart';

@immutable
abstract class AssetDetailsState {}

class AssetDetailsInitial extends AssetDetailsState {}

class ShowAssetDetailsSkeletonState extends AssetDetailsState {}

class SuccessGetAssetDetailsDataState extends AssetDetailsState {
  final AssetDetails assetDetails;

  SuccessGetAssetDetailsDataState({required this.assetDetails});
}

class AssetDetailsErrorState extends AssetDetailsState {
  final String errorMSG;

  AssetDetailsErrorState({
    required this.errorMSG,
  });
}

class AssetDetailsErrorDataState extends AssetDetailsState {
  final String errorMSG;

  AssetDetailsErrorDataState({
    required this.errorMSG,
  });
}

class AssetDetailsApproveSuccessState extends AssetDetailsState {
  final DataSuccess dataSuccess;

  AssetDetailsApproveSuccessState(this.dataSuccess);
}

class AssetDetailsRejectSuccessState extends AssetDetailsState {
  final DataSuccess dataSuccess;

  AssetDetailsRejectSuccessState(this.dataSuccess);
}

class AssetDetailsHideLoadingState extends AssetDetailsState {}

class AssetDetailsShowLoadingState extends AssetDetailsState {}
