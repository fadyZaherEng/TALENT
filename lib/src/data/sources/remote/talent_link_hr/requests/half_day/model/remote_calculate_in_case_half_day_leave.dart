import 'package:json_annotation/json_annotation.dart';

import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/half_day/model/remote_employee_leave_balance_responce.dart';

part 'remote_calculate_in_case_half_day_leave.g.dart';

@JsonSerializable()
class RemoteCalculateInCaseHalfDayLeave {
  @JsonKey(name: 'mainStatus')
  final bool? mainStatus;
  @JsonKey(name: 'mainMassage')
  final String? mainMassage;
  @JsonKey(name: 'employeeLeaveBalanceResponce')
  final RemoteEmployeeLeaveBalanceResponse? employeeLeaveBalanceResponse;

  RemoteCalculateInCaseHalfDayLeave({
    this.mainMassage,
    this.mainStatus,
    this.employeeLeaveBalanceResponse,
  });

  factory RemoteCalculateInCaseHalfDayLeave.fromJson(
          Map<String, dynamic> json) =>
      _$RemoteCalculateInCaseHalfDayLeaveFromJson(json);

  Map<String, dynamic> toJson() =>
      _$RemoteCalculateInCaseHalfDayLeaveToJson(this);
}
