// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_attendance_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteAttendanceHistory _$RemoteAttendanceHistoryFromJson(
        Map<String, dynamic> json) =>
    RemoteAttendanceHistory(
      timeOut: json['timeOut'] as String?,
      actualNoOfWorkingMins: json['actualNoOfWorkingMins'] as int?,
      timeIn: json['timeIn'] as String?,
      attendanceDate: json['attendanceDate'] as String?,
    );

Map<String, dynamic> _$RemoteAttendanceHistoryToJson(
        RemoteAttendanceHistory instance) =>
    <String, dynamic>{
      'attendanceDate': instance.attendanceDate,
      'timeIn': instance.timeIn,
      'timeOut': instance.timeOut,
      'actualNoOfWorkingMins': instance.actualNoOfWorkingMins,
    };
