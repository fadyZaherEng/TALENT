// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_education_updated_wf.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EducationUpdatedRequestWF _$EducationUpdatedRequestWFFromJson(
        Map<String, dynamic> json) =>
    EducationUpdatedRequestWF(
      id: json['id'] as int?,
      educationUpdatedRequestId: json['educationUpdatedRequestId'] as int?,
      levelNo: json['levelNo'] as int?,
      actionUserId: json['actionUserId'] as int?,
      actionUserName: json['actionUserName'],
      wfStatusId: json['wfStatusId'] as int?,
      wfStatusName: json['wfStatusName'],
      remarks: json['remarks'],
      actionDate: json['actionDate'] as String?,
      actionSource: json['actionSource'],
      isDeleted: json['isDeleted'] as bool?,
      educationUpdatedRequestWFAttachment:
          (json['educationUpdatedRequestWFAttachment'] as List<dynamic>?)
              ?.map((e) => RemoteAttachment.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$EducationUpdatedRequestWFToJson(
        EducationUpdatedRequestWF instance) =>
    <String, dynamic>{
      'id': instance.id,
      'educationUpdatedRequestId': instance.educationUpdatedRequestId,
      'levelNo': instance.levelNo,
      'actionUserId': instance.actionUserId,
      'actionUserName': instance.actionUserName,
      'wfStatusId': instance.wfStatusId,
      'wfStatusName': instance.wfStatusName,
      'remarks': instance.remarks,
      'actionDate': instance.actionDate,
      'actionSource': instance.actionSource,
      'isDeleted': instance.isDeleted,
      'educationUpdatedRequestWFAttachment':
          instance.educationUpdatedRequestWFAttachment,
    };
