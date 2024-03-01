import 'package:json_annotation/json_annotation.dart';

import 'package:talent_link/src/domain/entities/get_time_line/get_time_line.dart';

part 'get_time_line_remote.g.dart';

@JsonSerializable()
class GetTimeLineRemote {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "wfLevelId")
  final int? wfLevelId;
  @JsonKey(name: "companyId")
  final int? companyId;
  @JsonKey(name: "levelNo")
  final int? levelNo;
  @JsonKey(name: "levelName")
  final String? levelName;
  @JsonKey(name: "actionUserId")
  final int? actionUserId;
  @JsonKey(name: "actionUserName")
  final String? actionUserName;
  @JsonKey(name: "workflowStatusId")
  final int? workflowStatusId;
  @JsonKey(name: "workflowStatusName")
  final String? workflowStatusName;
  @JsonKey(name: "remarks")
  final String? remarks;
  @JsonKey(name: "createdAt")
  final String? createdAt;
  @JsonKey(name: "attachments")
  final String? attachments;
  @JsonKey(name: "date")
  final String? date;
  @JsonKey(name: "time")
  final String? time;
  @JsonKey(name: "lastAction")
  final bool? lastAction;
  @JsonKey(name: "levelType")
  final int? levelType;
  @JsonKey(name: "levelTypeId")
  final int? levelTypeId;
  @JsonKey(name: "usersName")
  final List<String>? usersName;

  const GetTimeLineRemote({
    this.id,
    this.wfLevelId,
    this.companyId,
    this.levelNo,
    this.levelName,
    this.actionUserId,
    this.actionUserName,
    this.workflowStatusId,
    this.workflowStatusName,
    this.remarks,
    this.createdAt,
    this.attachments,
    this.date,
    this.time,
    this.lastAction,
    this.levelType,
    this.levelTypeId,
    this.usersName,
  });

  factory GetTimeLineRemote.fromJson(Map<String, dynamic> json) =>
      _$GetTimeLineRemoteFromJson(json);

  Map<String, dynamic> toJson() => _$GetTimeLineRemoteToJson(this);
}

extension RemoteGetTimeLineExtension on GetTimeLineRemote {
  GetTimeLine mapToDomain() {
    return GetTimeLine(
        id: id ?? 0,
        wFLevelId: wfLevelId ?? 0,
        companyId: companyId ?? 0,
        levelNo: levelNo ?? 0,
        levelName: levelName ?? "",
        actionUserId: actionUserId ?? 0,
        actionUserName: actionUserName ?? "",
        workflowStatusId: workflowStatusId ?? 0,
        workflowStatusName: workflowStatusName ?? "",
        remarks: remarks ?? "",
        createdAt: createdAt ?? "",
        attachments: attachments ?? "",
        date: date ?? "",
        time: time ?? "",
        lastAction: lastAction ?? false,
        levelType: levelType ?? 0,
        levelTypeId: levelTypeId ?? 0,
        usersName: usersName ?? []);
  }
}

extension RemoteGetTimeLineListExtension on List<GetTimeLineRemote>? {
  List<GetTimeLine> mapTimeLineListToDomain() {
    return this?.map((e) => e.mapToDomain()).toList() ?? [];
  }
}
