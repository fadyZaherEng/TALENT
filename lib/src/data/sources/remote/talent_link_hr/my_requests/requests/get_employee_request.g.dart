// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_employee_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetEmployeeRequest _$GetEmployeeRequestFromJson(Map<String, dynamic> json) =>
    GetEmployeeRequest(
      requestTypeId: json['RequestTypeId'] as int?,
      employeeId: json['employeeId'] as int?,
      transactionStatusId: json['TransactionStatusId'] as int?,
      requestFromDate: json['RequestFromDate'] as String?,
      requestToDate: json['RequestToDate'] as String?,
      createdDateAt: json['CreatedDateAt'] as String?,
      createdDateFrom: json['CreatedDateFrom'] as String?,
      requestDataId: json['requestDataId'] as int?,
    );

Map<String, dynamic> _$GetEmployeeRequestToJson(GetEmployeeRequest instance) =>
    <String, dynamic>{
      'RequestTypeId': instance.requestTypeId,
      'employeeId': instance.employeeId,
      'TransactionStatusId': instance.transactionStatusId,
      'RequestFromDate': instance.requestFromDate,
      'RequestToDate': instance.requestToDate,
      'CreatedDateAt': instance.createdDateAt,
      'CreatedDateFrom': instance.createdDateFrom,
      'requestDataId': instance.requestDataId,
    };
