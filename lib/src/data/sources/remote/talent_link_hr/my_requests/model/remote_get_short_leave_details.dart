import 'package:json_annotation/json_annotation.dart';

import 'package:talent_link/src/domain/entities/my_requests/employee.dart';
import 'package:talent_link/src/domain/entities/my_requests/get_short_leave_details/employer_short_leave_attachments.dart';
import 'package:talent_link/src/domain/entities/my_requests/get_short_leave_details/get_short_level_details.dart';

part 'remote_get_short_leave_details.g.dart';

@JsonSerializable()
class RemoteGetShortLeaveDetails {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "companyId")
  final int? companyId;
  @JsonKey(name: "shortLeaveTypeName")
  final String? shortLeaveTypeName;
  @JsonKey(name: "employeeId")
  final int? employeeId;
  @JsonKey(name: "shortLeaveTypeId")
  final int? shortLeaveTypeId;
  @JsonKey(name: "shortLeaveDate")
  final String? shortLeaveDate;
  @JsonKey(name: "startTime")
  final String? startTime;
  @JsonKey(name: "endTime")
  final String? endTime;
  @JsonKey(name: "noOfMinutes")
  final int? noOfMinutes;
  @JsonKey(name: "reason")
  final String? reason;
  @JsonKey(name: "referenceName")
  final String? referenceName;
  @JsonKey(name: "referenceContactNo")
  final String? referenceContactNo;
  @JsonKey(name: "currentBalance")
  final int? currentBalance;
  @JsonKey(name: "remainingBalance")
  final int? remainingBalance;
  @JsonKey(name: "remarks")
  final String? remarks;
  @JsonKey(name: "transactionStatusId")
  final int? transactionStatusId;
  @JsonKey(name: "basicSalaryAmount")
  final int? basicSalaryAmount;
  @JsonKey(name: "allowancesAmount")
  final int? allowancesAmount;
  @JsonKey(name: "transactionStatusName")
  final String? transactionStatusName;
  @JsonKey(name: "employee")
  final RemoteEmployee? employee;
  @JsonKey(name: "employeeShortLeaveAttachments")
  final List<RemoteEmployeeShortLeaveAttachments>?
      employeeShortLeaveAttachments;

  const RemoteGetShortLeaveDetails({
    this.id,
    this.companyId,
    this.employeeId,
    this.shortLeaveTypeId,
    this.shortLeaveDate,
    this.startTime,
    this.endTime,
    this.noOfMinutes,
    this.reason,
    this.referenceName,
    this.referenceContactNo,
    this.currentBalance,
    this.remainingBalance,
    this.remarks,
    this.transactionStatusId,
    this.basicSalaryAmount,
    this.allowancesAmount,
    this.transactionStatusName,
    this.employee,
    this.employeeShortLeaveAttachments,
    this.shortLeaveTypeName,
  });

  factory RemoteGetShortLeaveDetails.fromJson(Map<String, dynamic> json) =>
      _$RemoteGetShortLeaveDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteGetShortLeaveDetailsToJson(this);
}

@JsonSerializable()
class RemoteEmployee {
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

  const RemoteEmployee(
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

  factory RemoteEmployee.fromJson(Map<String, dynamic> json) =>
      _$RemoteEmployeeFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteEmployeeToJson(this);
}

@JsonSerializable()
class RemoteEmployeeShortLeaveAttachments {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "employeeShortLeaveId")
  final int? employeeShortLeaveId;
  @JsonKey(name: "filePath")
  final String? filePath;
  @JsonKey(name: "fileName")
  final String? fileName;
  @JsonKey(name: "isDeleted")
  final bool? isDeleted;

  const RemoteEmployeeShortLeaveAttachments({
    this.id,
    this.employeeShortLeaveId,
    this.filePath,
    this.fileName,
    this.isDeleted,
  });

  factory RemoteEmployeeShortLeaveAttachments.fromJson(
          Map<String, dynamic> json) =>
      _$RemoteEmployeeShortLeaveAttachmentsFromJson(json);

  Map<String, dynamic> toJson() =>
      _$RemoteEmployeeShortLeaveAttachmentsToJson(this);
}

extension RemoteEmployeeExtension on RemoteEmployee {
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

extension RemoteEmployeeShortLeaveAttachmentsExtension
    on RemoteEmployeeShortLeaveAttachments {
  EmployerShortLeaveAttachment mapToDomain() {
    return EmployerShortLeaveAttachment(
      id: id ?? 0,
      employeeShortLeaveId: employeeShortLeaveId ?? 0,
      filePath: filePath ?? "",
      fileName: fileName ?? "",
      isDeleted: isDeleted ?? false,
    );
  }
}

extension RemoteEmployeeShortLeaveAttachmentsListExtension
    on List<RemoteEmployeeShortLeaveAttachments>? {
  List<EmployerShortLeaveAttachment>
      mapEmployerShortLeaveAttachmentListToDomain() {
    return this?.map((e) => e.mapToDomain()).toList() ?? [];
  }
}

extension RemoteGetShortLeaveDetailsExtension on RemoteGetShortLeaveDetails {
  GetShortLevelDetails mapToDomain() {
    return GetShortLevelDetails(
        id: id ?? 0,
        companyId: companyId ?? 0,
        employeeId: employeeId ?? 0,
        shortLeaveTypeId: shortLeaveTypeId ?? 0,
        shortLeaveDate: shortLeaveDate ?? "",
        startTime: startTime ?? "",
        endTime: endTime ?? "",
        noOfMinutes: noOfMinutes ?? 0,
        reason: reason ?? "",
        referenceName: referenceName ?? "",
        referenceContactNo: referenceContactNo ?? "",
        currentBalance: currentBalance ?? 0,
        remainingBalance: remainingBalance ?? 0,
        remarks: remarks ?? "",
        transactionStatusId: transactionStatusId ?? 0,
        basicSalaryAmount: basicSalaryAmount ?? 0,
        allowancesAmount: allowancesAmount ?? 0,
        transactionStatusName: transactionStatusName ?? "",
        employee: employee!.mapToDomain(),
        employeeShortLeaveAttachments: employeeShortLeaveAttachments
            .mapEmployerShortLeaveAttachmentListToDomain(),
        shortLeaveTypeName: shortLeaveTypeName ?? "");
  }
}
