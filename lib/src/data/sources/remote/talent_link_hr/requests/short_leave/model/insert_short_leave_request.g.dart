// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'insert_short_leave_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InsertShortLeaveRequest _$InsertShortLeaveRequestFromJson(
        Map<String, dynamic> json) =>
    InsertShortLeaveRequest(
      id: json['id'] as int,
      companyId: json['companyId'] as int,
      employeeId: json['employeeId'] as int,
      leaveTypeId: json['leaveTypeId'] as int,
      shortLeaveTypeId: json['shortLeaveTypeId'] as int,
      shortLeaveDate: json['shortLeaveDate'] as String,
      startTime: json['startTime'] as String,
      endTime: json['endTime'] as String,
      noOfMinutes: json['noOfMinutes'] as String,
      reason: json['reason'] as String,
      referenceName: json['referenceName'] as String,
      referenceContactNo: json['referenceContactNo'] as String,
      currentBalance: json['currentBalance'] as int,
      remainingBalance: json['remainingBalance'] as int,
      remarks: json['remarks'] as String,
      transactionStatusId: json['transactionStatusId'] as int,
      workFlowId: json['workFlowId'] as int,
      basicSalaryAmount: json['basicSalaryAmount'] as int,
      allowancesAmount: json['allowancesAmount'] as int,
    );

Map<String, dynamic> _$InsertShortLeaveRequestToJson(
        InsertShortLeaveRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'companyId': instance.companyId,
      'employeeId': instance.employeeId,
      'leaveTypeId': instance.leaveTypeId,
      'shortLeaveTypeId': instance.shortLeaveTypeId,
      'shortLeaveDate': instance.shortLeaveDate,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'noOfMinutes': instance.noOfMinutes,
      'reason': instance.reason,
      'referenceName': instance.referenceName,
      'referenceContactNo': instance.referenceContactNo,
      'currentBalance': instance.currentBalance,
      'remainingBalance': instance.remainingBalance,
      'remarks': instance.remarks,
      'transactionStatusId': instance.transactionStatusId,
      'workFlowId': instance.workFlowId,
      'basicSalaryAmount': instance.basicSalaryAmount,
      'allowancesAmount': instance.allowancesAmount,
    };
