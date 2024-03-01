import 'package:json_annotation/json_annotation.dart';

import 'package:talent_link/src/domain/entities/my_requests/employee.dart';
import 'package:talent_link/src/domain/entities/my_requests/get_leave_details.dart';

part 'remote_get_leave_details.g.dart';

@JsonSerializable()
class RemoteGetLeaveDetails {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "companyId")
  final int? companyId;
  @JsonKey(name: "employeeId")
  final int? employeeId;
  @JsonKey(name: "leaveTypeId")
  final int? leaveTypeId;
  @JsonKey(name: "leaveStartDate")
  final String? leaveStartDate;
  @JsonKey(name: "leaveEndDate")
  final String? leaveEndDate;
  @JsonKey(name: "expectedResumeDuty")
  final String? expectedResumeDuty;
  @JsonKey(name: "isByPayroll")
  final bool? isByPayroll;
  @JsonKey(name: "paymentMethodId")
  final int? paymentMethodId;
  @JsonKey(name: "remarks")
  final String? remarks;
  @JsonKey(name: "leaveReason")
  final String? leaveReason;
  @JsonKey(name: "alternativeEmployeeId")
  final int? alternativeEmployeeId;
  @JsonKey(name: "emergencyContactNo")
  final String? emergencyContactNo;
  @JsonKey(name: "addressDuringLeave")
  final String? addressDuringLeave;
  @JsonKey(name: "isExtendedLeave")
  final bool? isExtendedLeave;
  @JsonKey(name: "extendedEmployeeLeaveId")
  final int? extendedEmployeeLeaveId;
  @JsonKey(name: "totalAmount")
  final int? totalAmount;
  @JsonKey(name: "isByCurrentBalance")
  final bool? isByCurrentBalance;
  @JsonKey(name: "currentBalance")
  final double? currentBalance;
  @JsonKey(name: "yearlyBalance")
  final double? yearlyBalance;
  @JsonKey(name: "remainingBalance")
  final double? remainingBalance;
  @JsonKey(name: "basicSalaryAmount")
  final double? basicSalaryAmount;
  @JsonKey(name: "allowancesAmount")
  final double? allowancesAmount;
  @JsonKey(name: "leaveDays")
  final int? leaveDays;
  @JsonKey(name: "transactionStatusId")
  final int? transactionStatusId;
  @JsonKey(name: "transactionStatusName")
  final String? transactionStatusName;
  @JsonKey(name: "wfId")
  final int? wfId;
  @JsonKey(name: "employee")
  final EmployeeDto? employeeDto;
  @JsonKey(name: "isAllowYearlyBalance")
  final bool? isAllowYearlyBalance;
  @JsonKey(name: "leaveTypeName")
  final String? leaveTypeName;
  RemoteGetLeaveDetails({
    this.id,
    this.companyId,
    this.employeeId,
    this.leaveTypeId,
    this.leaveStartDate,
    this.leaveEndDate,
    this.expectedResumeDuty,
    this.isByPayroll,
    this.paymentMethodId,
    this.remarks,
    this.leaveReason,
    this.alternativeEmployeeId,
    this.emergencyContactNo,
    this.addressDuringLeave,
    this.isExtendedLeave,
    this.extendedEmployeeLeaveId,
    this.totalAmount,
    this.isByCurrentBalance,
    this.currentBalance,
    this.yearlyBalance,
    this.remainingBalance,
    this.basicSalaryAmount,
    this.allowancesAmount,
    this.leaveDays,
    this.transactionStatusId,
    this.transactionStatusName,
    this.wfId,
    this.employeeDto,
    this.isAllowYearlyBalance,
    this.leaveTypeName,
  });

  factory RemoteGetLeaveDetails.fromJson(Map<String, dynamic> json) =>
      _$RemoteGetLeaveDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteGetLeaveDetailsToJson(this);
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
  @JsonKey(name : "positionName")
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
    this.employeeStatusId,
    this.positionName
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

extension RemoteGetLeaveDetailsExtension on RemoteGetLeaveDetails {
  GetLeaveDetails mapToDomain() {
    return GetLeaveDetails(
      id: id ?? 0,
      companyId: companyId ?? 0,
      employeeId: employeeId ?? 0,
      leaveTypeName: leaveTypeName??"",
      leaveTypeId: leaveTypeId ?? 0,
      leaveStartDate: leaveStartDate ?? "",
      leaveEndDate: leaveEndDate ?? "",
      expectedResumeDuty: expectedResumeDuty ?? "",
      isByPayroll: isByPayroll ?? false,
      paymentMethodId: paymentMethodId ?? 0,
      remarks: remarks ?? "",
      leaveReason: leaveReason ?? "",
      alternativeEmployeeId: alternativeEmployeeId ?? 0,
      emergencyContactNo: emergencyContactNo ?? "",
      addressDuringLeave: addressDuringLeave ?? "",
      isExtendedLeave: isExtendedLeave ?? false,
      extendedEmployeeLeaveId: extendedEmployeeLeaveId ?? 0,
      totalAmount: totalAmount ?? 0,
      isByCurrentBalance: isByCurrentBalance ?? false,
      currentBalance: currentBalance ?? 0,
      yearlyBalance: yearlyBalance ?? 0,
      remainingBalance: remainingBalance ?? 0,
      basicSalaryAmount: basicSalaryAmount ?? 0,
      allowancesAmount: allowancesAmount ?? 0,
      leaveDays: leaveDays ?? 0,
      transactionStatusId: transactionStatusId ?? 0,
      transactionStatusName: transactionStatusName ?? "",
      wfId: wfId ?? 0,
      employee: employeeDto!.mapToDomain(),
      isAllowYearlyBalance: isAllowYearlyBalance ?? false,
    );
  }
}
