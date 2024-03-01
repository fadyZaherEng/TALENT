import 'package:json_annotation/json_annotation.dart';

import 'package:talent_link/src/domain/entities/my_requests/employee.dart';
import 'package:talent_link/src/domain/entities/my_requests/other_request_details/employee_other_request_attachments.dart';
import 'package:talent_link/src/domain/entities/my_requests/other_request_details/employee_other_requests_wf.dart';
import 'package:talent_link/src/domain/entities/my_requests/other_request_details/other_request_details.dart';

part 'remote_get_other_request_details.g.dart';

@JsonSerializable()
class RemoteGetOtherRequestDetails {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "companyId")
  final int? companyId;
  @JsonKey(name: "companyName")
  final String? companyName;
  @JsonKey(name: "employeeId")
  final int? employeeId;
  @JsonKey(name: "employeeName")
  final String? employeeName;
  @JsonKey(name: "otherRequestId")
  final int? otherRequestId;
  @JsonKey(name: "otherRequestName")
  final String? otherRequestName;
  @JsonKey(name: "requestedDate")
  final String? requestedDate;
  @JsonKey(name: "requestNote")
  final String? requestNote;
  @JsonKey(name: "transactionStatusId")
  final int? transactionStatusId;
  @JsonKey(name: "transactionStatusName")
  final String? transactionStatusName;
  @JsonKey(name: "transactionStatusCode")
  final String? transactionStatusCode;
  @JsonKey(name: "remarks")
  final String? remarks;
  @JsonKey(name: "workFlowId")
  final int? workFlowId;
  @JsonKey(name: "workFlowName")
  final String? workFlowName;
  @JsonKey(name: "filePath")
  final String? filePath;
  @JsonKey(name: "fileName")
  final String? fileName;
  @JsonKey(name: "fileSource")
  final String? fileSource;
  @JsonKey(name: "isEnabled")
  final bool? isEnabled;
  @JsonKey(name: "employeeOtherRequestAttachments")
  final List<RemoteEmployeeOtherRequestAttachments>?
      employeeOtherRequestAttachments;
  @JsonKey(name: "employeeOtherRequestWF")
  final List<RemoteEmployeeOtherRequestWF>? employeeOtherRequestWF;
  @JsonKey(name: "employee")
  final EmployeeDto? employee;

  const RemoteGetOtherRequestDetails({
    this.id,
    this.companyId,
    this.companyName,
    this.employeeId,
    this.employeeName,
    this.otherRequestId,
    this.otherRequestName,
    this.requestedDate,
    this.requestNote,
    this.transactionStatusId,
    this.transactionStatusName,
    this.transactionStatusCode,
    this.remarks,
    this.workFlowId,
    this.workFlowName,
    this.filePath,
    this.fileName,
    this.fileSource,
    this.isEnabled,
    this.employeeOtherRequestAttachments,
    this.employeeOtherRequestWF,
    this.employee,
  });

  factory RemoteGetOtherRequestDetails.fromJson(Map<String, dynamic> json) =>
      _$RemoteGetOtherRequestDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteGetOtherRequestDetailsToJson(this);
}

@JsonSerializable()
class RemoteEmployeeOtherRequestAttachments {
  final int? id;
  final int? employeeOtherRequestId;
  final String? filePath;
  final String? fileName;
  final bool? isDeleted;

  const RemoteEmployeeOtherRequestAttachments({
    this.id,
    this.employeeOtherRequestId,
    this.filePath,
    this.fileName,
    this.isDeleted,
  });

  factory RemoteEmployeeOtherRequestAttachments.fromJson(
          Map<String, dynamic> json) =>
      _$RemoteEmployeeOtherRequestAttachmentsFromJson(json);

  Map<String, dynamic> toJson() =>
      _$RemoteEmployeeOtherRequestAttachmentsToJson(this);
}

@JsonSerializable()
class RemoteEmployeeOtherRequestWF {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "employeeOtherRequestId")
  final int? employeeOtherRequestId;
  @JsonKey(name: "levelNo")
  final int? levelNo;
  @JsonKey(name: "actionUserId")
  final int? actionUserId;
  @JsonKey(name: "wfStatusId")
  final int? wfStatusId;
  @JsonKey(name: "remarks")
  final String? remarks;
  @JsonKey(name: "actionDate")
  final String? actionDate;
  @JsonKey(name: "isDeleted")
  final bool? isDeleted;

  const RemoteEmployeeOtherRequestWF({
    this.id,
    this.employeeOtherRequestId,
    this.levelNo,
    this.actionUserId,
    this.wfStatusId,
    this.remarks,
    this.actionDate,
    this.isDeleted,
  });

  factory RemoteEmployeeOtherRequestWF.fromJson(Map<String, dynamic> json) =>
      _$RemoteEmployeeOtherRequestWFFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteEmployeeOtherRequestWFToJson(this);
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

extension RemoteEmployeeOtherRequestAttachmentsExtension
    on RemoteEmployeeOtherRequestAttachments {
  EmployeeOtherRequestAttachments mapToEmployeeOtherRequestAttachmentsDomain() {
    return EmployeeOtherRequestAttachments(
      id: id ?? 0,
      employeeOtherRequestId: employeeOtherRequestId ?? 0,
      filePath: filePath ?? "",
      fileName: fileName ?? "",
      isDeleted: isDeleted ?? false,
    );
  }
}

extension RemoteEmployeeOtherRequestAttachmentsListExtension
    on List<RemoteEmployeeOtherRequestAttachments>? {
  List<EmployeeOtherRequestAttachments>
      mapToEmployeeOtherRequestAttachmentsList() {
    return this
            ?.map((e) => e.mapToEmployeeOtherRequestAttachmentsDomain())
            .toList() ??
        [];
  }
}

extension RemoteEmployeeOtherRequestWFExtension
    on RemoteEmployeeOtherRequestWF {
  EmployeeOtherRequestWF mapToEmployeeOtherRequestWFDomain() {
    return EmployeeOtherRequestWF(
      id: id ?? 0,
      employeeOtherRequestId: employeeOtherRequestId ?? 0,
      levelNo: levelNo ?? 0,
      actionUserId: actionUserId ?? 0,
      wfStatusId: wfStatusId ?? 0,
      remarks: remarks ?? "",
      actionDate: actionDate ?? "",
      isDeleted: isDeleted ?? false,
    );
  }
}

extension RemoteEmployeeOtherRequestWFListExtension
    on List<RemoteEmployeeOtherRequestWF>? {
  List<EmployeeOtherRequestWF> mapToEmployeeOtherRequestWFList() {
    return this?.map((e) => e.mapToEmployeeOtherRequestWFDomain()).toList() ??
        [];
  }
}

extension RemoteGetOtherRequestDetailsExtension
    on RemoteGetOtherRequestDetails {
  GetOtherRequestDetails mapToGetOtherRequestDetails() {
    return GetOtherRequestDetails(
      id: id ?? 0,
      companyId: companyId ?? 0,
      companyName: companyName ?? "",
      employeeId: employeeId ?? 0,
      employeeName: employeeName ?? "",
      otherRequestId: otherRequestId ?? 0,
      otherRequestName: otherRequestName ?? "",
      requestedDate: requestedDate ?? "",
      requestNote: requestNote ?? "",
      transactionStatusId: transactionStatusId ?? 0,
      transactionStatusName: transactionStatusName ?? "",
      transactionStatusCode: transactionStatusCode ?? "",
      remarks: remarks ?? "",
      workFlowId: workFlowId ?? 0,
      workFlowName: workFlowName ?? "",
      filePath: filePath ?? "",
      fileName: fileName ?? "",
      fileSource: fileSource ?? "",
      isEnabled: isEnabled ?? false,
      employeeOtherRequestAttachments: employeeOtherRequestAttachments
          .mapToEmployeeOtherRequestAttachmentsList(),
      employeeOtherRequestWF:
          employeeOtherRequestWF.mapToEmployeeOtherRequestWFList(),
      employee: employee?.mapToDomain(),
    );
  }
}
