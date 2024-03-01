// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_qualifaction_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QualificationType _$QualificationTypeFromJson(Map<String, dynamic> json) =>
    QualificationType(
      id: json['id'] as int?,
      name: json['name'] as String?,
      code: json['code'] as String?,
      subscriberId: json['subscriberId'] as int?,
      remark: json['remark'] as String?,
      qualificationTypeTranslate: json['qualificationTypeTranslate'],
      createdAt: json['createdAt'] as String?,
      createdBy: json['createdBy'] as int?,
      modifiedAt: json['modifiedAt'] as String?,
      modifiedBy: json['modifiedBy'] as int?,
      isDeleted: json['isDeleted'] as bool?,
      isEnabled: json['isEnabled'] as bool?,
    );

Map<String, dynamic> _$QualificationTypeToJson(QualificationType instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'subscriberId': instance.subscriberId,
      'remark': instance.remark,
      'qualificationTypeTranslate': instance.qualificationTypeTranslate,
      'createdAt': instance.createdAt,
      'createdBy': instance.createdBy,
      'modifiedAt': instance.modifiedAt,
      'modifiedBy': instance.modifiedBy,
      'isDeleted': instance.isDeleted,
      'isEnabled': instance.isEnabled,
    };
