// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calculate_in_case_indemnity_encashment_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CalculateInCaseIndemnityEncashmentRequest
    _$CalculateInCaseIndemnityEncashmentRequestFromJson(
            Map<String, dynamic> json) =>
        CalculateInCaseIndemnityEncashmentRequest(
          employeeId: json['employeeId'] as int,
          toDate: json['toDate'] as String,
          requestedDays: json['requestedDays'] as int,
          startDate: json['startDate'] as String,
        );

Map<String, dynamic> _$CalculateInCaseIndemnityEncashmentRequestToJson(
        CalculateInCaseIndemnityEncashmentRequest instance) =>
    <String, dynamic>{
      'employeeId': instance.employeeId,
      'toDate': instance.toDate,
      'requestedDays': instance.requestedDays,
      'startDate': instance.startDate,
    };
