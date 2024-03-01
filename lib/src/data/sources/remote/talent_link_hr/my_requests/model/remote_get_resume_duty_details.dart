import 'package:json_annotation/json_annotation.dart';

import 'package:talent_link/src/domain/entities/my_requests/employee.dart';
import 'package:talent_link/src/domain/entities/my_requests/get_resume_duty_details.dart';

part 'remote_get_resume_duty_details.g.dart';

@JsonSerializable()
class RemoteGetResumeDutyDetails {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "companyId")
  final int? companyId;
  @JsonKey(name: "employeeId")
  final int? employeeId;
  @JsonKey(name: "isNewJoining")
  final bool? isNewJoining;
  @JsonKey(name: "isByPayroll")
  final bool? isByPayroll;
  @JsonKey(name: "paymentMethodId")
  final int? paymentMethodId;
  @JsonKey(name: "transactionStatusId")
  final int? transactionStatusId;
  @JsonKey(name: "wfId")
  final int? wfId;
  @JsonKey(name: "remarks")
  final String? remarks;
  @JsonKey(name: "expectedResumeDutyDate")
  final String? expectedResumeDutyDate;
  @JsonKey(name: "actualResumeDutyDate")
  final String? actualResumeDutyDate;
  @JsonKey(name: "resumeDutyTypeId")
  final int? resumeDutyTypeId;
  @JsonKey(name: "basicSalaryAmount")
  final int? basicSalaryAmount;
  @JsonKey(name: "allowancesAmount")
  final int? allowancesAmount;
  @JsonKey(name: "totalAmount")
  final int? totalAmount;
  @JsonKey(name: "totalResumedDays")
  final int? totalResumedDays;
  @JsonKey(name: "noOfDigits")
  final int? noOfDigits;
  @JsonKey(name: "currencyCode")
  final String? currencyCode;
  @JsonKey(name: "transactionStatusName")
  final String? transactionStatusName;
  @JsonKey(name: "employee")
  final EmployeeDto? employeeDto;
  @JsonKey(name: "resumeDutyTypeName")
  final String? resumeDutyTypeName;
  const RemoteGetResumeDutyDetails({
    this.id,
    this.companyId,
    this.employeeId,
    this.isNewJoining,
    this.isByPayroll,
    this.paymentMethodId,
    this.transactionStatusId,
    this.wfId,
    this.remarks,
    this.expectedResumeDutyDate,
    this.actualResumeDutyDate,
    this.resumeDutyTypeId,
    this.basicSalaryAmount,
    this.allowancesAmount,
    this.totalAmount,
    this.totalResumedDays,
    this.noOfDigits,
    this.currencyCode,
    this.transactionStatusName,
    this.employeeDto,
    this.resumeDutyTypeName,
  });

  factory RemoteGetResumeDutyDetails.fromJson(Map<String, dynamic> json) =>
      _$RemoteGetResumeDutyDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteGetResumeDutyDetailsToJson(this);
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

  const EmployeeDto(
      {this.id,
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
      this.employeeStatusId,
      this.positionName});

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

extension RemoteGetResumeDutyDetailsExtension on RemoteGetResumeDutyDetails {
  GetResumeDutyDetails mapToGetResumeDutyDetailsDomain() {
    return GetResumeDutyDetails(
      id: id ?? 0,
      companyId: companyId ?? 0,
      employeeId: employeeId ?? 0,
      isNewJoining: isNewJoining ?? false,
      resumeDutyTypeName: resumeDutyTypeName ?? "",
      isByPayroll: isByPayroll ?? false,
      paymentMethodId: paymentMethodId ?? 0,
      transactionStatusId: transactionStatusId ?? 0,
      wfId: wfId ?? 0,
      remarks: remarks ?? "",
      expectedResumeDutyDate: expectedResumeDutyDate ?? "",
      actualResumeDutyDate: actualResumeDutyDate ?? "",
      resumeDutyTypeId: resumeDutyTypeId ?? 0,
      basicSalaryAmount: basicSalaryAmount ?? 0,
      allowancesAmount: allowancesAmount ?? 0 ?? 0,
      totalAmount: totalAmount ?? 0,
      totalResumedDays: totalResumedDays ?? 0,
      noOfDigits: noOfDigits ?? 0,
      currencyCode: currencyCode ?? "",
      transactionStatusName: transactionStatusName ?? "",
      employee: employeeDto?.mapToDomain(),
    );
  }
}