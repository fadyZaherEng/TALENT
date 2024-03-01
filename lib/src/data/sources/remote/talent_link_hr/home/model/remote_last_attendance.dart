import 'package:json_annotation/json_annotation.dart';

import 'package:talent_link/src/domain/entities/home/last_attendance.dart';

part 'remote_last_attendance.g.dart';
@JsonSerializable()
class RemoteLastAttendance {
  @JsonKey(name: 'attendanceDate')
  final String? attendanceDate;
  @JsonKey(name: 'checkInTime')
  final String? checkInTime;
  @JsonKey(name: 'checkOutTime')
  final String? checkOutTime;
  @JsonKey(name: 'status')
  final String? status;
  @JsonKey(name: 'statusId')
  final int? statusId;

  RemoteLastAttendance({
    this.attendanceDate,
    this.checkInTime,
    this.checkOutTime,
    this.status,
    this.statusId,
  });

  factory RemoteLastAttendance.fromJson(Map<String, dynamic> json) =>
      _$RemoteLastAttendanceFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteLastAttendanceToJson(this);
}

extension RemoteLastAttendanceExtension on RemoteLastAttendance {
  LastAttendance mapToDomain() {
    return LastAttendance(
        status: status??"",
        attendanceDate: attendanceDate??"",
        checkInTime: checkInTime??"",
        checkOutTime: checkOutTime??"",
        statusId: statusId??0);
  }
}
