// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calculate_in_case_half_day_leave_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CalculateInCaseHalfDayLeaveRequest _$CalculateInCaseHalfDayLeaveRequestFromJson(
        Map<String, dynamic> json) =>
    CalculateInCaseHalfDayLeaveRequest(
      employeeId: json['EmployeeId'] as int,
      fromDate: json['FromDate'] as String,
      startTime: json['StartTime'] as String,
      endTime: json['EndTime'] as String,
      isByPayroll: json['IsByPayroll'] as int,
      leaveTypeId: json['LeaveTypeId'] as int,
    );

Map<String, dynamic> _$CalculateInCaseHalfDayLeaveRequestToJson(
        CalculateInCaseHalfDayLeaveRequest instance) =>
    <String, dynamic>{
      'EmployeeId': instance.employeeId,
      'FromDate': instance.fromDate,
      'LeaveTypeId': instance.leaveTypeId,
      'IsByPayroll': instance.isByPayroll,
      'StartTime': instance.startTime,
      'EndTime': instance.endTime,
    };
