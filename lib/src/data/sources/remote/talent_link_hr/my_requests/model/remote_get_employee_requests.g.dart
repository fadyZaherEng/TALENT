// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_get_employee_requests.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteGetEmployeeRequests _$RemoteGetEmployeeRequestsFromJson(
        Map<String, dynamic> json) =>
    RemoteGetEmployeeRequests(
      referenceId: json['referenceId'] as int?,
      referenceName: json['referenceName'] as String?,
      transactionId: json['transactionId'] as int?,
      transactionStatusName: json['transactionStatusName'] as String?,
      createdAt: json['createdAt'] as String?,
      transactionStatusId: json['transactionStatusId'] as int?,
    );

Map<String, dynamic> _$RemoteGetEmployeeRequestsToJson(
        RemoteGetEmployeeRequests instance) =>
    <String, dynamic>{
      'referenceId': instance.referenceId,
      'referenceName': instance.referenceName,
      'transactionId': instance.transactionId,
      'transactionStatusId': instance.transactionStatusId,
      'transactionStatusName': instance.transactionStatusName,
      'createdAt': instance.createdAt,
    };
