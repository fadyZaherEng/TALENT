
import 'package:json_annotation/json_annotation.dart';

part 'approve_request.g.dart';

@JsonSerializable()
class ApproveRequest {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "requestTypeId")
  final int? requestTypeId;
  @JsonKey(name: "employeeId")
  final int? employeeId;
  @JsonKey(name: "remarks")
  final String? remarks;

  ApproveRequest({this.id, this.requestTypeId, this.employeeId, this.remarks});

  factory ApproveRequest.fromJson(Map<String, dynamic> json) =>
      _$ApproveRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ApproveRequestToJson(this);
}
