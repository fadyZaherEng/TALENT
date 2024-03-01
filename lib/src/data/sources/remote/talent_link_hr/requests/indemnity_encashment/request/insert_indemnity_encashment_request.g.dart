// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'insert_indemnity_encashment_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InsertIndemnityEncashmentRequest _$InsertIndemnityEncashmentRequestFromJson(
        Map<String, dynamic> json) =>
    InsertIndemnityEncashmentRequest(
      employeeId: json['employeeId'] as int,
      id: json['id'] as int,
      companyId: json['companyId'] as int,
      isByPayroll: json['isByPayroll'] as int,
      paymentMethodId: json['paymentMethodId'] as int,
      remarks: json['remarks'] as String,
      totalAmount: json['totalAmount'] as int,
      basicSalaryAmount: json['basicSalaryAmount'] as int,
      allowancesAmount: json['allowancesAmount'] as int,
      transactionStatusId: json['transactionStatusId'] as int,
      requestedDays: json['requestedDays'] as int,
      requestedDate: json['requestedDate'] as String,
      salaryYear: json['salaryYear'] as int,
      salaryMonth: json['salaryMonth'] as int,
      indemnityAmount: json['indemnityAmount'] as int,
      indemnityDays: json['indemnityDays'] as int,
      indemnityEncashmentId: json['indemnityEncashmentId'] as int,
      indemnityServiceDays: json['indemnityServiceDays'] as int,
      workFlowId: json['workFlowId'] as int,
    );

Map<String, dynamic> _$InsertIndemnityEncashmentRequestToJson(
        InsertIndemnityEncashmentRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'companyId': instance.companyId,
      'employeeId': instance.employeeId,
      'indemnityEncashmentId': instance.indemnityEncashmentId,
      'isByPayroll': instance.isByPayroll,
      'paymentMethodId': instance.paymentMethodId,
      'salaryMonth': instance.salaryMonth,
      'salaryYear': instance.salaryYear,
      'requestedDate': instance.requestedDate,
      'requestedDays': instance.requestedDays,
      'totalAmount': instance.totalAmount,
      'indemnityServiceDays': instance.indemnityServiceDays,
      'indemnityDays': instance.indemnityDays,
      'indemnityAmount': instance.indemnityAmount,
      'basicSalaryAmount': instance.basicSalaryAmount,
      'allowancesAmount': instance.allowancesAmount,
      'remarks': instance.remarks,
      'transactionStatusId': instance.transactionStatusId,
      'workFlowId': instance.workFlowId,
    };
