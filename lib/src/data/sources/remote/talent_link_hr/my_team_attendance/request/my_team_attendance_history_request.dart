import 'package:json_annotation/json_annotation.dart';

part 'my_team_attendance_history_request.g.dart';

@JsonSerializable()
class MyTeamAttendanceHistoryRequest {
  @JsonKey(name: "managerEmployeeId")
  final int? managerEmployeeId;
  @JsonKey(name: "attendanceDateFrom")
  final String? attendanceDateFrom;
  @JsonKey(name: "attendanceDateTo")
  final String? attendanceDateTo;
  @JsonKey(name: "filterCompanyId")
  final int? filterCompanyId;
  @JsonKey(name: "filterEmployeeId")
  final int? filterEmployeeId;

  const MyTeamAttendanceHistoryRequest({
    this.managerEmployeeId,
    this.attendanceDateFrom,
    this.attendanceDateTo,
    this.filterCompanyId,
    this.filterEmployeeId,
  });

  factory MyTeamAttendanceHistoryRequest.fromJson(Map<String, dynamic> json) =>
      _$MyTeamAttendanceHistoryRequestFromJson(json);

  Map<String, dynamic> toJson() => _$MyTeamAttendanceHistoryRequestToJson(this);
}
