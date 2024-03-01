// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'insert_contact_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InsertContactRequest _$InsertContactRequestFromJson(
        Map<String, dynamic> json) =>
    InsertContactRequest(
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
      contactName: json['contactName'] as String,
      contactTypeId: json['contactTypeId'] as String,
      contactNo: json['contactNo'] as String,
      isDeleted: json['isDeleted'] as bool,
    );

Map<String, dynamic> _$InsertContactRequestToJson(
        InsertContactRequest instance) =>
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
      'contactName': instance.contactName,
      'contactTypeId': instance.contactTypeId,
      'contactNo': instance.contactNo,
      'isDeleted': instance.isDeleted,
    };
