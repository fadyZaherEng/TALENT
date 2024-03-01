import 'package:json_annotation/json_annotation.dart';

import 'package:talent_link/src/domain/entities/my_requests/employee.dart';
import 'package:talent_link/src/domain/entities/my_requests/half_day/half_day_details.dart';
import 'package:talent_link/src/domain/entities/my_requests/half_day/transaction_status.dart';

part 'remote_get_half_day_leave_details.g.dart';

@JsonSerializable()
class RemoteGetHalfDayLeaveDetails {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "companyId")
  final int? companyId;
  @JsonKey(name: "halfDayLeaveTypeName")
  final String? halfDayLeaveTypeName;
  @JsonKey(name: "employeeId")
  final int? employeeId;
  @JsonKey(name: "halfDayLeaveTypeId")
  final int? halfDayLeaveTypeId;
  @JsonKey(name: "halfDayLeaveDate")
  final String? halfDayLeaveDate;
  @JsonKey(name: "startTime")
  final String? startTime;
  @JsonKey(name: "endTime")
  final String? endTime;
  @JsonKey(name: "noOfMinutes")
  final int? noOfMinutes;
  @JsonKey(name: "reason")
  final String? reason;
  @JsonKey(name: "remarks")
  final String? remarks;
  @JsonKey(name: "basicSalaryAmount")
  final int? basicSalaryAmount;
  @JsonKey(name: "allowancesAmount")
  final dynamic allowancesAmount;
  @JsonKey(name: "remainingBalance")
  final dynamic remainingBalance;
  @JsonKey(name: "transactionStatusId")
  final int? transactionStatusId;
  @JsonKey(name: "wfId")
  final int? wfId;
  @JsonKey(name: "filePath")
  final String? filePath;
  @JsonKey(name: "fileName")
  final String? fileName;
  @JsonKey(name: "fileSource")
  final String? fileSource;
  @JsonKey(name: "isEnabled")
  final bool? isEnabled;
  @JsonKey(name: "employeeName")
  final String? employeeName;
  @JsonKey(name: "companyName")
  final String? companyName;
  @JsonKey(name: "halfDayLeaveName")
  final String? halfDayLeaveName;
  @JsonKey(name: "transactionStatusName")
  final String? transactionStatusName;
  @JsonKey(name: "currentWFLevelName")
  final String? currentWFLevelName;
  @JsonKey(name: "transactionStatus")
  final RemoteTransactionStatus? transactionStatus;
  @JsonKey(name: "employeeDto")
  final EmployeeDto? employeeDto;

  const RemoteGetHalfDayLeaveDetails({
    this.id,
    this.companyId,
    this.employeeId,
    this.halfDayLeaveTypeId,
    this.halfDayLeaveDate,
    this.startTime,
    this.endTime,
    this.noOfMinutes,
    this.reason,
    this.remarks,
    this.halfDayLeaveTypeName,
    this.basicSalaryAmount,
    this.allowancesAmount,
    this.remainingBalance,
    this.transactionStatusId,
    this.wfId,
    this.filePath,
    this.fileName,
    this.fileSource,
    this.isEnabled,
    this.employeeName,
    this.companyName,
    this.halfDayLeaveName,
    this.transactionStatusName,
    this.currentWFLevelName,
    this.transactionStatus,
    this.employeeDto,
  });

  factory RemoteGetHalfDayLeaveDetails.fromJson(Map<String, dynamic> json) =>
      _$RemoteGetHalfDayLeaveDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteGetHalfDayLeaveDetailsToJson(this);
}

@JsonSerializable()
class RemoteTransactionStatus {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "code")
  final String? code;
  @JsonKey(name: "createdAt")
  final String? createdAt;
  @JsonKey(name: "createdBy")
  final int? createdBy;
  @JsonKey(name: "modifiedAt")
  final String? modifiedAt;
  @JsonKey(name: "modifiedBy")
  final int? modifiedBy;
  @JsonKey(name: "isDeleted")
  final bool? isDeleted;
  @JsonKey(name: "isEnabled")
  final bool? isEnabled;

  const RemoteTransactionStatus({
    this.id,
    this.name,
    this.code,
    this.createdAt,
    this.createdBy,
    this.modifiedAt,
    this.modifiedBy,
    this.isDeleted,
    this.isEnabled,
  });

  factory RemoteTransactionStatus.fromJson(Map<String, dynamic> json) =>
      _$RemoteTransactionStatusFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteTransactionStatusToJson(this);
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

extension RemoteTransactionStatusExtension on RemoteTransactionStatus {
  TransactionStatus mapToDomain() {
    return TransactionStatus(
      id: id ?? 0,
      name: name ?? "",
      code: code ?? "",
      createdAt: createdAt ?? "",
      createdBy: createdBy ?? 0,
      modifiedAt: modifiedAt ?? "",
      modifiedBy: modifiedBy ?? 0,
      isDeleted: isDeleted ?? false,
      isEnabled: isEnabled ?? false,
    );
  }
}

extension RemoteGetHalfDayLeaveDetailsExtension
    on RemoteGetHalfDayLeaveDetails {
  GetHalfDayLeaveDetails mapToDomain() {
    return GetHalfDayLeaveDetails(
      id: id ?? 0,
      companyId: companyId ?? 0,
      employeeId: employeeId ?? 0,
      halfDayLeaveTypeId: halfDayLeaveTypeId ?? 0,
      halfDayLeaveDate: halfDayLeaveDate ?? "",
      startTime: startTime ?? "",
      endTime: endTime ?? "",
      noOfMinutes: noOfMinutes ?? 0,
      reason: reason ?? "",
      remarks: remarks ?? "",
      basicSalaryAmount: basicSalaryAmount ?? 0,
      allowancesAmount: allowancesAmount,
      remainingBalance: remainingBalance,
      transactionStatusId: transactionStatusId ?? 0,
      wfId: wfId ?? 0,
      filePath: filePath ?? "",
      fileName: fileName ?? "",
      halfDayLeaveTypeName: halfDayLeaveTypeName ?? "",
      fileSource: fileSource ?? "",
      isEnabled: isEnabled ?? false,
      employeeName: employeeName ?? "",
      companyName: companyName ?? '',
      halfDayLeaveName: halfDayLeaveName ?? "",
      transactionStatusName: transactionStatusName ?? "",
      currentWFLevelName: currentWFLevelName ?? "",
      employee: employeeDto?.mapToDomain(),
      transactionStatus: transactionStatus?.mapToDomain(),
    );
  }
}
