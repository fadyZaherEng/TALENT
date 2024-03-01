// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_last_attendance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteLastAttendance _$RemoteLastAttendanceFromJson(
        Map<String, dynamic> json) =>
    RemoteLastAttendance(
      attendanceDate: json['attendanceDate'] as String?,
      checkInTime: json['checkInTime'] as String?,
      checkOutTime: json['checkOutTime'] as String?,
      status: json['status'] as String?,
      statusId: json['statusId'] as int?,
    );

Map<String, dynamic> _$RemoteLastAttendanceToJson(
        RemoteLastAttendance instance) =>
    <String, dynamic>{
      'attendanceDate': instance.attendanceDate,
      'checkInTime': instance.checkInTime,
      'checkOutTime': instance.checkOutTime,
      'status': instance.status,
      'statusId': instance.statusId,
    };
