import 'package:json_annotation/json_annotation.dart';

part 'get_employee_profile_request.g.dart';

@JsonSerializable()
class GetEmployeeProfileRequest {
  @JsonKey(name: "employeeId")
  final int? employeeId;

  const GetEmployeeProfileRequest({
    this.employeeId,
  });

  factory GetEmployeeProfileRequest.fromJson(Map<String, dynamic> json) =>
      _$GetEmployeeProfileRequestFromJson(json);

  Map<String, dynamic> toJson() => _$GetEmployeeProfileRequestToJson(this);
}
