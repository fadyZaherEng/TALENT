// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'insert_punch_from_dashboard_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InsertPunchFromDashboard _$InsertPunchFromDashboardFromJson(
        Map<String, dynamic> json) =>
    InsertPunchFromDashboard(
      punchTypeSystemCode: json['punchTypeSystemCode'] as String,
      fingerPrintNo: json['fingerPrintNo'] as String,
      longitude: json['longitude'] as String?,
      latitude: json['latitude'] as String?,
    );

Map<String, dynamic> _$InsertPunchFromDashboardToJson(
        InsertPunchFromDashboard instance) =>
    <String, dynamic>{
      'punchTypeSystemCode': instance.punchTypeSystemCode,
      'fingerPrintNo': instance.fingerPrintNo,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
    };
