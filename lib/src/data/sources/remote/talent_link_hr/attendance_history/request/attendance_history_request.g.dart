// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance_history_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AttendanceHistoryRequest _$AttendanceHistoryRequestFromJson(
        Map<String, dynamic> json) =>
    AttendanceHistoryRequest(
      year: json['year'] as int,
      employeeId: json['employeeId'] as int,
      month: json['month'] as int,
    );

Map<String, dynamic> _$AttendanceHistoryRequestToJson(
        AttendanceHistoryRequest instance) =>
    <String, dynamic>{
      'employeeId': instance.employeeId,
      'month': instance.month,
      'year': instance.year,
    };
