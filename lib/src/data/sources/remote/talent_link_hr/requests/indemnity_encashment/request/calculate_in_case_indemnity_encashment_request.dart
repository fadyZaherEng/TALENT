import 'package:json_annotation/json_annotation.dart';

part 'calculate_in_case_indemnity_encashment_request.g.dart';

@JsonSerializable()
class CalculateInCaseIndemnityEncashmentRequest {
  @JsonKey(name: 'employeeId')
  final int employeeId;
  @JsonKey(name: 'toDate')
  final String toDate;
  @JsonKey(name: 'requestedDays')
  final int requestedDays;
  @JsonKey(name: 'startDate')
  final String startDate;

  CalculateInCaseIndemnityEncashmentRequest({
    required this.employeeId,
    required this.toDate,
    required this.requestedDays,
    required this.startDate,
  });

  factory CalculateInCaseIndemnityEncashmentRequest.fromJson(
          Map<String, dynamic> json) =>
      _$CalculateInCaseIndemnityEncashmentRequestFromJson(json);

  Map<String, dynamic> toJson() =>
      _$CalculateInCaseIndemnityEncashmentRequestToJson(this);
}
