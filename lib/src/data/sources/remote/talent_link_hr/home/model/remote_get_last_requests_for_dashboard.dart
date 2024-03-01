import 'package:json_annotation/json_annotation.dart';

import 'package:talent_link/src/data/sources/remote/talent_link_hr/home/model/remote_last_attendance.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/home/model/remote_last_requests.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/home/model/remote_last_vacation.dart';
import 'package:talent_link/src/domain/entities/home/last_update_request.dart';

part 'remote_get_last_requests_for_dashboard.g.dart';

@JsonSerializable()
class RemoteGetLastRequestsForDashBoard {
  @JsonKey(name: 'lastAttendance')
  final RemoteLastAttendance? lastAttendance;
  @JsonKey(name: 'lastRequests')
  final List<RemoteLastRequests>? lastRequests;
  @JsonKey(name: 'lastVacation')
  final List<RemoteLastVacation>? lastVacation;

  RemoteGetLastRequestsForDashBoard({
    this.lastAttendance,
    this.lastRequests,
    this.lastVacation,
  });

  factory RemoteGetLastRequestsForDashBoard.fromJson(
          Map<String, dynamic> json) =>
      _$RemoteGetLastRequestsForDashBoardFromJson(json);

  Map<String, dynamic> toJson() =>
      _$RemoteGetLastRequestsForDashBoardToJson(this);
}

extension RemoteGetLastRequestsForDashBoardExtension
    on RemoteGetLastRequestsForDashBoard {
  LastUpdateRequests mapToDomain() {
    return LastUpdateRequests(
        lastAttendance: lastAttendance?.mapToDomain() ?? RemoteLastAttendance().mapToDomain(),
        lastRequests: lastRequests.mapLastRequestsListToDomain(),
        lastVacation: lastVacation.mapLastVacationListToDomain());
  }
}
