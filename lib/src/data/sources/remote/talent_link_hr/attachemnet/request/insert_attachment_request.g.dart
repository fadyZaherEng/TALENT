// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'insert_attachment_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InsertAttachmentRequest _$InsertAttachmentRequestFromJson(
        Map<String, dynamic> json) =>
    InsertAttachmentRequest(
      id: json['id'] as int,
      companyId: json['companyId'] as int,
      employeeId: json['employeeId'] as int,
      transactionStatusId: json['transactionStatusId'] as int,
      transactionStatusName: json['transactionStatusName'] as String,
      transactionStatusCode: json['transactionStatusCode'] as String,
      remarks: json['remarks'] as String,
      workFlowId: json['workFlowId'] as int,
      workFlowName: json['workFlowName'] as String,
      isEnabled: json['isEnabled'] as bool,
      issueDate: json['issueDate'] as String,
      expiryDate: json['expiryDate'] as String,
      documentNo: json['documentNo'] as String,
      documentFilePath: json['documentFilePath'] as String,
      documentFileName: json['documentFileName'] as String,
      fileSource: json['fileSource'] as String,
      attachmentTypeId: json['attachmentTypeId'] as int,
      isDeleted: json['isDeleted'] as bool,
      attachmentTypeName: json['attachmentTypeName'] as String,
    );

Map<String, dynamic> _$InsertAttachmentRequestToJson(
        InsertAttachmentRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'companyId': instance.companyId,
      'employeeId': instance.employeeId,
      'transactionStatusId': instance.transactionStatusId,
      'transactionStatusName': instance.transactionStatusName,
      'transactionStatusCode': instance.transactionStatusCode,
      'remarks': instance.remarks,
      'workFlowId': instance.workFlowId,
      'workFlowName': instance.workFlowName,
      'isEnabled': instance.isEnabled,
      'issueDate': instance.issueDate,
      'expiryDate': instance.expiryDate,
      'documentNo': instance.documentNo,
      'documentFilePath': instance.documentFilePath,
      'documentFileName': instance.documentFileName,
      'fileSource': instance.fileSource,
      'attachmentTypeId': instance.attachmentTypeId,
      'isDeleted': instance.isDeleted,
      'attachmentTypeName': instance.attachmentTypeName,
    };
