// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_employee_leave_balance_responce.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteEmployeeLeaveBalanceResponse _$RemoteEmployeeLeaveBalanceResponseFromJson(
        Map<String, dynamic> json) =>
    RemoteEmployeeLeaveBalanceResponse(
      isAllowYearlyBalance: json['isAllowYearlyBalance'] as bool?,
      currentBalance: json['currentBalance'] as int?,
      yearlyBalance: json['yearlyBalance'] as int?,
      leaveDays: json['leaveDays'] as int?,
      status: json['status'] as bool?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$RemoteEmployeeLeaveBalanceResponseToJson(
        RemoteEmployeeLeaveBalanceResponse instance) =>
    <String, dynamic>{
      'isAllowYearlyBalance': instance.isAllowYearlyBalance,
      'currentBalance': instance.currentBalance,
      'yearlyBalance': instance.yearlyBalance,
      'leaveDays': instance.leaveDays,
      'status': instance.status,
      'message': instance.message,
    };
