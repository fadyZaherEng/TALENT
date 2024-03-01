import 'package:json_annotation/json_annotation.dart';

import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/resume_duty/model/remote_calculateIn_case_resume_duty_details.dart';

part 'remote_calculate_in_case_resume_duty.g.dart';

@JsonSerializable()
class RemoteCalculateInCaseResumeDuty {
  @JsonKey(name: 'mainStatus')
  final bool? mainStatus;
  @JsonKey(name: 'mainMassage')
  final String? mainMassage;
  @JsonKey(name: 'salaryMonth')
  final int? salaryMonth;
  @JsonKey(name: 'salaryYear')
  final int? salaryYear;
  @JsonKey(name: 'employeeResumeDutyDetails')
  final List<RemoteCalculateInCaseResumeDutyDetails>? employeeResumeDutyDetails;

  RemoteCalculateInCaseResumeDuty({
    this.mainStatus,
    this.mainMassage,
    this.salaryMonth,
    this.salaryYear,
    this.employeeResumeDutyDetails,
  });

  factory RemoteCalculateInCaseResumeDuty.fromJson(Map<String, dynamic> json) =>
      _$RemoteCalculateInCaseResumeDutyFromJson(json);

  Map<String, dynamic> toJson() =>
      _$RemoteCalculateInCaseResumeDutyToJson(this);
}
