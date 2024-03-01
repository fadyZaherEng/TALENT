part of 'asset_details_bloc.dart';

@immutable
abstract class AssetDetailsEvent {}

class GetAssetDetailsEvent extends AssetDetailsEvent {
  final int transactionId;

  GetAssetDetailsEvent({required this.transactionId});
}

class AssetApproveRequestEvent extends AssetDetailsEvent {
  final int? transactionId;
  final int? employeeId;
  final referenceId;

  AssetApproveRequestEvent(
      {required this.transactionId,
      required this.employeeId,
      required this.referenceId});
}

class AssetRejectRequestEvent extends AssetDetailsEvent {
  final int? transactionId;
  final int? employeeId;
  final referenceId;

  AssetRejectRequestEvent(
      {required this.transactionId,
        required this.employeeId,
        required this.referenceId});
}
