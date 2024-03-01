import 'package:json_annotation/json_annotation.dart';

part 'insert_short_leave_request.g.dart';

@JsonSerializable()
class InsertShortLeaveRequest {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'companyId')
  final int companyId;
  @JsonKey(name: 'employeeId')
  final int employeeId;
  @JsonKey(name: 'leaveTypeId')
  final int leaveTypeId;
  @JsonKey(name: 'shortLeaveTypeId')
  final int shortLeaveTypeId;
  @JsonKey(name: 'shortLeaveDate')
  final String shortLeaveDate;
  @JsonKey(name: 'startTime')
  final String startTime;
  @JsonKey(name: 'endTime')
  final String endTime;
  @JsonKey(name: 'noOfMinutes')
  final String noOfMinutes;
  @JsonKey(name: 'reason')
  final String reason;
  @JsonKey(name: 'referenceName')
  final String referenceName;
  @JsonKey(name: 'referenceContactNo')
  final String referenceContactNo;
  @JsonKey(name: 'currentBalance')
  final int currentBalance;
  @JsonKey(name: 'remainingBalance')
  final int remainingBalance;
  @JsonKey(name: 'remarks')
  final String remarks;
  @JsonKey(name: 'transactionStatusId')
  final int transactionStatusId;
  @JsonKey(name: 'workFlowId')
  final int workFlowId;
  @JsonKey(name: 'basicSalaryAmount')
  final int basicSalaryAmount;
  @JsonKey(name: 'allowancesAmount')
  final int allowancesAmount;

  InsertShortLeaveRequest({
    required this.id,
    required this.companyId,
    required this.employeeId,
    required this.leaveTypeId,
    required this.shortLeaveTypeId,
    required this.shortLeaveDate,
    required this.startTime,
    required this.endTime,
    required this.noOfMinutes,
    required this.reason,
    required this.referenceName,
    required this.referenceContactNo,
    required this.currentBalance,
    required this.remainingBalance,
    required this.remarks,
    required this.transactionStatusId,
    required this.workFlowId,
    required this.basicSalaryAmount,
    required this.allowancesAmount,
  });

  factory InsertShortLeaveRequest.fromJson(Map<String, dynamic> json) =>
      _$InsertShortLeaveRequestFromJson(json);

  Map<String, dynamic> toJson() => _$InsertShortLeaveRequestToJson(this);

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "companyId": companyId,
      "employeeId": employeeId,
      "leaveTypeId": leaveTypeId,
      "shortLeaveTypeId": shortLeaveTypeId,
      "shortLeaveDate": shortLeaveDate,
      "startTime": startTime,
      "endTime": endTime,
      "noOfMinutes": noOfMinutes,
      "reason": reason,
      "referenceName": referenceName,
      "referenceContactNo": referenceContactNo,
      "currentBalance": currentBalance,
      "remainingBalance": remainingBalance,
      "remarks": remarks,
      "transactionStatusId": transactionStatusId,
      "workFlowId": workFlowId,
      "basicSalaryAmount": basicSalaryAmount,
      "allowancesAmount": allowancesAmount,
    };
  }

  factory InsertShortLeaveRequest.fromMap(Map<String, dynamic> map) {
    return InsertShortLeaveRequest(
      id: map['id'] as int,
      companyId: map['companyId'] as int,
      employeeId: map['employeeId'] as int,
      leaveTypeId: map['leaveTypeId'] as int,
      shortLeaveTypeId: map['shortLeaveTypeId'] as int,
      shortLeaveDate: map['shortLeaveDate'] as String,
      startTime: map['startTime'] as String,
      endTime: map['endTime'] as String,
      noOfMinutes: map['noOfMinutes'] as String,
      reason: map['reason'] as String,
      referenceName: map['referenceName'] as String,
      referenceContactNo: map['referenceContactNo'] as String,
      currentBalance: map['currentBalance'] as int,
      remainingBalance: map['remainingBalance'] as int,
      remarks: map['remarks'] as String,
      transactionStatusId: map['transactionStatusId'] as int,
      workFlowId: map['workFlowId'] as int,
      basicSalaryAmount: map['basicSalaryAmount'] as int,
      allowancesAmount: map['allowancesAmount'] as int,
    );
  }
}
