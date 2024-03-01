// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_get_gross_salary_and_currency.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteGetGrossSalaryAndCurrency _$RemoteGetGrossSalaryAndCurrencyFromJson(
        Map<String, dynamic> json) =>
    RemoteGetGrossSalaryAndCurrency(
      basicSalary: json['basicSalary'] as int?,
      totalAllowances: json['totalAllowances'] as int?,
      grossSalary: json['grossSalary'] as int?,
      currencyId: json['currencyId'] as int?,
      currency: json['currency'] as String?,
      noOfDigits: json['noOfDigits'] as int?,
    );

Map<String, dynamic> _$RemoteGetGrossSalaryAndCurrencyToJson(
        RemoteGetGrossSalaryAndCurrency instance) =>
    <String, dynamic>{
      'noOfDigits': instance.noOfDigits,
      'basicSalary': instance.basicSalary,
      'totalAllowances': instance.totalAllowances,
      'grossSalary': instance.grossSalary,
      'currencyId': instance.currencyId,
      'currency': instance.currency,
    };
