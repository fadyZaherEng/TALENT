import 'package:json_annotation/json_annotation.dart';

part 'get_dependent_air_ticket_request.g.dart';

@JsonSerializable()
class GetDependentAirTicketRequest {
  @JsonKey(name: 'employeeId')
  final int employeeId;

  GetDependentAirTicketRequest({
    this.employeeId = 2220,
  });

  factory GetDependentAirTicketRequest.fromJson(Map<String, dynamic> json) =>
      _$GetDependentAirTicketRequestFromJson(json);

  Map<String, dynamic> toJson() => _$GetDependentAirTicketRequestToJson(this);

  Map<String, dynamic> toMap() {
    return {
      "employeeId": employeeId,
    };
  }

  factory GetDependentAirTicketRequest.fromMap(Map<String, dynamic> map) {
    return GetDependentAirTicketRequest(
      employeeId: map['employeeId'] as int,
    );
  }
}
