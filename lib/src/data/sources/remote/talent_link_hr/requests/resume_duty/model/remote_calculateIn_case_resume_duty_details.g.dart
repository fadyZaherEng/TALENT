// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_calculateIn_case_resume_duty_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteCalculateInCaseResumeDutyDetails
    _$RemoteCalculateInCaseResumeDutyDetailsFromJson(
            Map<String, dynamic> json) =>
        RemoteCalculateInCaseResumeDutyDetails(
          id: json['id'] as int?,
          employeeResumeDutyId: json['employeeResumeDutyId'] as int?,
          salaryMonth: json['salaryMonth'] as int?,
          salaryYear: json['salaryYear'] as int?,
          fromDate: json['fromDate'] as String?,
          toDate: json['toDate'] as String?,
          calendarDays: json['calendarDays'] as int?,
          resumedDays: json['resumedDays'] as int?,
          resumeDutyTypeId: json['resumeDutyTypeId'] as int?,
          weekendDays: json['weekendDays'] as int?,
          publicHolidays: json['publicHolidays'] as int?,
          resumedDaysAmount: (json['resumedDaysAmount'] as num?)?.toDouble(),
          resumedDaysDeductionAmount:
              (json['resumedDaysDeductionAmount'] as num?)?.toDouble(),
          weekendAmount: (json['weekendAmount'] as num?)?.toDouble(),
          weekendDeductionAmount:
              (json['weekendDeductionAmount'] as num?)?.toDouble(),
          publicHolidayAmount:
              (json['publicHolidayAmount'] as num?)?.toDouble(),
          publicHolidayDeductionAmount:
              (json['publicHolidayDeductionAmount'] as num?)?.toDouble(),
          basicSalaryAmount: (json['basicSalaryAmount'] as num?)?.toDouble(),
          basicSalaryDeductionAmount:
              (json['basicSalaryDeductionAmount'] as num?)?.toDouble(),
          isSettled: json['isSettled'] as bool?,
          settlementDate: json['settlementDate'] as String?,
          settlementRemarks: json['settlementRemarks'] as String?,
          referenceType: json['referenceType'] as String?,
          referenceId: json['referenceId'] as String?,
          remarks: json['remarks'] as String?,
          isDeleted: json['isDeleted'] as bool?,
        );

Map<String, dynamic> _$RemoteCalculateInCaseResumeDutyDetailsToJson(
        RemoteCalculateInCaseResumeDutyDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'employeeResumeDutyId': instance.employeeResumeDutyId,
      'salaryMonth': instance.salaryMonth,
      'salaryYear': instance.salaryYear,
      'fromDate': instance.fromDate,
      'toDate': instance.toDate,
      'calendarDays': instance.calendarDays,
      'resumedDays': instance.resumedDays,
      'resumeDutyTypeId': instance.resumeDutyTypeId,
      'weekendDays': instance.weekendDays,
      'publicHolidays': instance.publicHolidays,
      'resumedDaysAmount': instance.resumedDaysAmount,
      'resumedDaysDeductionAmount': instance.resumedDaysDeductionAmount,
      'weekendAmount': instance.weekendAmount,
      'weekendDeductionAmount': instance.weekendDeductionAmount,
      'publicHolidayAmount': instance.publicHolidayAmount,
      'publicHolidayDeductionAmount': instance.publicHolidayDeductionAmount,
      'basicSalaryAmount': instance.basicSalaryAmount,
      'basicSalaryDeductionAmount': instance.basicSalaryDeductionAmount,
      'isSettled': instance.isSettled,
      'settlementDate': instance.settlementDate,
      'settlementRemarks': instance.settlementRemarks,
      'referenceType': instance.referenceType,
      'referenceId': instance.referenceId,
      'remarks': instance.remarks,
      'isDeleted': instance.isDeleted,
    };
