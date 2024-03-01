import 'package:json_annotation/json_annotation.dart';

import 'package:talent_link/src/domain/entities/my_requests/employee.dart';
import 'package:talent_link/src/domain/entities/my_requests/get_indemnity_encashment_details/employee_indemnity_encashment_attachments.dart';
import 'package:talent_link/src/domain/entities/my_requests/get_indemnity_encashment_details/get_indemnity_encashment_details.dart';

part 'remote_get_indemnity_encashment_details.g.dart';

@JsonSerializable()
class RemoteGetIndemnityEncashmentDetails {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "companyId")
  final int? companyId;
  @JsonKey(name: "employeeId")
  final int? employeeId;
  @JsonKey(name: "indemnityEncashmentId")
  final int? indemnityEncashmentId;
  @JsonKey(name: "isByPayroll")
  final bool? isByPayroll;
  @JsonKey(name: "paymentMethodId")
  final int? paymentMethodId;
  @JsonKey(name: "salaryMonth")
  final int? salaryMonth;
  @JsonKey(name: "salaryYear")
  final int? salaryYear;
  @JsonKey(name: "requestedDate")
  final String? requestedDate;
  @JsonKey(name: "requestedDays")
  final int? requestedDays;
  @JsonKey(name: "totalAmount")
  final int? totalAmount;
  @JsonKey(name: "indemnityServiceDays")
  final int? indemnityServiceDays;
  @JsonKey(name: "indemnityDays")
  final int? indemnityDays;
  @JsonKey(name: "indemnityAmount")
  final int? indemnityAmount;
  @JsonKey(name: "basicSalaryAmount")
  final int? basicSalaryAmount;
  @JsonKey(name: "allowancesAmount")
  final int? allowancesAmount;
  @JsonKey(name: "isSettled")
  final bool? isSettled;
  @JsonKey(name: "settlementDate")
  final String? settlementDate;
  @JsonKey(name: "settlementRemarks")
  final String? settlementRemarks;
  @JsonKey(name: "remarks")
  final String? remarks;
  @JsonKey(name: "transactionStatusId")
  final int? transactionStatusId;
  @JsonKey(name: "transactionStatusName")
  final String? transactionStatusName;
  @JsonKey(name: "employee")
  final EmployeeDto? employee;
  @JsonKey(name: "employeeIndemnityEncashmentAttachments")
  final List<RemoteEmployeeIndemnityEncashmentAttachments>?
      employeeIndemnityEncashmentAttachments;
  @JsonKey(name: "indemnityEncashmentName")
  final String? indemnityEncashmentName;
  const RemoteGetIndemnityEncashmentDetails({
    this.id,
    this.companyId,
    this.employeeId,
    this.indemnityEncashmentId,
    this.isByPayroll,
    this.paymentMethodId,
    this.salaryMonth,
    this.salaryYear,
    this.requestedDate,
    this.requestedDays,
    this.totalAmount,
    this.indemnityServiceDays,
    this.indemnityDays,
    this.indemnityAmount,
    this.basicSalaryAmount,
    this.allowancesAmount,
    this.isSettled,
    this.settlementDate,
    this.settlementRemarks,
    this.remarks,
    this.transactionStatusId,
    this.transactionStatusName,
    this.employee,
    this.employeeIndemnityEncashmentAttachments,
    this.indemnityEncashmentName,
  });

  factory RemoteGetIndemnityEncashmentDetails.fromJson(
          Map<String, dynamic> json) =>
      _$RemoteGetIndemnityEncashmentDetailsFromJson(json);

  Map<String, dynamic> toJson() =>
      _$RemoteGetIndemnityEncashmentDetailsToJson(this);
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
class RemoteEmployeeIndemnityEncashmentAttachments {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "employeeIndemnityEncashmentId")
  final int? employeeIndemnityEncashmentId;
  @JsonKey(name: "filePath")
  final String? filePath;
  @JsonKey(name: "fileName")
  final String? fileName;
  @JsonKey(name: "isDeleted")
  final bool? isDeleted;

  const RemoteEmployeeIndemnityEncashmentAttachments({
    this.id,
    this.employeeIndemnityEncashmentId,
    this.filePath,
    this.fileName,
    this.isDeleted,
  });

  factory RemoteEmployeeIndemnityEncashmentAttachments.fromJson(
          Map<String, dynamic> json) =>
      _$RemoteEmployeeIndemnityEncashmentAttachmentsFromJson(json);

  Map<String, dynamic> toJson() =>
      _$RemoteEmployeeIndemnityEncashmentAttachmentsToJson(this);
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

extension RemoteEmployeeIndemnityEncashmentAttachmentsExtension
    on RemoteEmployeeIndemnityEncashmentAttachments {
  EmployeeIndemnityEncashmentAttachments
      mapToEmployeeIndemnityEncashmentAttachmentsDomain() {
    return EmployeeIndemnityEncashmentAttachments(
      id: id ?? 0,
      employeeIndemnityEncashmentId: employeeIndemnityEncashmentId ?? 0,
      filePath: filePath ?? "",
      fileName: fileName ?? "",
      isDeleted: isDeleted ?? false,
    );
  }
}

extension RemoteEmployeeIndemnityEncashmentAttachmentsListExtension
    on List<RemoteEmployeeIndemnityEncashmentAttachments>? {
  List<EmployeeIndemnityEncashmentAttachments>
      mapEmployeeIndemnityEncashmentAttachmentsFListToDomain() {
    return (this
            ?.map((e) => e.mapToEmployeeIndemnityEncashmentAttachmentsDomain())
            .toList() ??
        []);
  }
}

extension RemoteGetIndemnityEncashmentDetailsExtension
    on RemoteGetIndemnityEncashmentDetails {
  GetIndemnityEncashmentDetails mapToGetIndemnityEncashmentDetailsDomain() {
    return GetIndemnityEncashmentDetails(
      id: id ?? 0,
      companyId: companyId ?? 0,
      employeeId: employeeId ?? 0,
      indemnityEncashmentId: indemnityEncashmentId ?? 0,
      isByPayroll: isByPayroll ?? false,
      paymentMethodId: paymentMethodId ?? 0,
      salaryMonth: salaryMonth ?? 0,
      salaryYear: salaryYear ?? 0,
      requestedDate: requestedDate ?? "",
      requestedDays: requestedDays ?? 0,
      totalAmount: totalAmount ?? 0,
      indemnityServiceDays: indemnityServiceDays ?? 0,
      indemnityDays: indemnityDays ?? 0,
      indemnityAmount: indemnityAmount ?? 0,
      basicSalaryAmount: basicSalaryAmount ?? 0,
      allowancesAmount: allowancesAmount ?? 0,
      indemnityEncashmentName: indemnityEncashmentName??"",
      isSettled: isSettled ?? false,
      settlementDate: settlementDate ?? "",
      settlementRemarks: settlementRemarks ?? "",
      remarks: remarks ?? "",
      transactionStatusId: transactionStatusId ?? 0,
      transactionStatusName: transactionStatusName ?? "",
      employee: employee?.mapToDomain(),
      employeeIndemnityEncashmentAttachments:
          employeeIndemnityEncashmentAttachments
              .mapEmployeeIndemnityEncashmentAttachmentsFListToDomain(),
    );
  }
}
