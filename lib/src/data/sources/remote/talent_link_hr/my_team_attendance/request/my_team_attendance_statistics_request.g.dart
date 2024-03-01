// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_team_attendance_statistics_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyTeamAttendanceStatisticsRequest _$MyTeamAttendanceStatisticsRequestFromJson(
        Map<String, dynamic> json) =>
    MyTeamAttendanceStatisticsRequest(
      managerEmployeeId: json['managerEmployeeId'] as int?,
      attendanceDate: json['attendanceDate'] as String?,
      filterCompanyId: json['filterCompanyId'] as int?,
    );

Map<String, dynamic> _$MyTeamAttendanceStatisticsRequestToJson(
        MyTeamAttendanceStatisticsRequest instance) =>
    <String, dynamic>{
      'managerEmployeeId': instance.managerEmployeeId,
      'attendanceDate': instance.attendanceDate,
      'filterCompanyId': instance.filterCompanyId,
    };
