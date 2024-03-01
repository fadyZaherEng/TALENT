// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_my_team_attendance_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteMyTeamAttendanceHistory _$RemoteMyTeamAttendanceHistoryFromJson(
        Map<String, dynamic> json) =>
    RemoteMyTeamAttendanceHistory(
      employeeName: json['employeeName'] as String?,
      employeePosition: json['employeePosition'] as String?,
      timeIn: json['timeIn'] as String?,
      timeOut: json['timeOut'] as String?,
      employeeSystemImage: json['employeeSystemImage'] as String?,
    );

Map<String, dynamic> _$RemoteMyTeamAttendanceHistoryToJson(
        RemoteMyTeamAttendanceHistory instance) =>
    <String, dynamic>{
      'employeeName': instance.employeeName,
      'employeePosition': instance.employeePosition,
      'timeIn': instance.timeIn,
      'timeOut': instance.timeOut,
      'employeeSystemImage': instance.employeeSystemImage,
    };
