// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_get_resume_duty_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteGetResumeDutyDetails _$RemoteGetResumeDutyDetailsFromJson(
        Map<String, dynamic> json) =>
    RemoteGetResumeDutyDetails(
      id: json['id'] as int?,
      companyId: json['companyId'] as int?,
      employeeId: json['employeeId'] as int?,
      isNewJoining: json['isNewJoining'] as bool?,
      isByPayroll: json['isByPayroll'] as bool?,
      paymentMethodId: json['paymentMethodId'] as int?,
      transactionStatusId: json['transactionStatusId'] as int?,
      wfId: json['wfId'] as int?,
      remarks: json['remarks'] as String?,
      expectedResumeDutyDate: json['expectedResumeDutyDate'] as String?,
      actualResumeDutyDate: json['actualResumeDutyDate'] as String?,
      resumeDutyTypeId: json['resumeDutyTypeId'] as int?,
      basicSalaryAmount: json['basicSalaryAmount'] as int?,
      allowancesAmount: json['allowancesAmount'] as int?,
      totalAmount: json['totalAmount'] as int?,
      totalResumedDays: json['totalResumedDays'] as int?,
      noOfDigits: json['noOfDigits'] as int?,
      currencyCode: json['currencyCode'] as String?,
      transactionStatusName: json['transactionStatusName'] as String?,
      employeeDto: json['employee'] == null
          ? null
          : EmployeeDto.fromJson(json['employee'] as Map<String, dynamic>),
      resumeDutyTypeName: json['resumeDutyTypeName'] as String?,
    );

Map<String, dynamic> _$RemoteGetResumeDutyDetailsToJson(
        RemoteGetResumeDutyDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'companyId': instance.companyId,
      'employeeId': instance.employeeId,
      'isNewJoining': instance.isNewJoining,
      'isByPayroll': instance.isByPayroll,
      'paymentMethodId': instance.paymentMethodId,
      'transactionStatusId': instance.transactionStatusId,
      'wfId': instance.wfId,
      'remarks': instance.remarks,
      'expectedResumeDutyDate': instance.expectedResumeDutyDate,
      'actualResumeDutyDate': instance.actualResumeDutyDate,
      'resumeDutyTypeId': instance.resumeDutyTypeId,
      'basicSalaryAmount': instance.basicSalaryAmount,
      'allowancesAmount': instance.allowancesAmount,
      'totalAmount': instance.totalAmount,
      'totalResumedDays': instance.totalResumedDays,
      'noOfDigits': instance.noOfDigits,
      'currencyCode': instance.currencyCode,
      'transactionStatusName': instance.transactionStatusName,
      'employee': instance.employeeDto,
      'resumeDutyTypeName': instance.resumeDutyTypeName,
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
