import 'package:json_annotation/json_annotation.dart';

part 'calculate_in_case_half_day_leave_request.g.dart';

@JsonSerializable()
class CalculateInCaseHalfDayLeaveRequest {
  @JsonKey(name: 'EmployeeId')
  final int employeeId;
  @JsonKey(name: 'FromDate')
  final String fromDate;
  @JsonKey(name: 'LeaveTypeId')
  final int leaveTypeId;
  @JsonKey(name: 'IsByPayroll')
  final int isByPayroll;
  @JsonKey(name: 'StartTime')
  final String startTime;
  @JsonKey(name: 'EndTime')
  final String endTime;

  CalculateInCaseHalfDayLeaveRequest({
    required this.employeeId,
    required this.fromDate,
    required this.startTime,
    required this.endTime,
    required this.isByPayroll,
    required this.leaveTypeId,
  });

  factory CalculateInCaseHalfDayLeaveRequest.fromJson(
          Map<String, dynamic> json) =>
      _$CalculateInCaseHalfDayLeaveRequestFromJson(json);

  Map<String, dynamic> toJson() =>
      _$CalculateInCaseHalfDayLeaveRequestToJson(this);
}
