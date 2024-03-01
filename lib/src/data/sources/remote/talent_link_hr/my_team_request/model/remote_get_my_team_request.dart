import 'package:json_annotation/json_annotation.dart';

import 'package:talent_link/src/domain/entities/get_my_team_request/get_my_team_request.dart';

part 'remote_get_my_team_request.g.dart';

@JsonSerializable()
class RemoteGetMyTeamRequest {
  @JsonKey(name: "employeeName")
  final String? employeeName;
  @JsonKey(name: "referenceId")
  final int? referenceId;
  @JsonKey(name: "referenceName")
  final String? referenceName;
  @JsonKey(name: "createdAt")
  final String? createdAt;
  @JsonKey(name: "transactionId")
  final int? transactionId;
  @JsonKey(name: "transactionStatusId")
  final int? transactionStatusId;
  @JsonKey(name: "transactionStatusName")
  final String? transactionStatusName;

  const RemoteGetMyTeamRequest(
      {this.employeeName,
      this.referenceId,
      this.referenceName,
      this.createdAt,
      this.transactionId,
      this.transactionStatusName,
      this.transactionStatusId});

  factory RemoteGetMyTeamRequest.fromJson(Map<String, dynamic> json) =>
      _$RemoteGetMyTeamRequestFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteGetMyTeamRequestToJson(this);
}

extension RemoteGetMyTeamRequestExtension on RemoteGetMyTeamRequest {
  MyTeamRequest mapToDomain() {
    return MyTeamRequest(
        employeeName: employeeName ?? "",
        referenceId: referenceId ?? 0,
        referenceName: referenceName ?? "",
        createdAt: createdAt ?? "",
        transactionId: transactionId ?? 0,
        imagePath: '',
        transactionStatusId: transactionStatusId ?? 0,
        transactionStatusName: transactionStatusName ?? "");
  }
}

extension RemoteGetMyTeamRequestListExtension on List<RemoteGetMyTeamRequest>? {
  List<MyTeamRequest> mapAttendanceHistoryListToDomain() {
    return this?.map((e) => e.mapToDomain()).toList() ?? [];
  }
}
