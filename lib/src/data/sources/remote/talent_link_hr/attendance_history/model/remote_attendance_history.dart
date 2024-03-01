import 'package:json_annotation/json_annotation.dart';

import 'package:talent_link/src/domain/entities/attendance_history/attendance_history.dart';

part 'remote_attendance_history.g.dart';

@JsonSerializable()
class RemoteAttendanceHistory {
  @JsonKey(name: 'attendanceDate')
  final String? attendanceDate;
  @JsonKey(name: 'timeIn')
  final String? timeIn;
  @JsonKey(name: 'timeOut')
  final String? timeOut;
  @JsonKey(name: 'actualNoOfWorkingMins')
  final int? actualNoOfWorkingMins;

  RemoteAttendanceHistory(
      {this.timeOut,
      this.actualNoOfWorkingMins,
      this.timeIn,
      this.attendanceDate});

  factory RemoteAttendanceHistory.fromJson(Map<String, dynamic> json) =>
      _$RemoteAttendanceHistoryFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteAttendanceHistoryToJson(this);
}

extension RemoteAttendanceHistoryExtension on RemoteAttendanceHistory {
  AttendanceHistory mapToDomain() {
    return AttendanceHistory(
        attendanceDate: attendanceDate,
        timeIn: timeIn,
        actualNoOfWorkingMins: actualNoOfWorkingMins,
        timeOut: timeOut);
  }
}

extension RemoteAttendanceHistoryListExtension
    on List<RemoteAttendanceHistory>? {
  List<AttendanceHistory> mapAttendanceHistoryToDomain() {
    return this?.map((e) => e.mapToDomain()).toList() ?? [];
  }
}
