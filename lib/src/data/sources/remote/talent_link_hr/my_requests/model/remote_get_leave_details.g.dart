// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_get_leave_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteGetLeaveDetails _$RemoteGetLeaveDetailsFromJson(
        Map<String, dynamic> json) =>
    RemoteGetLeaveDetails(
      id: json['id'] as int?,
      companyId: json['companyId'] as int?,
      employeeId: json['employeeId'] as int?,
      leaveTypeId: json['leaveTypeId'] as int?,
      leaveStartDate: json['leaveStartDate'] as String?,
      leaveEndDate: json['leaveEndDate'] as String?,
      expectedResumeDuty: json['expectedResumeDuty'] as String?,
      isByPayroll: json['isByPayroll'] as bool?,
      paymentMethodId: json['paymentMethodId'] as int?,
      remarks: json['remarks'] as String?,
      leaveReason: json['leaveReason'] as String?,
      alternativeEmployeeId: json['alternativeEmployeeId'] as int?,
      emergencyContactNo: json['emergencyContactNo'] as String?,
      addressDuringLeave: json['addressDuringLeave'] as String?,
      isExtendedLeave: json['isExtendedLeave'] as bool?,
      extendedEmployeeLeaveId: json['extendedEmployeeLeaveId'] as int?,
      totalAmount: json['totalAmount'] as int?,
      isByCurrentBalance: json['isByCurrentBalance'] as bool?,
      currentBalance: (json['currentBalance'] as num?)?.toDouble(),
      yearlyBalance: (json['yearlyBalance'] as num?)?.toDouble(),
      remainingBalance: (json['remainingBalance'] as num?)?.toDouble(),
      basicSalaryAmount: (json['basicSalaryAmount'] as num?)?.toDouble(),
      allowancesAmount: (json['allowancesAmount'] as num?)?.toDouble(),
      leaveDays: json['leaveDays'] as int?,
      transactionStatusId: json['transactionStatusId'] as int?,
      transactionStatusName: json['transactionStatusName'] as String?,
      wfId: json['wfId'] as int?,
      employeeDto: json['employee'] == null
          ? null
          : EmployeeDto.fromJson(json['employee'] as Map<String, dynamic>),
      isAllowYearlyBalance: json['isAllowYearlyBalance'] as bool?,
      leaveTypeName: json['leaveTypeName'] as String?,
    );

Map<String, dynamic> _$RemoteGetLeaveDetailsToJson(
        RemoteGetLeaveDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'companyId': instance.companyId,
      'employeeId': instance.employeeId,
      'leaveTypeId': instance.leaveTypeId,
      'leaveStartDate': instance.leaveStartDate,
      'leaveEndDate': instance.leaveEndDate,
      'expectedResumeDuty': instance.expectedResumeDuty,
      'isByPayroll': instance.isByPayroll,
      'paymentMethodId': instance.paymentMethodId,
      'remarks': instance.remarks,
      'leaveReason': instance.leaveReason,
      'alternativeEmployeeId': instance.alternativeEmployeeId,
      'emergencyContactNo': instance.emergencyContactNo,
      'addressDuringLeave': instance.addressDuringLeave,
      'isExtendedLeave': instance.isExtendedLeave,
      'extendedEmployeeLeaveId': instance.extendedEmployeeLeaveId,
      'totalAmount': instance.totalAmount,
      'isByCurrentBalance': instance.isByCurrentBalance,
      'currentBalance': instance.currentBalance,
      'yearlyBalance': instance.yearlyBalance,
      'remainingBalance': instance.remainingBalance,
      'basicSalaryAmount': instance.basicSalaryAmount,
      'allowancesAmount': instance.allowancesAmount,
      'leaveDays': instance.leaveDays,
      'transactionStatusId': instance.transactionStatusId,
      'transactionStatusName': instance.transactionStatusName,
      'wfId': instance.wfId,
      'employee': instance.employeeDto,
      'isAllowYearlyBalance': instance.isAllowYearlyBalance,
      'leaveTypeName': instance.leaveTypeName,
    };

EmployeeDto _$EmployeeDtoFromJson(Map<String, dynamic> json) => EmployeeDto(
      id: json['id'] as int?,
      name: json['name'] as String?,
      firstName: json['firstName'] as String?,
      secondName: json['secondName'] as String?,
      thirdName: json['thirdName'] as String?,
      basicSalary: json['basicSalary'] as int?,
      gosiSalary: json['gosiSalary'] as int?,
      positionId: json['positionId'] as int?,
      gradeId: json['gradeId'] as int?,
      levelId: json['levelId'] as int?,
      joiningDate: json['joiningDate'] as String?,
      employeeStatusId: json['employeeStatusId'] as int?,
      positionName: json['positionName'] as String?,
    );

Map<String, dynamic> _$EmployeeDtoToJson(EmployeeDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'firstName': instance.firstName,
      'secondName': instance.secondName,
      'thirdName': instance.thirdName,
      'basicSalary': instance.basicSalary,
      'gosiSalary': instance.gosiSalary,
      'positionId': instance.positionId,
      'gradeId': instance.gradeId,
      'levelId': instance.levelId,
      'joiningDate': instance.joiningDate,
      'employeeStatusId': instance.employeeStatusId,
      'positionName': instance.positionName,
    };
