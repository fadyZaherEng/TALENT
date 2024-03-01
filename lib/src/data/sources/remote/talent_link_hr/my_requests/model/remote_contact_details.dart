import 'package:json_annotation/json_annotation.dart';
import 'package:talent_link/src/domain/entities/my_requests/contact_details/contact_details.dart';

part 'remote_contact_details.g.dart';

@JsonSerializable()
class RemoteContactDetails {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "companyId")
  final int? companyId;
  @JsonKey(name: "employeeId")
  final int? employeeId;
  @JsonKey(name: "contactName")
  final String? contactName;
  @JsonKey(name: "contactNo")
  final String? contactNumber;
  @JsonKey(name: "transactionStatusName")
  final String? status;
  @JsonKey(name: "transactionStatusId")
  final int? statusId;
  @JsonKey(name: "remarks")
  final String? remarks;

  RemoteContactDetails(
      {this.status,
      this.id,
      this.employeeId,
      this.companyId,
      this.contactName,
      this.contactNumber,
      this.statusId,
      this.remarks});

  factory RemoteContactDetails.fromJson(Map<String, dynamic> json) =>
      _$RemoteContactDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteContactDetailsToJson(this);
}

extension RemoteContactDetailsExtension on RemoteContactDetails {
  ContactDetails mapToDomain() {
    return ContactDetails(
        contactName: contactName ?? "",
        contactNumber: contactNumber ?? "",
        companyId: companyId ?? -1,
        employeeId: employeeId ?? -1,
        id: id ?? -1,
        status: status ?? "",
        statusId: statusId ?? -1,
        remarks: remarks ?? "");
  }
}
