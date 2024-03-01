import 'package:json_annotation/json_annotation.dart';

import 'package:talent_link/src/domain/entities/my_requests/employee.dart';
import 'package:talent_link/src/domain/entities/my_requests/get_leave_encashment_details/employee_leave_encashment_wf.dart';
import 'package:talent_link/src/domain/entities/my_requests/get_leave_encashment_details/get_leave_encashment_details.dart';

part 'remote_get_leave_encashment_details.g.dart';

@JsonSerializable()
class RemoteGetLeaveEncashmentDetails {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "companyId")
  final int? companyId;
  @JsonKey(name: "employeeId")
  final int? employeeId;
  @JsonKey(name: "leaveEncashmentId")
  final int? leaveEncashmentId;
  @JsonKey(name: "encashmentLeaveTypeName")
  final String? encashmentLeaveTypeName;
  @JsonKey(name: "encashmentLeaveTypeId")
  final int? encashmentLeaveTypeId;
  @JsonKey(name: "isByPayroll")
  final bool? isByPayroll;
  @JsonKey(name: "paymentMethodId")
  final int? paymentMethodId;
  @JsonKey(name: "requestedDate")
  final String? requestedDate;
  @JsonKey(name: "requestedDays")
  final int? requestedDays;
  @JsonKey(name: "totalAmount")
  final double? totalAmount;
  @JsonKey(name: "isByCurrentBalance")
  final bool? isByCurrentBalance;
  @JsonKey(name: "currentBalance")
  final double? currentBalance;
  @JsonKey(name: "yearlyBalance")
  final int? yearlyBalance;
  @JsonKey(name: "remainingBalance")
  final double? remainingBalance;
  @JsonKey(name: "basicSalaryAmount")
  final double? basicSalaryAmount;
  @JsonKey(name: "allowancesAmount")
  final double? allowancesAmount;
  @JsonKey(name: "remarks")
  final String? remarks;
  @JsonKey(name: "transactionStatusId")
  final int? transactionStatusId;
  @JsonKey(name: "transactionStatusName")
  final String? transactionStatusName;
  @JsonKey(name: "wfId")
  final int? wfId;
  @JsonKey(name: "employee")
  final EmployeeDto? employeeDto;
  @JsonKey(name: "employeeLeaveEncashmentWF")
  final List<RemoteEmployeeLeaveEncashmentWF>? employeeLeaveEncashmentWF;
  @JsonKey(name: "isAllowYearlyBalance")
  final bool? isAllowYearlyBalance;

  const RemoteGetLeaveEncashmentDetails({
    this.id,
    this.companyId,
    this.employeeId,
    this.leaveEncashmentId,
    this.encashmentLeaveTypeId,
    this.isByPayroll,
    this.paymentMethodId,
    this.requestedDate,
    this.requestedDays,
    this.totalAmount,
    this.encashmentLeaveTypeName,
    this.isByCurrentBalance,
    this.currentBalance,
    this.yearlyBalance,
    this.remainingBalance,
    this.basicSalaryAmount,
    this.allowancesAmount,
    this.remarks,
    this.transactionStatusId,
    this.transactionStatusName,
    this.wfId,
    this.employeeDto,
    this.employeeLeaveEncashmentWF,
    this.isAllowYearlyBalance,
  });

  factory RemoteGetLeaveEncashmentDetails.fromJson(Map<String, dynamic> json) =>
      _$RemoteGetLeaveEncashmentDetailsFromJson(json);

  Map<String, dynamic> toJson() =>
      _$RemoteGetLeaveEncashmentDetailsToJson(this);
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

@JsonSerializable()
class RemoteEmployeeLeaveEncashmentWF {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "employeeLeaveEncashmentId")
  final int? employeeLeaveEncashmentId;
  @JsonKey(name: "levelNo")
  final int? levelNo;
  @JsonKey(name: "wfStatusId")
  final int? wfStatusId;
  @JsonKey(name: "actionDate")
  final String? actionDate;

  const RemoteEmployeeLeaveEncashmentWF({
    this.id,
    this.employeeLeaveEncashmentId,
    this.levelNo,
    this.wfStatusId,
    this.actionDate,
  });

  factory RemoteEmployeeLeaveEncashmentWF.fromJson(Map<String, dynamic> json) =>
      _$RemoteEmployeeLeaveEncashmentWFFromJson(json);

  Map<String, dynamic> toJson() =>
      _$RemoteEmployeeLeaveEncashmentWFToJson(this);
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

extension RemoteEmployeeLeaveEncashmentWFExtension
    on RemoteEmployeeLeaveEncashmentWF {
  EmployeeLeaveEncashmentWF mapToDomain() {
    return EmployeeLeaveEncashmentWF(
      id: id ?? 0,
      employeeLeaveEncashmentId: employeeLeaveEncashmentId ?? 0,
      levelNo: levelNo ?? 0,
      wfStatusId: wfStatusId ?? 0,
      actionDate: actionDate ?? "",
    );
  }
}

extension RemoteRemoteEmployeeLeaveEncashmentWFListExtension
    on List<RemoteEmployeeLeaveEncashmentWF>? {
  List<EmployeeLeaveEncashmentWF> mapEmployeeLeaveEncashmentWFListToDomain() {
    return this?.map((e) => e.mapToDomain()).toList() ?? [];
  }
}

extension RemoteGetLeaveEncashmentDetailsExtension
    on RemoteGetLeaveEncashmentDetails {
  GetLeaveEncashmentDetails mapToDomain() {
    return GetLeaveEncashmentDetails(
      id ?? 0,
      companyId ?? 0,
      employeeId ?? 0,
      leaveEncashmentId ?? 0,
      encashmentLeaveTypeId ?? 0,
      isByPayroll ?? false,
      paymentMethodId ?? 0,
      requestedDate ?? "",
      requestedDays ?? 0,
      totalAmount ?? 0,
      isByCurrentBalance ?? false,
      currentBalance ?? 0,
      yearlyBalance ?? 0,
      remainingBalance ?? 0,
      basicSalaryAmount ?? 0,
      allowancesAmount ?? 0,
      remarks ?? "",
      transactionStatusId ?? 0,
      transactionStatusName ?? "",
      wfId ?? 0,
      employeeDto?.mapToDomain(),
      employeeLeaveEncashmentWF.mapEmployeeLeaveEncashmentWFListToDomain(),
      isAllowYearlyBalance ?? false,
      encashmentLeaveTypeName ?? "",
    );
  }
}
