// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_calculate_in_case_half_day_leave.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteCalculateInCaseHalfDayLeave _$RemoteCalculateInCaseHalfDayLeaveFromJson(
        Map<String, dynamic> json) =>
    RemoteCalculateInCaseHalfDayLeave(
      mainMassage: json['mainMassage'] as String?,
      mainStatus: json['mainStatus'] as bool?,
      employeeLeaveBalanceResponse: json['employeeLeaveBalanceResponce'] == null
          ? null
          : RemoteEmployeeLeaveBalanceResponse.fromJson(
              json['employeeLeaveBalanceResponce'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RemoteCalculateInCaseHalfDayLeaveToJson(
        RemoteCalculateInCaseHalfDayLeave instance) =>
    <String, dynamic>{
      'mainStatus': instance.mainStatus,
      'mainMassage': instance.mainMassage,
      'employeeLeaveBalanceResponce': instance.employeeLeaveBalanceResponse,
    };
