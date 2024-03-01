// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_last_requests.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteLastRequests _$RemoteLastRequestsFromJson(Map<String, dynamic> json) =>
    RemoteLastRequests(
      referenceId: json['referenceId'] as int?,
      referenceName: json['referenceName'] as String?,
      transactionId: json['transactionId'] as int?,
      transactionStatusId: json['transactionStatusId'] as int?,
      transactionStatusName: json['transactionStatusName'] as String?,
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$RemoteLastRequestsToJson(RemoteLastRequests instance) =>
    <String, dynamic>{
      'referenceId': instance.referenceId,
      'referenceName': instance.referenceName,
      'transactionId': instance.transactionId,
      'transactionStatusId': instance.transactionStatusId,
      'transactionStatusName': instance.transactionStatusName,
      'createdAt': instance.createdAt,
    };
