// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_attachment_details_update_request_wf.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteAttachmentDetailsUpdateRequestWf
    _$RemoteAttachmentDetailsUpdateRequestWfFromJson(
            Map<String, dynamic> json) =>
        RemoteAttachmentDetailsUpdateRequestWf(
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
          educationUpdatedRequestWFAttachment: (json[
                  'educationUpdatedRequestWFAttachment'] as List<dynamic>?)
              ?.map((e) => RemoteAttachment.fromJson(e as Map<String, dynamic>))
              .toList(),
        );

Map<String, dynamic> _$RemoteAttachmentDetailsUpdateRequestWfToJson(
        RemoteAttachmentDetailsUpdateRequestWf instance) =>
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
