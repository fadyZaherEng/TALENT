import 'package:json_annotation/json_annotation.dart';

import 'package:talent_link/src/domain/entities/my_team_attendance/my_team_attendance.dart';

part 'remote_my_team_attendance_history.g.dart';

@JsonSerializable()
class RemoteMyTeamAttendanceHistory {
  @JsonKey(name: "employeeName")
  final String? employeeName;
  @JsonKey(name: "employeePosition")
  final String? employeePosition;
  @JsonKey(name: "timeIn")
  final String? timeIn;
  @JsonKey(name: "timeOut")
  final String? timeOut;
  @JsonKey(name: "employeeSystemImage")
  final String? employeeSystemImage;

  const RemoteMyTeamAttendanceHistory({
    this.employeeName,
    this.employeePosition,
    this.timeIn,
    this.timeOut,
    this.employeeSystemImage,
  });

  factory RemoteMyTeamAttendanceHistory.fromJson(Map<String, dynamic> json) =>
      _$RemoteMyTeamAttendanceHistoryFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteMyTeamAttendanceHistoryToJson(this);
}

extension RemoteGetMyTeamAttendanceHistoryExtension
    on RemoteMyTeamAttendanceHistory {
  MyTeamAttendance mapToDomain() {
    return MyTeamAttendance(
        employeeName: employeeName ?? "",
        employeePosition: employeePosition ?? "",
        timeIn: timeIn ?? "",
        timeOut: timeOut ?? "",
        employeeSystemImage: employeeSystemImage ?? "");
  }
}

extension RemoteGetAttendanceHistoryListExtension
    on List<RemoteMyTeamAttendanceHistory>? {
  List<MyTeamAttendance> mapAttendanceHistoryListToDomain() {
    return this?.map((e) => e.mapToDomain()).toList() ?? [];
  }
}
