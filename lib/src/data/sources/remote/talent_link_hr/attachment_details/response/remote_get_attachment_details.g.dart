// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_get_attachment_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteGetAttachmentDetails _$RemoteGetAttachmentDetailsFromJson(
        Map<String, dynamic> json) =>
    RemoteGetAttachmentDetails(
      id: json['id'] as int?,
      companyId: json['companyId'] as int?,
      employeeId: json['employeeId'] as int?,
      issueDate: json['issueDate'] as String?,
      expiryDate: json['expiryDate'] as String?,
      documentNo: json['documentNo'] as String?,
      documentFilePath: json['documentFilePath'] as String?,
      documentFileName: json['documentFileName'] as String?,
      attachmentTypeId: json['attachmentTypeId'] as int?,
      attachmentTypeName: json['attachmentTypeName'] as String?,
      transactionStatusId: json['transactionStatusId'] as int?,
      transactionStatusName: json['transactionStatusName'] as String?,
      transactionStatusCode: json['transactionStatusCode'] as String?,
      remarks: json['remarks'] as String?,
      workFlowId: json['workFlowId'] as int?,
      workFlowName: json['workFlowName'],
      isEnabled: json['isEnabled'] as bool?,
      isDeleted: json['isDeleted'] as bool?,
      attachmentUpdateRequestAttachments:
          (json['attachmentUpdateRequestAttachments'] as List<dynamic>?)
              ?.map((e) => RemoteAttachment.fromJson(e as Map<String, dynamic>))
              .toList(),
      attachmentUpdateRequestWF:
          (json['attachmentUpdateRequestWF'] as List<dynamic>?)
              ?.map((e) => RemoteAttachmentDetailsUpdateRequestWf.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$RemoteGetAttachmentDetailsToJson(
        RemoteGetAttachmentDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'companyId': instance.companyId,
      'employeeId': instance.employeeId,
      'issueDate': instance.issueDate,
      'expiryDate': instance.expiryDate,
      'documentNo': instance.documentNo,
      'documentFilePath': instance.documentFilePath,
      'documentFileName': instance.documentFileName,
      'attachmentTypeId': instance.attachmentTypeId,
      'attachmentTypeName': instance.attachmentTypeName,
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
