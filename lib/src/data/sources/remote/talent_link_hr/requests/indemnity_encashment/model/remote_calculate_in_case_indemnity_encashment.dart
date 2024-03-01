import 'package:json_annotation/json_annotation.dart';

import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/indemnity_encashment/model/remote_indemnity_encashment_policy_outputs.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/indemnity_encashment/model/remote_validate_month_year_dto.dart';

part 'remote_calculate_in_case_indemnity_encashment.g.dart';

@JsonSerializable()
class RemoteCalculateInCaseIndemnityEncashment {
  @JsonKey(name: 'status')
  final bool? status;
  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'indemnityEncashmentPolicyOutputs')
  final RemoteIndemnityEncashmentPolicyOutputs?
      indemnityEncashmentPolicyOutputs;
  @JsonKey(name: 'validateMonthYearDto')
  final RemoteValidateMonthYearDto? validateMonthYearDto;

  RemoteCalculateInCaseIndemnityEncashment({
    this.status,
    this.message,
    this.indemnityEncashmentPolicyOutputs,
    this.validateMonthYearDto,
  });

  factory RemoteCalculateInCaseIndemnityEncashment.fromJson(
          Map<String, dynamic> json) =>
      _$RemoteCalculateInCaseIndemnityEncashmentFromJson(json);

  Map<String, dynamic> toJson() =>
      _$RemoteCalculateInCaseIndemnityEncashmentToJson(this);
}
