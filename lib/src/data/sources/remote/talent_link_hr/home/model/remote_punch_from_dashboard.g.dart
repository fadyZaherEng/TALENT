// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_punch_from_dashboard.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemotePunchFromDashboard _$RemotePunchFromDashboardFromJson(
        Map<String, dynamic> json) =>
    RemotePunchFromDashboard(
      punchTime: json['punchTime'] as String?,
      punchTypeSystemCode: json['punchTypeSystemCode'] as String?,
      remainingTime: json['remainingTime'] as String?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$RemotePunchFromDashboardToJson(
        RemotePunchFromDashboard instance) =>
    <String, dynamic>{
      'punchTime': instance.punchTime,
      'punchTypeSystemCode': instance.punchTypeSystemCode,
      'remainingTime': instance.remainingTime,
      'message': instance.message,
    };
