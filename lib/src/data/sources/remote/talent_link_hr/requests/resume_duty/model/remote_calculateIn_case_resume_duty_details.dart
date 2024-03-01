import 'package:json_annotation/json_annotation.dart';

part 'remote_calculateIn_case_resume_duty_details.g.dart';

@JsonSerializable()
class RemoteCalculateInCaseResumeDutyDetails {
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'employeeResumeDutyId')
  final int? employeeResumeDutyId;
  @JsonKey(name: 'salaryMonth')
  final int? salaryMonth;
  @JsonKey(name: 'salaryYear')
  final int? salaryYear;
  @JsonKey(name: 'fromDate')
  final String? fromDate;
  @JsonKey(name: 'toDate')
  final String? toDate;
  @JsonKey(name: 'calendarDays')
  final int? calendarDays;
  @JsonKey(name: 'resumedDays')
  final int? resumedDays;
  @JsonKey(name: 'resumeDutyTypeId')
  final int? resumeDutyTypeId;
  @JsonKey(name: 'weekendDays')
  final int? weekendDays;
  @JsonKey(name: 'publicHolidays')
  final int? publicHolidays;
  @JsonKey(name: 'resumedDaysAmount')
  final double? resumedDaysAmount;
  @JsonKey(name: 'resumedDaysDeductionAmount')
  final double? resumedDaysDeductionAmount;
  @JsonKey(name: 'weekendAmount')
  final double? weekendAmount;
  @JsonKey(name: 'weekendDeductionAmount')
  final double? weekendDeductionAmount;
  @JsonKey(name: 'publicHolidayAmount')
  final double? publicHolidayAmount;
  @JsonKey(name: 'publicHolidayDeductionAmount')
  final double? publicHolidayDeductionAmount;
  @JsonKey(name: 'basicSalaryAmount')
  final double? basicSalaryAmount;
  @JsonKey(name: 'basicSalaryDeductionAmount')
  final double? basicSalaryDeductionAmount;
  @JsonKey(name: 'isSettled')
  final bool? isSettled;
  @JsonKey(name: 'settlementDate')
  final String? settlementDate;
  @JsonKey(name: 'settlementRemarks')
  final String? settlementRemarks;
  @JsonKey(name: 'referenceType')
  final String? referenceType;
  @JsonKey(name: 'referenceId')
  final String? referenceId;
  @JsonKey(name: 'remarks')
  final String? remarks;
  @JsonKey(name: 'isDeleted')
  final bool? isDeleted;

  RemoteCalculateInCaseResumeDutyDetails({
    this.id,
    this.employeeResumeDutyId,
    this.salaryMonth,
    this.salaryYear,
    this.fromDate,
    this.toDate,
    this.calendarDays,
    this.resumedDays,
    this.resumeDutyTypeId,
    this.weekendDays,
    this.publicHolidays,
    this.resumedDaysAmount,
    this.resumedDaysDeductionAmount,
    this.weekendAmount,
    this.weekendDeductionAmount,
    this.publicHolidayAmount,
    this.publicHolidayDeductionAmount,
    this.basicSalaryAmount,
    this.basicSalaryDeductionAmount,
    this.isSettled,
    this.settlementDate,
    this.settlementRemarks,
    this.referenceType,
    this.referenceId,
    this.remarks,
    required this.isDeleted,
  });

  factory RemoteCalculateInCaseResumeDutyDetails.fromJson(
          Map<String, dynamic> json) =>
      _$RemoteCalculateInCaseResumeDutyDetailsFromJson(json);

  Map<String, dynamic> toJson() =>
      _$RemoteCalculateInCaseResumeDutyDetailsToJson(this);
}
