import 'package:json_annotation/json_annotation.dart';

import 'package:talent_link/src/domain/entities/my_team_attendance/my_team_attendance_statistics.dart';

part 'remote_my_team_attendance_statistics.g.dart';

@JsonSerializable()
class RemoteMyTeamAttendanceStatistics {
  @JsonKey(name: "noOfEmployeesTotal")
  final int? noOfEmployeesTotal;
  @JsonKey(name: "noOfEmployeesPresent")
  final int? noOfEmployeesPresent;
  @JsonKey(name: "noOfEmployeesLeave")
  final int? noOfEmployeesLeave;

  const RemoteMyTeamAttendanceStatistics({
    this.noOfEmployeesTotal,
    this.noOfEmployeesPresent,
    this.noOfEmployeesLeave,
  });

  factory RemoteMyTeamAttendanceStatistics.fromJson(
          Map<String, dynamic> json) =>
      _$RemoteMyTeamAttendanceStatisticsFromJson(json);

  Map<String, dynamic> toJson() =>
      _$RemoteMyTeamAttendanceStatisticsToJson(this);
}

extension RemoteGetMyTeamAttendanceHistoryExtension
    on RemoteMyTeamAttendanceStatistics {
  MyTeamAttendanceStatistics toMap() {
    return MyTeamAttendanceStatistics(
        noOfEmployeesTotal: noOfEmployeesTotal ?? 0,
        noOfEmployeesPresent: noOfEmployeesPresent ?? 0,
        noOfEmployeesLeave: noOfEmployeesLeave ?? 0);
  }
}
