import 'package:json_annotation/json_annotation.dart';

part 'remote_get_gross_salary_and_currency.g.dart';

@JsonSerializable()
class RemoteGetGrossSalaryAndCurrency {
  @JsonKey(name: 'noOfDigits')
  final int? noOfDigits;
  @JsonKey(name: 'basicSalary')
  final int? basicSalary;
  @JsonKey(name: 'totalAllowances')
  final int? totalAllowances;
  @JsonKey(name: 'grossSalary')
  final int? grossSalary;
  @JsonKey(name: 'currencyId')
  final int? currencyId;
  @JsonKey(name: 'currency')
  final String? currency;

  RemoteGetGrossSalaryAndCurrency({
    this.basicSalary,
    this.totalAllowances,
    this.grossSalary,
    this.currencyId,
    this.currency,
    this.noOfDigits,
  });

  factory RemoteGetGrossSalaryAndCurrency.fromJson(Map<String, dynamic> json) =>
      _$RemoteGetGrossSalaryAndCurrencyFromJson(json);

  Map<String, dynamic> toJson() =>
      _$RemoteGetGrossSalaryAndCurrencyToJson(this);
}
