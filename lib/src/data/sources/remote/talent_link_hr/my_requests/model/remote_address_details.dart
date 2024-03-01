import 'package:json_annotation/json_annotation.dart';
import 'package:talent_link/src/domain/entities/my_requests/address_details/address_details.dart';

part 'remote_address_details.g.dart';

@JsonSerializable()
class RemoteAddressDetails {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "companyId")
  final int? companyId;
  @JsonKey(name: "employeeId")
  final int? employeeId;
  @JsonKey(name: "transactionStatusId")
  final int? statusId;
  @JsonKey(name: "transactionStatusName")
  final String? status;
  @JsonKey(name: "remarks")
  final String? remarks;
  @JsonKey(name: "addressName")
  final String? addressName;
  @JsonKey(name: "street")
  final String? street;
  @JsonKey(name: "buildingNo")
  final String? buildingNumber;
  @JsonKey(name: "floor")
  final String? floor;

  @JsonKey(name: "flat")
  final String? flat;
  @JsonKey(name: "addressDetails")
  final String? addressDetails;
  @JsonKey(name: "areaName")
  final String? areaName;

  RemoteAddressDetails(
      {required this.id,
      required this.employeeId,
      required this.remarks,
      required this.statusId,
      required this.status,
      required this.companyId,
      required this.addressDetails,
      required this.addressName,
      required this.areaName,
      required this.buildingNumber,
      required this.flat,
      required this.floor,
      required this.street});

  factory RemoteAddressDetails.fromJson(Map<String, dynamic> json) =>
      _$RemoteAddressDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteAddressDetailsToJson(this);
}

extension RemoteAddressDetailsExtension on RemoteAddressDetails {
  AddressDetails mapToDomain() {
    return AddressDetails(
        status: status ?? "",
        employeeId: employeeId ?? -1,
        id: id ?? -1,
        companyId: companyId ?? -1,
        remarks: remarks ?? "",
        addressDetails: addressDetails ?? "",
        addressName: addressName ?? "",
        areaName: areaName ?? "",
        buildingNumber: buildingNumber ?? "",
        flat: flat ?? "",
        floor: floor ?? "",
        statusId: statusId ?? -1,
        street: street ?? "");
  }
}
