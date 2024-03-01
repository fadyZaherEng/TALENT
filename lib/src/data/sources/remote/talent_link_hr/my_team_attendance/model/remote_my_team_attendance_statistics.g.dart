// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_my_team_attendance_statistics.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteMyTeamAttendanceStatistics _$RemoteMyTeamAttendanceStatisticsFromJson(
        Map<String, dynamic> json) =>
    RemoteMyTeamAttendanceStatistics(
      noOfEmployeesTotal: json['noOfEmployeesTotal'] as int?,
      noOfEmployeesPresent: json['noOfEmployeesPresent'] as int?,
      noOfEmployeesLeave: json['noOfEmployeesLeave'] as int?,
    );

Map<String, dynamic> _$RemoteMyTeamAttendanceStatisticsToJson(
        RemoteMyTeamAttendanceStatistics instance) =>
    <String, dynamic>{
      'noOfEmployeesTotal': instance.noOfEmployeesTotal,
      'noOfEmployeesPresent': instance.noOfEmployeesPresent,
      'noOfEmployeesLeave': instance.noOfEmployeesLeave,
    };
