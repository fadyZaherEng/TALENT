import 'package:json_annotation/json_annotation.dart';

part 'calculate_in_case_resume_duty_request.g.dart';

@JsonSerializable()
class CalculateInCaseResumeDutyRequest {
  @JsonKey(name: 'employeeId')
  final int employeeId;
  @JsonKey(name: 'expectedResumeDutyDate')
  final String expectedResumeDutyDate;
  @JsonKey(name: 'actualResumeDutyDate')
  final String actualResumeDutyDate;
  @JsonKey(name: 'leaveTypeId')
  final int leaveTypeId;
  @JsonKey(name: 'IsByPayroll')
  final int isByPayroll;

  CalculateInCaseResumeDutyRequest({
    required this.employeeId,
    required this.expectedResumeDutyDate,
    required this.actualResumeDutyDate,
    required this.leaveTypeId,
    required this.isByPayroll,
  });

  factory CalculateInCaseResumeDutyRequest.fromJson(Map<String, dynamic> json) =>
      _$CalculateInCaseResumeDutyRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CalculateInCaseResumeDutyRequestToJson(this);

  Map<String, dynamic> toMap() {
    return {
      "employeeId": employeeId,
      "expectedResumeDutyDate": expectedResumeDutyDate,
      "actualResumeDutyDate": actualResumeDutyDate,
      "leaveTypeId": leaveTypeId,
      "IsByPayroll": isByPayroll,
    };
  }

  factory CalculateInCaseResumeDutyRequest.fromMap(Map<String, dynamic> map) {
    return CalculateInCaseResumeDutyRequest(
      employeeId: map['employeeId'] as int,
      expectedResumeDutyDate: map['expectedResumeDutyDate'] as String,
      actualResumeDutyDate: map['actualResumeDutyDate'] as String,
      leaveTypeId: map['leaveTypeId'] as int,
      isByPayroll: map['IsByPayroll'] as int,
    );
  }
}
