import 'package:json_annotation/json_annotation.dart';

import 'package:talent_link/src/domain/entities/my_requests/employee.dart';
import 'package:talent_link/src/domain/entities/my_requests/get_loan_details/employee_loan_attachment.dart';
import 'package:talent_link/src/domain/entities/my_requests/get_loan_details/get_loan_details.dart';

part 'remote_get_loan_details.g.dart';

@JsonSerializable()
class RemoteGetLoanDetails {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "companyId")
  final int? companyId;
  @JsonKey(name: "employeeId")
  final int? employeeId;
  @JsonKey(name: "loanTypeId")
  final int? loanTypeId;
  @JsonKey(name: "loanRequestedDate")
  final String? loanRequestedDate;
  @JsonKey(name: "loanRequestedAmount")
  final int? loanRequestedAmount;
  @JsonKey(name: "profitRate")
  final int? profitRate;
  @JsonKey(name: "loanTotalAmount")
  final int? loanTotalAmount;
  @JsonKey(name: "paymentStartMonth")
  final int? paymentStartMonth;
  @JsonKey(name: "paymentStartYear")
  final int? paymentStartYear;
  @JsonKey(name: "isByInstallmentAmount")
  final bool? isByInstallmentAmount;
  @JsonKey(name: "installments")
  final int? installments;
  @JsonKey(name: "isByPayroll")
  final bool? isByPayroll;
  @JsonKey(name: "paymentMethodId")
  final int? paymentMethodId;
  @JsonKey(name: "salaryDeductionPercentage")
  final int? salaryDeductionPercentage;
  @JsonKey(name: "isClosed")
  final bool? isClosed;
  @JsonKey(name: "remarks")
  final String? remarks;
  @JsonKey(name: "indemnityServiceDays")
  final int? indemnityServiceDays;
  @JsonKey(name: "indemnityDays")
  final int? indemnityDays;
  @JsonKey(name: "basicSalaryAmount")
  final int? basicSalaryAmount;
  @JsonKey(name: "allowancesAmount")
  final int? allowancesAmount;
  @JsonKey(name: "transactionStatusId")
  final int? transactionStatusId;
  @JsonKey(name: "transactionStatusName")
  final String? transactionStatusName;
  @JsonKey(name: "noOfDigits")
  final int? noOfDigits;
  @JsonKey(name: "currencyCode")
  final String? currencyCode;
  @JsonKey(name: "employee")
  final EmployeeDto? employee;
  @JsonKey(name: "employeeLoanAttachments")
  final List<RemoteEmployeeLoanAttachments>? employeeLoanAttachments;
  @JsonKey(name: "loanTypeName")
  final String? loanTypeName;
  const RemoteGetLoanDetails({
    this.id,
    this.companyId,
    this.employeeId,
    this.loanTypeId,
    this.loanRequestedDate,
    this.loanRequestedAmount,
    this.profitRate,
    this.loanTotalAmount,
    this.paymentStartMonth,
    this.paymentStartYear,
    this.isByInstallmentAmount,
    this.installments,
    this.isByPayroll,
    this.paymentMethodId,
    this.salaryDeductionPercentage,
    this.isClosed,
    this.remarks,
    this.indemnityServiceDays,
    this.indemnityDays,
    this.basicSalaryAmount,
    this.allowancesAmount,
    this.transactionStatusId,
    this.transactionStatusName,
    this.noOfDigits,
    this.currencyCode,
    this.employeeLoanAttachments,
    this.employee,
    this.loanTypeName,
  });

  factory RemoteGetLoanDetails.fromJson(Map<String, dynamic> json) =>
      _$RemoteGetLoanDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteGetLoanDetailsToJson(this);
}

@JsonSerializable()
class EmployeeDto {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "firstName")
  final String? firstName;
  @JsonKey(name: "secondName")
  final String? secondName;
  @JsonKey(name: "thirdName")
  final String? thirdName;
  @JsonKey(name: "basicSalary")
  final int? basicSalary;
  @JsonKey(name: "gosiSalary")
  final int? gosiSalary;
  @JsonKey(name: "positionId")
  final int? positionId;
  @JsonKey(name: "gradeId")
  final int? gradeId;
  @JsonKey(name: "levelId")
  final int? levelId;
  @JsonKey(name: "joiningDate")
  final String? joiningDate;
  @JsonKey(name: "employeeStatusId")
  final int? employeeStatusId;
  @JsonKey(name: "positionName")
  final String? positionName;

  const EmployeeDto({
    this.id,
    this.name,
    this.firstName,
    this.secondName,
    this.thirdName,
    this.basicSalary,
    this.gosiSalary,
    this.positionId,
    this.gradeId,
    this.levelId,
    this.joiningDate,
    this.positionName,
    this.employeeStatusId,
  });

  factory EmployeeDto.fromJson(Map<String, dynamic> json) =>
      _$EmployeeDtoFromJson(json);

  Map<String, dynamic> toJson() => _$EmployeeDtoToJson(this);
}

extension RemoteEmployeeDtoExtension on EmployeeDto {
  Employee mapToDomain() {
    return Employee(
      id: id ?? 0,
      name: name ?? "",
      firstName: firstName ?? "",
      secondName: secondName ?? "",
      thirdName: thirdName ?? "",
      basicSalary: basicSalary ?? 0,
      gosiSalary: gosiSalary ?? 0,
      positionName: positionName ?? "",
      gradeId: gradeId ?? 0,
      levelId: levelId ?? 0,
      joiningDate: joiningDate ?? "",
      employeeStatusId: employeeStatusId ?? 0,
    );
  }
}

@JsonSerializable()
class RemoteEmployeeLoanAttachments {
  final int? id;
  final int? employeeLoanId;
  final String? filePath;
  final String? fileName;
  final bool? isDeleted;

  const RemoteEmployeeLoanAttachments({
    this.id,
    this.employeeLoanId,
    this.filePath,
    this.fileName,
    this.isDeleted,
  });

  factory RemoteEmployeeLoanAttachments.fromJson(Map<String, dynamic> json) =>
      _$RemoteEmployeeLoanAttachmentsFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteEmployeeLoanAttachmentsToJson(this);
}

extension RemoteEmployeeLoanAttachmentsExtension
    on RemoteEmployeeLoanAttachments {
  EmployeeLoanAttachments mapToDomain() {
    return EmployeeLoanAttachments(
      id: id ?? 0,
      employeeLoanId: employeeLoanId ?? 0,
      filePath: filePath ?? "",
      fileName: fileName ?? "",
      isDeleted: isDeleted ?? false,
    );
  }
}

extension RemoteEmployeeLoanAttachmentsExtensionListExtension
    on List<RemoteEmployeeLoanAttachments>? {
  List<EmployeeLoanAttachments> mapEmployeeLoanAttachmentsListToDomain() {
    return this?.map((e) => e.mapToDomain()).toList() ?? [];
  }
}

extension RemoteGetLoanDetailsExtension on RemoteGetLoanDetails {
  GetLoanDetails mapToDomain() {
    return GetLoanDetails(
      id: id ?? 0,
      companyId: companyId ?? 0,
      loanTypeName: loanTypeName ?? "",
      employeeId: employeeId ?? 0,
      loanTypeId: loanTypeId ?? 0,
      loanRequestedDate: loanRequestedDate ?? "",
      loanRequestedAmount: loanRequestedAmount ?? 0,
      profitRate: profitRate ?? 0,
      loanTotalAmount: loanTotalAmount ?? 0,
      paymentStartMonth: paymentStartMonth ?? 0,
      paymentStartYear: paymentStartYear ?? 0,
      isByInstallmentAmount: isByInstallmentAmount ?? false,
      installments: installments ?? 0,
      isByPayroll: isByPayroll ?? false,
      paymentMethodId: paymentMethodId ?? 0,
      salaryDeductionPercentage: salaryDeductionPercentage ?? 0,
      isClosed: isClosed ?? false,
      remarks: remarks ?? "",
      indemnityServiceDays: indemnityServiceDays ?? 0,
      indemnityDays: indemnityDays ?? 0,
      basicSalaryAmount: basicSalaryAmount ?? 0,
      allowancesAmount: allowancesAmount ?? 0,
      transactionStatusId: transactionStatusId ?? 0,
      transactionStatusName: transactionStatusName ?? "",
      noOfDigits: noOfDigits ?? 0,
      currencyCode: currencyCode ?? "",
      employee: employee!.mapToDomain(),
      employeeLoanAttachments:
          employeeLoanAttachments.mapEmployeeLoanAttachmentsListToDomain(),
    );
  }
}
