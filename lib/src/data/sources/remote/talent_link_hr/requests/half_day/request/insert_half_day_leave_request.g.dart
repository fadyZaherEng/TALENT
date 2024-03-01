// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'insert_half_day_leave_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InsertHalfDayLeaveRequest _$InsertHalfDayLeaveRequestFromJson(
        Map<String, dynamic> json) =>
    InsertHalfDayLeaveRequest(
      companyId: json['companyId'] as int,
      employeeId: json['employeeId'] as int,
      halfDayLeaveTypeId: json['halfDayLeaveTypeId'] as int,
      halfDayLeaveDate: json['halfDayLeaveDate'] as String,
      startTime: json['startTime'] as String,
      endTime: json['endTime'] as String,
      noOfMinutes: json['noOfMinutes'] as int,
      reason: json['reason'] as String,
      remarks: json['remarks'] as String,
      basicSalaryAmount: json['BasicSalaryAmount'] as int,
      allowancesAmount: json['AllowancesAmount'] as int,
      transactionStatusId: json['transactionStatusId'] as int,
      wfId: json['wfId'] as int,
      id: json['id'] as int,
    );

Map<String, dynamic> _$InsertHalfDayLeaveRequestToJson(
        InsertHalfDayLeaveRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'companyId': instance.companyId,
      'employeeId': instance.employeeId,
      'halfDayLeaveTypeId': instance.halfDayLeaveTypeId,
      'halfDayLeaveDate': instance.halfDayLeaveDate,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'noOfMinutes': instance.noOfMinutes,
      'reason': instance.reason,
      'remarks': instance.remarks,
      'BasicSalaryAmount': instance.basicSalaryAmount,
      'AllowancesAmount': instance.allowancesAmount,
      'transactionStatusId': instance.transactionStatusId,
      'wfId': instance.wfId,
    };
