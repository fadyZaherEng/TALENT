import 'package:json_annotation/json_annotation.dart';

part 'my_team_attendance_statistics_request.g.dart';

@JsonSerializable()
class MyTeamAttendanceStatisticsRequest {
  @JsonKey(name: "managerEmployeeId")
  final int? managerEmployeeId;
  @JsonKey(name: "attendanceDate")
  final String? attendanceDate;
  @JsonKey(name: "filterCompanyId")
  final int? filterCompanyId;

  const MyTeamAttendanceStatisticsRequest({
    this.managerEmployeeId,
    this.attendanceDate,
    this.filterCompanyId,
  });

  factory MyTeamAttendanceStatisticsRequest.fromJson(
          Map<String, dynamic> json) =>
      _$MyTeamAttendanceStatisticsRequestFromJson(json);

  Map<String, dynamic> toJson() =>
      _$MyTeamAttendanceStatisticsRequestToJson(this);
}
