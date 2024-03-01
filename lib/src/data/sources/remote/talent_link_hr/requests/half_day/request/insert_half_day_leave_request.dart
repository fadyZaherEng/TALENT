import 'package:json_annotation/json_annotation.dart';

part 'insert_half_day_leave_request.g.dart';

@JsonSerializable()
class InsertHalfDayLeaveRequest {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'companyId')
  final int companyId;
  @JsonKey(name: 'employeeId')
  final int employeeId;
  @JsonKey(name: 'halfDayLeaveTypeId')
  final int halfDayLeaveTypeId;
  @JsonKey(name: 'halfDayLeaveDate')
  final String halfDayLeaveDate;
  @JsonKey(name: 'startTime')
  final String startTime;
  @JsonKey(name: 'endTime')
  final String endTime;
  @JsonKey(name: 'noOfMinutes')
  final int noOfMinutes;
  @JsonKey(name: 'reason')
  final String reason;
  @JsonKey(name: 'remarks')
  final String remarks;
  @JsonKey(name: 'BasicSalaryAmount')
  final int basicSalaryAmount;
  @JsonKey(name: 'AllowancesAmount')
  final int allowancesAmount;
  @JsonKey(name: 'transactionStatusId')
  final int transactionStatusId;
  @JsonKey(name: 'wfId')
  final int wfId;

  InsertHalfDayLeaveRequest({
    required this.companyId,
    required this.employeeId,
    required this.halfDayLeaveTypeId,
    required this.halfDayLeaveDate,
    required this.startTime,
    required this.endTime,
    required this.noOfMinutes,
    required this.reason,
    required this.remarks,
    required this.basicSalaryAmount,
    required this.allowancesAmount,
    required this.transactionStatusId,
    required this.wfId,
    required this.id,
  });

  factory InsertHalfDayLeaveRequest.fromJson(Map<String, dynamic> json) =>
      _$InsertHalfDayLeaveRequestFromJson(json);

  Map<String, dynamic> toJson() => _$InsertHalfDayLeaveRequestToJson(this);

  Map<String, dynamic> toMap() {
    return {
      "id": id,
    };
  }

  factory InsertHalfDayLeaveRequest.fromMap(Map<String, dynamic> map) {
    return InsertHalfDayLeaveRequest(
      id: map['id'] as int,
      transactionStatusId: map['transactionStatusId'] as int,
      companyId: map['companyId'] as int,
      employeeId: map['employeeId'] as int,
      remarks: map['remarks'] as String,
      startTime: map['startTime'] as String,
      endTime: map['endTime'] as String,
      allowancesAmount: map['AllowancesAmount'] as int,
      basicSalaryAmount: map['BasicSalaryAmount'] as int,
      halfDayLeaveDate: map['halfDayLeaveDate'] as String,
      halfDayLeaveTypeId: map['halfDayLeaveTypeId'] as int,
      noOfMinutes: map['noOfMinutes'] as int,
      reason: map['reason'] as String,
      wfId: map['id'] as int,
    );
  }
}
