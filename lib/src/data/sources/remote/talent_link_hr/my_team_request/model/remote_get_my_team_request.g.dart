// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_get_my_team_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteGetMyTeamRequest _$RemoteGetMyTeamRequestFromJson(
        Map<String, dynamic> json) =>
    RemoteGetMyTeamRequest(
      employeeName: json['employeeName'] as String?,
      referenceId: json['referenceId'] as int?,
      referenceName: json['referenceName'] as String?,
      createdAt: json['createdAt'] as String?,
      transactionId: json['transactionId'] as int?,
      transactionStatusName: json['transactionStatusName'] as String?,
      transactionStatusId: json['transactionStatusId'] as int?,
    );

Map<String, dynamic> _$RemoteGetMyTeamRequestToJson(
        RemoteGetMyTeamRequest instance) =>
    <String, dynamic>{
      'employeeName': instance.employeeName,
      'referenceId': instance.referenceId,
      'referenceName': instance.referenceName,
      'createdAt': instance.createdAt,
      'transactionId': instance.transactionId,
      'transactionStatusId': instance.transactionStatusId,
      'transactionStatusName': instance.transactionStatusName,
    };
