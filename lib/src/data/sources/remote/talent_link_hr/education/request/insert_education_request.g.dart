// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'insert_education_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InsertEducationRequest _$InsertEducationRequestFromJson(
        Map<String, dynamic> json) =>
    InsertEducationRequest(
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
      issueDate: json['IssueDate'] as String,
      expiryDate: json['ExpiryDate'] as String,
      qualificationPlaceName: json['QualificationPlaceName'] as String,
      documentFilePath: json['documentFilePath'] as String,
      documentFileName: json['documentFileName'] as String,
      fileSource: json['fileSource'] as String,
      qualificationTypeId: json['QualificationTypeId'] as int,
      isDeleted: json['isDeleted'] as bool,
      qualificationTypeName: json['QualificationTypeName'] as String,
      qualificationFilePath: json['QualificationFilePath'] as String,
      countryId: json['CountryId'] as int,
      countryName: json['CountryName'] as String,
    );

Map<String, dynamic> _$InsertEducationRequestToJson(
        InsertEducationRequest instance) =>
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
      'IssueDate': instance.issueDate,
      'ExpiryDate': instance.expiryDate,
      'QualificationPlaceName': instance.qualificationPlaceName,
      'documentFilePath': instance.documentFilePath,
      'documentFileName': instance.documentFileName,
      'fileSource': instance.fileSource,
      'QualificationTypeId': instance.qualificationTypeId,
      'isDeleted': instance.isDeleted,
      'QualificationTypeName': instance.qualificationTypeName,
      'QualificationFilePath': instance.qualificationFilePath,
      'CountryId': instance.countryId,
      'CountryName': instance.countryName,
    };
