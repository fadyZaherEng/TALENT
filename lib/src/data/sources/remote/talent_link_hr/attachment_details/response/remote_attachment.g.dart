// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_attachment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteAttachment _$RemoteAttachmentFromJson(Map<String, dynamic> json) =>
    RemoteAttachment(
      id: json['id'] as int?,
      educationUpdatedRequestId: json['educationUpdatedRequestId'] as int?,
      filePath: json['filePath'] as String?,
      fileName: json['fileName'] as String?,
      fileSource: json['fileSource'],
      isDeleted: json['isDeleted'] as bool?,
    );

Map<String, dynamic> _$RemoteAttachmentToJson(RemoteAttachment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'educationUpdatedRequestId': instance.educationUpdatedRequestId,
      'filePath': instance.filePath,
      'fileName': instance.fileName,
      'fileSource': instance.fileSource,
      'isDeleted': instance.isDeleted,
    };
