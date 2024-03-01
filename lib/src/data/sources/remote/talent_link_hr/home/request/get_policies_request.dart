import 'package:json_annotation/json_annotation.dart';

part 'get_policies_request.g.dart';

@JsonSerializable()
class GetPoliciesRequest {
  @JsonKey(name: "employeeId")
  final int employeeId;

  GetPoliciesRequest({required this.employeeId});

  factory GetPoliciesRequest.fromJson(Map<String, dynamic> json) =>
      _$GetPoliciesRequestFromJson(json);

  Map<String, dynamic> toJson() => _$GetPoliciesRequestToJson(this);
}
