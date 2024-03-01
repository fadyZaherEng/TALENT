// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_calculate_in_case_indemnity_encashment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteCalculateInCaseIndemnityEncashment
    _$RemoteCalculateInCaseIndemnityEncashmentFromJson(
            Map<String, dynamic> json) =>
        RemoteCalculateInCaseIndemnityEncashment(
          status: json['status'] as bool?,
          message: json['message'] as String?,
          indemnityEncashmentPolicyOutputs:
              json['indemnityEncashmentPolicyOutputs'] == null
                  ? null
                  : RemoteIndemnityEncashmentPolicyOutputs.fromJson(
                      json['indemnityEncashmentPolicyOutputs']
                          as Map<String, dynamic>),
          validateMonthYearDto: json['validateMonthYearDto'] == null
              ? null
              : RemoteValidateMonthYearDto.fromJson(
                  json['validateMonthYearDto'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$RemoteCalculateInCaseIndemnityEncashmentToJson(
        RemoteCalculateInCaseIndemnityEncashment instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'indemnityEncashmentPolicyOutputs':
          instance.indemnityEncashmentPolicyOutputs,
      'validateMonthYearDto': instance.validateMonthYearDto,
    };
