// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_team_attendance_history_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyTeamAttendanceHistoryRequest _$MyTeamAttendanceHistoryRequestFromJson(
        Map<String, dynamic> json) =>
    MyTeamAttendanceHistoryRequest(
      managerEmployeeId: json['managerEmployeeId'] as int?,
      attendanceDateFrom: json['attendanceDateFrom'] as String?,
      attendanceDateTo: json['attendanceDateTo'] as String?,
      filterCompanyId: json['filterCompanyId'] as int?,
      filterEmployeeId: json['filterEmployeeId'] as int?,
    );

Map<String, dynamic> _$MyTeamAttendanceHistoryRequestToJson(
        MyTeamAttendanceHistoryRequest instance) =>
    <String, dynamic>{
      'managerEmployeeId': instance.managerEmployeeId,
      'attendanceDateFrom': instance.attendanceDateFrom,
      'attendanceDateTo': instance.attendanceDateTo,
      'filterCompanyId': instance.filterCompanyId,
      'filterEmployeeId': instance.filterEmployeeId,
    };
