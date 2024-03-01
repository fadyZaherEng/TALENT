// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_last_vacation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteLastVacation _$RemoteLastVacationFromJson(Map<String, dynamic> json) =>
    RemoteLastVacation(
      referenceId: json['referenceId'] as int?,
      referenceName: json['referenceName'] as String?,
      transactionId: json['transactionId'] as int?,
      transactionStatusId: json['transactionStatusId'] as int?,
      transactionStatusName: json['transactionStatusName'] as String?,
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$RemoteLastVacationToJson(RemoteLastVacation instance) =>
    <String, dynamic>{
      'referenceId': instance.referenceId,
      'referenceName': instance.referenceName,
      'transactionId': instance.transactionId,
      'transactionStatusId': instance.transactionStatusId,
      'transactionStatusName': instance.transactionStatusName,
      'createdAt': instance.createdAt,
    };
