import 'package:json_annotation/json_annotation.dart';
import 'package:talent_link/src/domain/entities/my_requests/asset_details/asset_details.dart';

part 'remote_asset_details.g.dart';

@JsonSerializable()
class RemoteAssetDetails {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "companyId")
  final int? companyId;
  @JsonKey(name: "employeeId")
  final int? employeeId;
  @JsonKey(name: "quantity")
  final int? quantity;
  @JsonKey(name: "assetTypeName")
  final String? assetTypeName;
  @JsonKey(name: "transactionStatusName")
  final String? status;
  @JsonKey(name: "transactionStatusId")
  final int? statusId;
  @JsonKey(name: "remarks")
  final String? remarks;

  RemoteAssetDetails(
      {this.status,
      this.id,
      this.employeeId,
      this.companyId,
      this.assetTypeName,
      this.quantity,
      this.statusId,
      this.remarks});

  factory RemoteAssetDetails.fromJson(Map<String, dynamic> json) =>
      _$RemoteAssetDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteAssetDetailsToJson(this);
}

extension RemoteAssetDetailsExtension on RemoteAssetDetails {
  AssetDetails mapToDomain() {
    return AssetDetails(
        quantity: quantity ?? 0,
        assetTypeName: assetTypeName ?? "",
        companyId: companyId ?? -1,
        employeeId: employeeId ?? -1,
        id: id ?? -1,
        status: status ?? "",
        statusId: statusId ?? -1,
        remarks: remarks ?? "");
  }
}
