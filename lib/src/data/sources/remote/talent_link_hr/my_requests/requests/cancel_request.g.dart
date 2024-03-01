// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cancel_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CancelRequestRequest _$CancelRequestRequestFromJson(
        Map<String, dynamic> json) =>
    CancelRequestRequest(
      tableId: json['tableId'] as int?,
      transactionId: json['transactionId'] as int?,
    );

Map<String, dynamic> _$CancelRequestRequestToJson(
        CancelRequestRequest instance) =>
    <String, dynamic>{
      'tableId': instance.tableId,
      'transactionId': instance.transactionId,
    };
