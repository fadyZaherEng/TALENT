import 'package:json_annotation/json_annotation.dart';

import 'package:talent_link/src/domain/entities/payslip/payslip.dart';

part 'remote_get_payslip.g.dart';

@JsonSerializable()
class RemoteGetPayslip {
  @JsonKey(name: "paymentBasicSalaryAmount")
  final int? paymentBasicSalaryAmount;
  @JsonKey(name: "allowancesAmount")
  final int? allowancesAmount;
  @JsonKey(name: "additionsAmount")
  final int? additionsAmount;
  @JsonKey(name: "deductionsAmount")
  final int? deductionsAmount;
  @JsonKey(name: "netTotalAmount")
  final int? netTotalAmount;

  const RemoteGetPayslip({
    this.paymentBasicSalaryAmount,
    this.allowancesAmount,
    this.additionsAmount,
    this.deductionsAmount,
    this.netTotalAmount,
  });

  factory RemoteGetPayslip.fromJson(Map<String, dynamic> json) =>
      _$RemoteGetPayslipFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteGetPayslipToJson(this);
}

extension RemoteGetPayslipExtension on RemoteGetPayslip {
  Payslip mapToDomain() {
    return Payslip(
      paymentBasicSalaryAmount: paymentBasicSalaryAmount ?? 0,
      allowancesAmount: allowancesAmount ?? 0,
      additionsAmount: additionsAmount ?? 0,
      deductionsAmount: deductionsAmount ?? 0,
      netTotalAmount: netTotalAmount ?? 0,
    );
  }
}
