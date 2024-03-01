import 'package:json_annotation/json_annotation.dart';

part 'get_payslip_request.g.dart';

@JsonSerializable()
class PayslipRequest {
  @JsonKey(name: "employeeId")
  final int? employeeId;
  @JsonKey(name: "month")
  final String? month;
  @JsonKey(name: "year")
  final int? year;

  const PayslipRequest({
    this.employeeId,
    this.month,
    this.year,
  });

  factory PayslipRequest.fromJson(Map<String, dynamic> json) =>
      _$PayslipRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PayslipRequestToJson(this);
}
