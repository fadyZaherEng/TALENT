// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'insert_other_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InsertOtherRequest _$InsertOtherRequestFromJson(Map<String, dynamic> json) =>
    InsertOtherRequest(
      employeeId: json['employeeId'] as int,
      id: json['id'] as int,
      companyId: json['companyId'] as int,
      remarks: json['remarks'] as String,
      transactionStatusId: json['transactionStatusId'] as int,
      workFlowId: json['workFlowId'] as int,
      requestedDate: json['requestedDate'] as String,
      otherRequestId: json['otherRequestId'] as int,
      requestNote: json['requestNote'] as String,
    );

Map<String, dynamic> _$InsertOtherRequestToJson(InsertOtherRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'companyId': instance.companyId,
      'employeeId': instance.employeeId,
      'otherRequestId': instance.otherRequestId,
      'requestedDate': instance.requestedDate,
      'requestNote': instance.requestNote,
      'transactionStatusId': instance.transactionStatusId,
      'remarks': instance.remarks,
      'workFlowId': instance.workFlowId,
    };
