import 'package:json_annotation/json_annotation.dart';

part 'remote_indemnity_encashment_policy_outputs.g.dart';

@JsonSerializable()
class RemoteIndemnityEncashmentPolicyOutputs {
  @JsonKey(name: 'status')
  final bool? status;
  @JsonKey(name: 'indemnityServiceDays')
  final double? indemnityServiceDays;
  @JsonKey(name: 'indemnityDays')
  final double? indemnityDays;
  @JsonKey(name: 'indemnityAmount')
  final double? indemnityAmount;
  @JsonKey(name: 'totalAmount')
  final double? totalAmount;
  @JsonKey(name: 'message')
  final dynamic message;

  RemoteIndemnityEncashmentPolicyOutputs({
    this.status,
    this.indemnityServiceDays,
    this.indemnityDays,
    this.indemnityAmount,
    this.totalAmount,
    this.message,
  });

  factory RemoteIndemnityEncashmentPolicyOutputs.fromJson(
          Map<String, dynamic> json) =>
      _$RemoteIndemnityEncashmentPolicyOutputsFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteIndemnityEncashmentPolicyOutputsToJson(this);
}
