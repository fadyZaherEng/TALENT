// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_get_loan_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteGetLoanDetails _$RemoteGetLoanDetailsFromJson(
        Map<String, dynamic> json) =>
    RemoteGetLoanDetails(
      id: json['id'] as int?,
      companyId: json['companyId'] as int?,
      employeeId: json['employeeId'] as int?,
      loanTypeId: json['loanTypeId'] as int?,
      loanRequestedDate: json['loanRequestedDate'] as String?,
      loanRequestedAmount: json['loanRequestedAmount'] as int?,
      profitRate: json['profitRate'] as int?,
      loanTotalAmount: json['loanTotalAmount'] as int?,
      paymentStartMonth: json['paymentStartMonth'] as int?,
      paymentStartYear: json['paymentStartYear'] as int?,
      isByInstallmentAmount: json['isByInstallmentAmount'] as bool?,
      installments: json['installments'] as int?,
      isByPayroll: json['isByPayroll'] as bool?,
      paymentMethodId: json['paymentMethodId'] as int?,
      salaryDeductionPercentage: json['salaryDeductionPercentage'] as int?,
      isClosed: json['isClosed'] as bool?,
      remarks: json['remarks'] as String?,
      indemnityServiceDays: json['indemnityServiceDays'] as int?,
      indemnityDays: json['indemnityDays'] as int?,
      basicSalaryAmount: json['basicSalaryAmount'] as int?,
      allowancesAmount: json['allowancesAmount'] as int?,
      transactionStatusId: json['transactionStatusId'] as int?,
      transactionStatusName: json['transactionStatusName'] as String?,
      noOfDigits: json['noOfDigits'] as int?,
      currencyCode: json['currencyCode'] as String?,
      employeeLoanAttachments: (json['employeeLoanAttachments']
              as List<dynamic>?)
          ?.map((e) =>
              RemoteEmployeeLoanAttachments.fromJson(e as Map<String, dynamic>))
          .toList(),
      employee: json['employee'] == null
          ? null
          : EmployeeDto.fromJson(json['employee'] as Map<String, dynamic>),
      loanTypeName: json['loanTypeName'] as String?,
    );

Map<String, dynamic> _$RemoteGetLoanDetailsToJson(
        RemoteGetLoanDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'companyId': instance.companyId,
      'employeeId': instance.employeeId,
      'loanTypeId': instance.loanTypeId,
      'loanRequestedDate': instance.loanRequestedDate,
      'loanRequestedAmount': instance.loanRequestedAmount,
      'profitRate': instance.profitRate,
      'loanTotalAmount': instance.loanTotalAmount,
      'paymentStartMonth': instance.paymentStartMonth,
      'paymentStartYear': instance.paymentStartYear,
      'isByInstallmentAmount': instance.isByInstallmentAmount,
      'installments': instance.installments,
      'isByPayroll': instance.isByPayroll,
      'paymentMethodId': instance.paymentMethodId,
      'salaryDeductionPercentage': instance.salaryDeductionPercentage,
      'isClosed': instance.isClosed,
      'remarks': instance.remarks,
      'indemnityServiceDays': instance.indemnityServiceDays,
      'indemnityDays': instance.indemnityDays,
      'basicSalaryAmount': instance.basicSalaryAmount,
      'allowancesAmount': instance.allowancesAmount,
      'transactionStatusId': instance.transactionStatusId,
      'transactionStatusName': instance.transactionStatusName,
      'noOfDigits': instance.noOfDigits,
      'currencyCode': instance.currencyCode,
      'employee': instance.employee,
      'employeeLoanAttachments': instance.employeeLoanAttachments,
      'loanTypeName': instance.loanTypeName,
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
      positionName: json['positionName'] as String?,
      employeeStatusId: json['employeeStatusId'] as int?,
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

RemoteEmployeeLoanAttachments _$RemoteEmployeeLoanAttachmentsFromJson(
        Map<String, dynamic> json) =>
    RemoteEmployeeLoanAttachments(
      id: json['id'] as int?,
      employeeLoanId: json['employeeLoanId'] as int?,
      filePath: json['filePath'] as String?,
      fileName: json['fileName'] as String?,
      isDeleted: json['isDeleted'] as bool?,
    );

Map<String, dynamic> _$RemoteEmployeeLoanAttachmentsToJson(
        RemoteEmployeeLoanAttachments instance) =>
    <String, dynamic>{
      'id': instance.id,
      'employeeLoanId': instance.employeeLoanId,
      'filePath': instance.filePath,
      'fileName': instance.fileName,
      'isDeleted': instance.isDeleted,
    };
