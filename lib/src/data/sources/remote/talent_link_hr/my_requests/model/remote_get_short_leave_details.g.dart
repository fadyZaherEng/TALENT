// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_get_short_leave_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteGetShortLeaveDetails _$RemoteGetShortLeaveDetailsFromJson(
        Map<String, dynamic> json) =>
    RemoteGetShortLeaveDetails(
      id: json['id'] as int?,
      companyId: json['companyId'] as int?,
      employeeId: json['employeeId'] as int?,
      shortLeaveTypeId: json['shortLeaveTypeId'] as int?,
      shortLeaveDate: json['shortLeaveDate'] as String?,
      startTime: json['startTime'] as String?,
      endTime: json['endTime'] as String?,
      noOfMinutes: json['noOfMinutes'] as int?,
      reason: json['reason'] as String?,
      referenceName: json['referenceName'] as String?,
      referenceContactNo: json['referenceContactNo'] as String?,
      currentBalance: json['currentBalance'] as int?,
      remainingBalance: json['remainingBalance'] as int?,
      remarks: json['remarks'] as String?,
      transactionStatusId: json['transactionStatusId'] as int?,
      basicSalaryAmount: json['basicSalaryAmount'] as int?,
      allowancesAmount: json['allowancesAmount'] as int?,
      transactionStatusName: json['transactionStatusName'] as String?,
      employee: json['employee'] == null
          ? null
          : RemoteEmployee.fromJson(json['employee'] as Map<String, dynamic>),
      employeeShortLeaveAttachments:
          (json['employeeShortLeaveAttachments'] as List<dynamic>?)
              ?.map((e) => RemoteEmployeeShortLeaveAttachments.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      shortLeaveTypeName: json['shortLeaveTypeName'] as String?,
    );

Map<String, dynamic> _$RemoteGetShortLeaveDetailsToJson(
        RemoteGetShortLeaveDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'companyId': instance.companyId,
      'shortLeaveTypeName': instance.shortLeaveTypeName,
      'employeeId': instance.employeeId,
      'shortLeaveTypeId': instance.shortLeaveTypeId,
      'shortLeaveDate': instance.shortLeaveDate,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'noOfMinutes': instance.noOfMinutes,
      'reason': instance.reason,
      'referenceName': instance.referenceName,
      'referenceContactNo': instance.referenceContactNo,
      'currentBalance': instance.currentBalance,
      'remainingBalance': instance.remainingBalance,
      'remarks': instance.remarks,
      'transactionStatusId': instance.transactionStatusId,
      'basicSalaryAmount': instance.basicSalaryAmount,
      'allowancesAmount': instance.allowancesAmount,
      'transactionStatusName': instance.transactionStatusName,
      'employee': instance.employee,
      'employeeShortLeaveAttachments': instance.employeeShortLeaveAttachments,
    };

RemoteEmployee _$RemoteEmployeeFromJson(Map<String, dynamic> json) =>
    RemoteEmployee(
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

Map<String, dynamic> _$RemoteEmployeeToJson(RemoteEmployee instance) =>
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

RemoteEmployeeShortLeaveAttachments
    _$RemoteEmployeeShortLeaveAttachmentsFromJson(Map<String, dynamic> json) =>
        RemoteEmployeeShortLeaveAttachments(
          id: json['id'] as int?,
          employeeShortLeaveId: json['employeeShortLeaveId'] as int?,
          filePath: json['filePath'] as String?,
          fileName: json['fileName'] as String?,
          isDeleted: json['isDeleted'] as bool?,
        );

Map<String, dynamic> _$RemoteEmployeeShortLeaveAttachmentsToJson(
        RemoteEmployeeShortLeaveAttachments instance) =>
    <String, dynamic>{
      'id': instance.id,
      'employeeShortLeaveId': instance.employeeShortLeaveId,
      'filePath': instance.filePath,
      'fileName': instance.fileName,
      'isDeleted': instance.isDeleted,
    };
