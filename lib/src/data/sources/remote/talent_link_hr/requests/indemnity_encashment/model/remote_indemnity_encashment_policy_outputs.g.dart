// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_indemnity_encashment_policy_outputs.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteIndemnityEncashmentPolicyOutputs
    _$RemoteIndemnityEncashmentPolicyOutputsFromJson(
            Map<String, dynamic> json) =>
        RemoteIndemnityEncashmentPolicyOutputs(
          status: json['status'] as bool?,
          indemnityServiceDays:
              (json['indemnityServiceDays'] as num?)?.toDouble(),
          indemnityDays: (json['indemnityDays'] as num?)?.toDouble(),
          indemnityAmount: (json['indemnityAmount'] as num?)?.toDouble(),
          totalAmount: (json['totalAmount'] as num?)?.toDouble(),
          message: json['message'],
        );

Map<String, dynamic> _$RemoteIndemnityEncashmentPolicyOutputsToJson(
        RemoteIndemnityEncashmentPolicyOutputs instance) =>
    <String, dynamic>{
      'status': instance.status,
      'indemnityServiceDays': instance.indemnityServiceDays,
      'indemnityDays': instance.indemnityDays,
      'indemnityAmount': instance.indemnityAmount,
      'totalAmount': instance.totalAmount,
      'message': instance.message,
    };
