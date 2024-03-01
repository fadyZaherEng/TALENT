import 'package:json_annotation/json_annotation.dart';

part 'remote_employee_leave_balance_responce.g.dart';

@JsonSerializable()
class RemoteEmployeeLeaveBalanceResponse {
  @JsonKey(name: 'isAllowYearlyBalance')
  final bool? isAllowYearlyBalance;
  @JsonKey(name: 'currentBalance')
  final int? currentBalance;
  @JsonKey(name: 'yearlyBalance')
  final int? yearlyBalance;
  @JsonKey(name: 'leaveDays')
  final int? leaveDays;
  @JsonKey(name: 'status')
  final bool? status;
  @JsonKey(name: 'message')
  final String? message;

  RemoteEmployeeLeaveBalanceResponse({
    this.isAllowYearlyBalance,
    this.currentBalance,
    this.yearlyBalance,
    this.leaveDays,
    this.status,
    this.message,
  });

  factory RemoteEmployeeLeaveBalanceResponse.fromJson(
          Map<String, dynamic> json) =>
      _$RemoteEmployeeLeaveBalanceResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$RemoteEmployeeLeaveBalanceResponseToJson(this);
}
