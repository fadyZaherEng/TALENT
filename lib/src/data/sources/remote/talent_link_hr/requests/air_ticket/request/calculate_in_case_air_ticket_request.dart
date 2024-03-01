import 'package:json_annotation/json_annotation.dart';

part 'calculate_in_case_air_ticket_request.g.dart';

@JsonSerializable()
class CalculateInCaseAirTicketRequest {
  @JsonKey(name: "employeeId")
  final int? employeeId;
  @JsonKey(name: "requestedDate")
  final String? requestedDate;

  const CalculateInCaseAirTicketRequest({
    this.employeeId,
    this.requestedDate,
  });

  factory CalculateInCaseAirTicketRequest.fromJson(Map<String, dynamic> json) =>
      _$CalculateInCaseAirTicketRequestFromJson(json);

  Map<String, dynamic> toJson() =>
      _$CalculateInCaseAirTicketRequestToJson(this);
}
