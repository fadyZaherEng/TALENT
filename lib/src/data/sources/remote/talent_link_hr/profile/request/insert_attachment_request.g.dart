// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'insert_attachment_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InsertAttachmentRequest _$InsertAttachmentRequestFromJson(
        Map<String, dynamic> json) =>
    InsertAttachmentRequest(
      companyId: json['companyId'] as int?,
      employeeId: json['employeeId'] as int?,
      attachmentTypeId: json['attachmentTypeId'] as int?,
    );

Map<String, dynamic> _$InsertAttachmentRequestToJson(
        InsertAttachmentRequest instance) =>
    <String, dynamic>{
      'companyId': instance.companyId,
      'employeeId': instance.employeeId,
      'attachmentTypeId': instance.attachmentTypeId,
    };
