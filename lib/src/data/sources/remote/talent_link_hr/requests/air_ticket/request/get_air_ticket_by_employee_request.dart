import 'package:json_annotation/json_annotation.dart';

part 'get_air_ticket_by_employee_request.g.dart';

@JsonSerializable()
class GetAirTicketByEmployeeRequest {
  @JsonKey(name: "employeeId")
  final int? employeeId;

  const GetAirTicketByEmployeeRequest({
    this.employeeId,
  });

  factory GetAirTicketByEmployeeRequest.fromJson(Map<String, dynamic> json) =>
      _$GetAirTicketByEmployeeRequestFromJson(json);

  Map<String, dynamic> toJson() => _$GetAirTicketByEmployeeRequestToJson(this);
}
