import 'package:json_annotation/json_annotation.dart';

part 'get_employee_indemnity_encashment_details_request.g.dart';

@JsonSerializable()
class GetEmployeeIndemnityEncashmentDetailsRequest {
  @JsonKey(name: 'employeeId')
  final int employeeId;

  GetEmployeeIndemnityEncashmentDetailsRequest({
    required this.employeeId,
  });

  factory GetEmployeeIndemnityEncashmentDetailsRequest.fromJson(
          Map<String, dynamic> json) =>
      _$GetEmployeeIndemnityEncashmentDetailsRequestFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GetEmployeeIndemnityEncashmentDetailsRequestToJson(this);

  Map<String, dynamic> toMap() {
    return {
      "employeeId": employeeId,
    };
  }

  factory GetEmployeeIndemnityEncashmentDetailsRequest.fromMap(
      Map<String, dynamic> map) {
    return GetEmployeeIndemnityEncashmentDetailsRequest(
      employeeId: map['employeeId'] as int,
    );
  }
}
