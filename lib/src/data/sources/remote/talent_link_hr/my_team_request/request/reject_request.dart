import 'package:json_annotation/json_annotation.dart';

part 'reject_request.g.dart';

@JsonSerializable()
class RejectRequest {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "requestTypeId")
  final int? requestTypeId;
  @JsonKey(name: "employeeId")
  final int? employeeId;
  @JsonKey(name: "remarks")
  final String? remarks;

  RejectRequest({this.id, this.requestTypeId, this.employeeId, this.remarks});

  factory RejectRequest.fromJson(Map<String, dynamic> json) =>
      _$RejectRequestFromJson(json);

  Map<String, dynamic> toJson() => _$RejectRequestToJson(this);
}
