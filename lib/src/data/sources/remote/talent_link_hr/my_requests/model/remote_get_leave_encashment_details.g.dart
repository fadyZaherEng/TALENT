// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_get_leave_encashment_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteGetLeaveEncashmentDetails _$RemoteGetLeaveEncashmentDetailsFromJson(
        Map<String, dynamic> json) =>
    RemoteGetLeaveEncashmentDetails(
      id: json['id'] as int?,
      companyId: json['companyId'] as int?,
      employeeId: json['employeeId'] as int?,
      leaveEncashmentId: json['leaveEncashmentId'] as int?,
      encashmentLeaveTypeId: json['encashmentLeaveTypeId'] as int?,
      isByPayroll: json['isByPayroll'] as bool?,
      paymentMethodId: json['paymentMethodId'] as int?,
      requestedDate: json['requestedDate'] as String?,
      requestedDays: json['requestedDays'] as int?,
      totalAmount: (json['totalAmount'] as num?)?.toDouble(),
      encashmentLeaveTypeName: json['encashmentLeaveTypeName'] as String?,
      isByCurrentBalance: json['isByCurrentBalance'] as bool?,
      currentBalance: (json['currentBalance'] as num?)?.toDouble(),
      yearlyBalance: json['yearlyBalance'] as int?,
      remainingBalance: (json['remainingBalance'] as num?)?.toDouble(),
      basicSalaryAmount: (json['basicSalaryAmount'] as num?)?.toDouble(),
      allowancesAmount: (json['allowancesAmount'] as num?)?.toDouble(),
      remarks: json['remarks'] as String?,
      transactionStatusId: json['transactionStatusId'] as int?,
      transactionStatusName: json['transactionStatusName'] as String?,
      wfId: json['wfId'] as int?,
      employeeDto: json['employee'] == null
          ? null
          : EmployeeDto.fromJson(json['employee'] as Map<String, dynamic>),
      employeeLeaveEncashmentWF:
          (json['employeeLeaveEncashmentWF'] as List<dynamic>?)
              ?.map((e) => RemoteEmployeeLeaveEncashmentWF.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      isAllowYearlyBalance: json['isAllowYearlyBalance'] as bool?,
    );

Map<String, dynamic> _$RemoteGetLeaveEncashmentDetailsToJson(
        RemoteGetLeaveEncashmentDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'companyId': instance.companyId,
      'employeeId': instance.employeeId,
      'leaveEncashmentId': instance.leaveEncashmentId,
      'encashmentLeaveTypeName': instance.encashmentLeaveTypeName,
      'encashmentLeaveTypeId': instance.encashmentLeaveTypeId,
      'isByPayroll': instance.isByPayroll,
      'paymentMethodId': instance.paymentMethodId,
      'requestedDate': instance.requestedDate,
      'requestedDays': instance.requestedDays,
      'totalAmount': instance.totalAmount,
      'isByCurrentBalance': instance.isByCurrentBalance,
      'currentBalance': instance.currentBalance,
      'yearlyBalance': instance.yearlyBalance,
      'remainingBalance': instance.remainingBalance,
      'basicSalaryAmount': instance.basicSalaryAmount,
      'allowancesAmount': instance.allowancesAmount,
      'remarks': instance.remarks,
      'transactionStatusId': instance.transactionStatusId,
      'transactionStatusName': instance.transactionStatusName,
      'wfId': instance.wfId,
      'employee': instance.employeeDto,
      'employeeLeaveEncashmentWF': instance.employeeLeaveEncashmentWF,
      'isAllowYearlyBalance': instance.isAllowYearlyBalance,
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

RemoteEmployeeLeaveEncashmentWF _$RemoteEmployeeLeaveEncashmentWFFromJson(
        Map<String, dynamic> json) =>
    RemoteEmployeeLeaveEncashmentWF(
      id: json['id'] as int?,
      employeeLeaveEncashmentId: json['employeeLeaveEncashmentId'] as int?,
      levelNo: json['levelNo'] as int?,
      wfStatusId: json['wfStatusId'] as int?,
      actionDate: json['actionDate'] as String?,
    );

Map<String, dynamic> _$RemoteEmployeeLeaveEncashmentWFToJson(
        RemoteEmployeeLeaveEncashmentWF instance) =>
    <String, dynamic>{
      'id': instance.id,
      'employeeLeaveEncashmentId': instance.employeeLeaveEncashmentId,
      'levelNo': instance.levelNo,
      'wfStatusId': instance.wfStatusId,
      'actionDate': instance.actionDate,
    };
