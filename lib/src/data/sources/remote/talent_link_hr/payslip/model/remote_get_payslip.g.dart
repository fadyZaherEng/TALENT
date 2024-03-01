// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_get_payslip.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteGetPayslip _$RemoteGetPayslipFromJson(Map<String, dynamic> json) =>
    RemoteGetPayslip(
      paymentBasicSalaryAmount: json['paymentBasicSalaryAmount'] as int?,
      allowancesAmount: json['allowancesAmount'] as int?,
      additionsAmount: json['additionsAmount'] as int?,
      deductionsAmount: json['deductionsAmount'] as int?,
      netTotalAmount: json['netTotalAmount'] as int?,
    );

Map<String, dynamic> _$RemoteGetPayslipToJson(RemoteGetPayslip instance) =>
    <String, dynamic>{
      'paymentBasicSalaryAmount': instance.paymentBasicSalaryAmount,
      'allowancesAmount': instance.allowancesAmount,
      'additionsAmount': instance.additionsAmount,
      'deductionsAmount': instance.deductionsAmount,
      'netTotalAmount': instance.netTotalAmount,
    };
