// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_calculate_in_case_resume_duty.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteCalculateInCaseResumeDuty _$RemoteCalculateInCaseResumeDutyFromJson(
        Map<String, dynamic> json) =>
    RemoteCalculateInCaseResumeDuty(
      mainStatus: json['mainStatus'] as bool?,
      mainMassage: json['mainMassage'] as String?,
      salaryMonth: json['salaryMonth'] as int?,
      salaryYear: json['salaryYear'] as int?,
      employeeResumeDutyDetails:
          (json['employeeResumeDutyDetails'] as List<dynamic>?)
              ?.map((e) => RemoteCalculateInCaseResumeDutyDetails.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$RemoteCalculateInCaseResumeDutyToJson(
        RemoteCalculateInCaseResumeDuty instance) =>
    <String, dynamic>{
      'mainStatus': instance.mainStatus,
      'mainMassage': instance.mainMassage,
      'salaryMonth': instance.salaryMonth,
      'salaryYear': instance.salaryYear,
      'employeeResumeDutyDetails': instance.employeeResumeDutyDetails,
    };
