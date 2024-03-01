import 'package:json_annotation/json_annotation.dart';
part'remote_qualifaction_type.g.dart';

@JsonSerializable()
class QualificationType {
  final int? id;
  final String? name;
  final String? code;
  final int? subscriberId;
  final String? remark;
  final dynamic qualificationTypeTranslate;
  final String? createdAt;
  final int? createdBy;
  final String? modifiedAt;
  final int? modifiedBy;
  final bool? isDeleted;
  final bool? isEnabled;

  QualificationType({
    this.id,
    this.name,
    this.code,
    this.subscriberId,
    this.remark,
    this.qualificationTypeTranslate,
    this.createdAt,
    this.createdBy,
    this.modifiedAt,
    this.modifiedBy,
    this.isDeleted,
    this.isEnabled,
  });

  factory QualificationType.fromJson(Map<String, dynamic> json) =>
      _$QualificationTypeFromJson(json);

  Map<String, dynamic> toJson() => _$QualificationTypeToJson(this);
}