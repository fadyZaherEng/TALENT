// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_get_education_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteGetEducationDetails _$RemoteGetEducationDetailsFromJson(
        Map<String, dynamic> json) =>
    RemoteGetEducationDetails(
      id: json['id'] as int?,
      companyId: json['companyId'] as int?,
      employeeId: json['employeeId'] as int?,
      documentFilePath: json['documentFilePath'] as String?,
      documentFileName: json['documentFileName'] as String?,
      qualificationTypeId: json['qualificationTypeId'] as int?,
      qualificationType: json['qualificationType'] == null
          ? null
          : QualificationType.fromJson(
              json['qualificationType'] as Map<String, dynamic>),
      qualificationTypeName: json['qualificationTypeName'] as String?,
      countryName: json['countryName'] as String?,
      qualificationPlaceName: json['qualificationPlaceName'] as String?,
      issueDate: json['issueDate'] as String?,
      expiryDate: json['expiryDate'] as String?,
      qualificationFilePath: json['qualificationFilePath'] as String?,
      educationUpdatedRequestAttachments:
          (json['educationUpdatedRequestAttachments'] as List<dynamic>?)
              ?.map((e) => RemoteAttachment.fromJson(e as Map<String, dynamic>))
              .toList(),
      educationUpdatedRequestWF:
          (json['educationUpdatedRequestWF'] as List<dynamic>?)
              ?.map((e) =>
                  EducationUpdatedRequestWF.fromJson(e as Map<String, dynamic>))
              .toList(),
      transactionStatusId: json['transactionStatusId'] as int?,
      transactionStatusName: json['transactionStatusName'] as String?,
      transactionStatusCode: json['transactionStatusCode'] as String?,
      remarks: json['remarks'] as String?,
      workFlowId: json['workFlowId'] as int?,
      workFlowName: json['workFlowName'] as String?,
      isEnabled: json['isEnabled'] as bool?,
      isDeleted: json['isDeleted'] as bool?,
      attachmentUpdateRequestAttachments:
          json['attachmentUpdateRequestAttachments'],
      attachmentUpdateRequestWF: json['attachmentUpdateRequestWF'],
    );

Map<String, dynamic> _$RemoteGetEducationDetailsToJson(
        RemoteGetEducationDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'companyId': instance.companyId,
      'employeeId': instance.employeeId,
      'documentFilePath': instance.documentFilePath,
      'documentFileName': instance.documentFileName,
      'qualificationTypeId': instance.qualificationTypeId,
      'qualificationType': instance.qualificationType,
      'qualificationTypeName': instance.qualificationTypeName,
      'countryName': instance.countryName,
      'qualificationPlaceName': instance.qualificationPlaceName,
      'issueDate': instance.issueDate,
      'expiryDate': instance.expiryDate,
      'qualificationFilePath': instance.qualificationFilePath,
      'educationUpdatedRequestAttachments':
          instance.educationUpdatedRequestAttachments,
      'educationUpdatedRequestWF': instance.educationUpdatedRequestWF,
      'transactionStatusId': instance.transactionStatusId,
      'transactionStatusName': instance.transactionStatusName,
      'transactionStatusCode': instance.transactionStatusCode,
      'remarks': instance.remarks,
      'workFlowId': instance.workFlowId,
      'workFlowName': instance.workFlowName,
      'isEnabled': instance.isEnabled,
      'isDeleted': instance.isDeleted,
      'attachmentUpdateRequestAttachments':
          instance.attachmentUpdateRequestAttachments,
      'attachmentUpdateRequestWF': instance.attachmentUpdateRequestWF,
    };
