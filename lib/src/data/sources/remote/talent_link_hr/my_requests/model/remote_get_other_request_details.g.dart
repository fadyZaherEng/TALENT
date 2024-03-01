// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_get_other_request_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteGetOtherRequestDetails _$RemoteGetOtherRequestDetailsFromJson(
        Map<String, dynamic> json) =>
    RemoteGetOtherRequestDetails(
      id: json['id'] as int?,
      companyId: json['companyId'] as int?,
      companyName: json['companyName'] as String?,
      employeeId: json['employeeId'] as int?,
      employeeName: json['employeeName'] as String?,
      otherRequestId: json['otherRequestId'] as int?,
      otherRequestName: json['otherRequestName'] as String?,
      requestedDate: json['requestedDate'] as String?,
      requestNote: json['requestNote'] as String?,
      transactionStatusId: json['transactionStatusId'] as int?,
      transactionStatusName: json['transactionStatusName'] as String?,
      transactionStatusCode: json['transactionStatusCode'] as String?,
      remarks: json['remarks'] as String?,
      workFlowId: json['workFlowId'] as int?,
      workFlowName: json['workFlowName'] as String?,
      filePath: json['filePath'] as String?,
      fileName: json['fileName'] as String?,
      fileSource: json['fileSource'] as String?,
      isEnabled: json['isEnabled'] as bool?,
      employeeOtherRequestAttachments:
          (json['employeeOtherRequestAttachments'] as List<dynamic>?)
              ?.map((e) => RemoteEmployeeOtherRequestAttachments.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      employeeOtherRequestWF: (json['employeeOtherRequestWF'] as List<dynamic>?)
          ?.map((e) =>
              RemoteEmployeeOtherRequestWF.fromJson(e as Map<String, dynamic>))
          .toList(),
      employee: json['employee'] == null
          ? null
          : EmployeeDto.fromJson(json['employee'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RemoteGetOtherRequestDetailsToJson(
        RemoteGetOtherRequestDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'companyId': instance.companyId,
      'companyName': instance.companyName,
      'employeeId': instance.employeeId,
      'employeeName': instance.employeeName,
      'otherRequestId': instance.otherRequestId,
      'otherRequestName': instance.otherRequestName,
      'requestedDate': instance.requestedDate,
      'requestNote': instance.requestNote,
      'transactionStatusId': instance.transactionStatusId,
      'transactionStatusName': instance.transactionStatusName,
      'transactionStatusCode': instance.transactionStatusCode,
      'remarks': instance.remarks,
      'workFlowId': instance.workFlowId,
      'workFlowName': instance.workFlowName,
      'filePath': instance.filePath,
      'fileName': instance.fileName,
      'fileSource': instance.fileSource,
      'isEnabled': instance.isEnabled,
      'employeeOtherRequestAttachments':
          instance.employeeOtherRequestAttachments,
      'employeeOtherRequestWF': instance.employeeOtherRequestWF,
      'employee': instance.employee,
    };

RemoteEmployeeOtherRequestAttachments
    _$RemoteEmployeeOtherRequestAttachmentsFromJson(
            Map<String, dynamic> json) =>
        RemoteEmployeeOtherRequestAttachments(
          id: json['id'] as int?,
          employeeOtherRequestId: json['employeeOtherRequestId'] as int?,
          filePath: json['filePath'] as String?,
          fileName: json['fileName'] as String?,
          isDeleted: json['isDeleted'] as bool?,
        );

Map<String, dynamic> _$RemoteEmployeeOtherRequestAttachmentsToJson(
        RemoteEmployeeOtherRequestAttachments instance) =>
    <String, dynamic>{
      'id': instance.id,
      'employeeOtherRequestId': instance.employeeOtherRequestId,
      'filePath': instance.filePath,
      'fileName': instance.fileName,
      'isDeleted': instance.isDeleted,
    };

RemoteEmployeeOtherRequestWF _$RemoteEmployeeOtherRequestWFFromJson(
        Map<String, dynamic> json) =>
    RemoteEmployeeOtherRequestWF(
      id: json['id'] as int?,
      employeeOtherRequestId: json['employeeOtherRequestId'] as int?,
      levelNo: json['levelNo'] as int?,
      actionUserId: json['actionUserId'] as int?,
      wfStatusId: json['wfStatusId'] as int?,
      remarks: json['remarks'] as String?,
      actionDate: json['actionDate'] as String?,
      isDeleted: json['isDeleted'] as bool?,
    );

Map<String, dynamic> _$RemoteEmployeeOtherRequestWFToJson(
        RemoteEmployeeOtherRequestWF instance) =>
    <String, dynamic>{
      'id': instance.id,
      'employeeOtherRequestId': instance.employeeOtherRequestId,
      'levelNo': instance.levelNo,
      'actionUserId': instance.actionUserId,
      'wfStatusId': instance.wfStatusId,
      'remarks': instance.remarks,
      'actionDate': instance.actionDate,
      'isDeleted': instance.isDeleted,
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
