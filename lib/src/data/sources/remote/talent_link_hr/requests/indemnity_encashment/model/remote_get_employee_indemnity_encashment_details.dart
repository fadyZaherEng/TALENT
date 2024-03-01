import 'package:json_annotation/json_annotation.dart';

part 'remote_get_employee_indemnity_encashment_details.g.dart';

@JsonSerializable()
class RemoteGetEmployeeIndemnityEncashmentDetails {
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'maximumDaysPerYear')
  final int? maximumDaysPerYear;

  RemoteGetEmployeeIndemnityEncashmentDetails(
      {this.name, this.id, this.maximumDaysPerYear});

  factory RemoteGetEmployeeIndemnityEncashmentDetails.fromJson(
          Map<String, dynamic> json) =>
      _$RemoteGetEmployeeIndemnityEncashmentDetailsFromJson(json);

  Map<String, dynamic> toJson() =>
      _$RemoteGetEmployeeIndemnityEncashmentDetailsToJson(this);
}

extension RemoteGetEmployeeIndemnityEncashmentDetailsListExtension
    on List<RemoteGetEmployeeIndemnityEncashmentDetails>? {
  List<RemoteGetEmployeeIndemnityEncashmentDetails>
      mapEmployeeIndemnityEncashmentDetailsToDomain() {
    return this?.map((e) => e).toList() ?? [];
  }
}
