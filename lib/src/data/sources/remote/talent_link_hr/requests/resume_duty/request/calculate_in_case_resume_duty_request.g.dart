// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calculate_in_case_resume_duty_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CalculateInCaseResumeDutyRequest _$CalculateInCaseResumeDutyRequestFromJson(
        Map<String, dynamic> json) =>
    CalculateInCaseResumeDutyRequest(
      employeeId: json['employeeId'] as int,
      expectedResumeDutyDate: json['expectedResumeDutyDate'] as String,
      actualResumeDutyDate: json['actualResumeDutyDate'] as String,
      leaveTypeId: json['leaveTypeId'] as int,
      isByPayroll: json['IsByPayroll'] as int,
    );

Map<String, dynamic> _$CalculateInCaseResumeDutyRequestToJson(
        CalculateInCaseResumeDutyRequest instance) =>
    <String, dynamic>{
      'employeeId': instance.employeeId,
      'expectedResumeDutyDate': instance.expectedResumeDutyDate,
      'actualResumeDutyDate': instance.actualResumeDutyDate,
      'leaveTypeId': instance.leaveTypeId,
      'IsByPayroll': instance.isByPayroll,
    };
