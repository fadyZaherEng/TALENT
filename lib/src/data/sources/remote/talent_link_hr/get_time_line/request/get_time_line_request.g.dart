// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_time_line_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetTimeLineRequest _$GetTimeLineRequestFromJson(Map<String, dynamic> json) =>
    GetTimeLineRequest(
      tableId: json['tableId'] as int?,
      transactionId: json['transactionId'] as int?,
      baseUrl: json['baseUrl'] as String?,
    );

Map<String, dynamic> _$GetTimeLineRequestToJson(GetTimeLineRequest instance) =>
    <String, dynamic>{
      'tableId': instance.tableId,
      'transactionId': instance.transactionId,
      'baseUrl': instance.baseUrl,
    };
