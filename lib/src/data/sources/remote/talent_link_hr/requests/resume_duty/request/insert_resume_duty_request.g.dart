// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'insert_resume_duty_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InsertResumeDutyRequest _$InsertResumeDutyRequestFromJson(
        Map<String, dynamic> json) =>
    InsertResumeDutyRequest(
      employeeId: json['employeeId'] as int,
      id: json['id'] as int,
      companyId: json['companyId'] as int,
      isByPayroll: json['isByPayroll'] as int,
      paymentMethodId: json['paymentMethodId'] as int,
      remarks: json['remarks'] as String,
      basicSalaryAmount: json['basicSalaryAmount'] as int,
      allowancesAmount: json['allowancesAmount'] as int,
      transactionStatusId: json['transactionStatusId'] as int,
      noOfDigits: json['noOfDigits'] as int,
      workFlowId: json['workFlowId'] as int,
      expectedResumeDutyDate: json['expectedResumeDutyDate'] as String,
      resumeDutyReferenceType: json['resumeDutyReferenceType'],
      actualResumeDutyDate: json['actualResumeDutyDate'] as String,
      isNewJoining: json['isNewJoining'] as int,
      resumeDutyReferenceId: json['resumeDutyReferenceId'],
      resumeDutyTypeId: json['resumeDutyTypeId'] as int,
    );

Map<String, dynamic> _$InsertResumeDutyRequestToJson(
        InsertResumeDutyRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'companyId': instance.companyId,
      'employeeId': instance.employeeId,
      'isNewJoining': instance.isNewJoining,
      'isByPayroll': instance.isByPayroll,
      'paymentMethodId': instance.paymentMethodId,
      'transactionStatusId': instance.transactionStatusId,
      'remarks': instance.remarks,
      'workFlowId': instance.workFlowId,
      'resumeDutyReferenceType': instance.resumeDutyReferenceType,
      'resumeDutyReferenceId': instance.resumeDutyReferenceId,
      'expectedResumeDutyDate': instance.expectedResumeDutyDate,
      'actualResumeDutyDate': instance.actualResumeDutyDate,
      'resumeDutyTypeId': instance.resumeDutyTypeId,
      'basicSalaryAmount': instance.basicSalaryAmount,
      'allowancesAmount': instance.allowancesAmount,
      'noOfDigits': instance.noOfDigits,
    };
