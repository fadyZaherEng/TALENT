// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_payslip_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PayslipRequest _$PayslipRequestFromJson(Map<String, dynamic> json) =>
    PayslipRequest(
      employeeId: json['employeeId'] as int?,
      month: json['month'] as String?,
      year: json['year'] as int?,
    );

Map<String, dynamic> _$PayslipRequestToJson(PayslipRequest instance) =>
    <String, dynamic>{
      'employeeId': instance.employeeId,
      'month': instance.month,
      'year': instance.year,
    };
