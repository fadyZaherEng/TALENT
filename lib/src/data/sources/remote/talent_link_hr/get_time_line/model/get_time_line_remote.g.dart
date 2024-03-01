// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_time_line_remote.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetTimeLineRemote _$GetTimeLineRemoteFromJson(Map<String, dynamic> json) =>
    GetTimeLineRemote(
      id: json['id'] as int?,
      wfLevelId: json['wfLevelId'] as int?,
      companyId: json['companyId'] as int?,
      levelNo: json['levelNo'] as int?,
      levelName: json['levelName'] as String?,
      actionUserId: json['actionUserId'] as int?,
      actionUserName: json['actionUserName'] as String?,
      workflowStatusId: json['workflowStatusId'] as int?,
      workflowStatusName: json['workflowStatusName'] as String?,
      remarks: json['remarks'] as String?,
      createdAt: json['createdAt'] as String?,
      attachments: json['attachments'] as String?,
      date: json['date'] as String?,
      time: json['time'] as String?,
      lastAction: json['lastAction'] as bool?,
      levelType: json['levelType'] as int?,
      levelTypeId: json['levelTypeId'] as int?,
      usersName: (json['usersName'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$GetTimeLineRemoteToJson(GetTimeLineRemote instance) =>
    <String, dynamic>{
      'id': instance.id,
      'wfLevelId': instance.wfLevelId,
      'companyId': instance.companyId,
      'levelNo': instance.levelNo,
      'levelName': instance.levelName,
      'actionUserId': instance.actionUserId,
      'actionUserName': instance.actionUserName,
      'workflowStatusId': instance.workflowStatusId,
      'workflowStatusName': instance.workflowStatusName,
      'remarks': instance.remarks,
      'createdAt': instance.createdAt,
      'attachments': instance.attachments,
      'date': instance.date,
      'time': instance.time,
      'lastAction': instance.lastAction,
      'levelType': instance.levelType,
      'levelTypeId': instance.levelTypeId,
      'usersName': instance.usersName,
    };
