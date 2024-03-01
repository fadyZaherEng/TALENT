// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_get_half_day_leave_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteGetHalfDayLeaveDetails _$RemoteGetHalfDayLeaveDetailsFromJson(
        Map<String, dynamic> json) =>
    RemoteGetHalfDayLeaveDetails(
      id: json['id'] as int?,
      companyId: json['companyId'] as int?,
      employeeId: json['employeeId'] as int?,
      halfDayLeaveTypeId: json['halfDayLeaveTypeId'] as int?,
      halfDayLeaveDate: json['halfDayLeaveDate'] as String?,
      startTime: json['startTime'] as String?,
      endTime: json['endTime'] as String?,
      noOfMinutes: json['noOfMinutes'] as int?,
      reason: json['reason'] as String?,
      remarks: json['remarks'] as String?,
      halfDayLeaveTypeName: json['halfDayLeaveTypeName'] as String?,
      basicSalaryAmount: json['basicSalaryAmount'] as int?,
      allowancesAmount: json['allowancesAmount'],
      remainingBalance: json['remainingBalance'],
      transactionStatusId: json['transactionStatusId'] as int?,
      wfId: json['wfId'] as int?,
      filePath: json['filePath'] as String?,
      fileName: json['fileName'] as String?,
      fileSource: json['fileSource'] as String?,
      isEnabled: json['isEnabled'] as bool?,
      employeeName: json['employeeName'] as String?,
      companyName: json['companyName'] as String?,
      halfDayLeaveName: json['halfDayLeaveName'] as String?,
      transactionStatusName: json['transactionStatusName'] as String?,
      currentWFLevelName: json['currentWFLevelName'] as String?,
      transactionStatus: json['transactionStatus'] == null
          ? null
          : RemoteTransactionStatus.fromJson(
              json['transactionStatus'] as Map<String, dynamic>),
      employeeDto: json['employeeDto'] == null
          ? null
          : EmployeeDto.fromJson(json['employeeDto'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RemoteGetHalfDayLeaveDetailsToJson(
        RemoteGetHalfDayLeaveDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'companyId': instance.companyId,
      'halfDayLeaveTypeName': instance.halfDayLeaveTypeName,
      'employeeId': instance.employeeId,
      'halfDayLeaveTypeId': instance.halfDayLeaveTypeId,
      'halfDayLeaveDate': instance.halfDayLeaveDate,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'noOfMinutes': instance.noOfMinutes,
      'reason': instance.reason,
      'remarks': instance.remarks,
      'basicSalaryAmount': instance.basicSalaryAmount,
      'allowancesAmount': instance.allowancesAmount,
      'remainingBalance': instance.remainingBalance,
      'transactionStatusId': instance.transactionStatusId,
      'wfId': instance.wfId,
      'filePath': instance.filePath,
      'fileName': instance.fileName,
      'fileSource': instance.fileSource,
      'isEnabled': instance.isEnabled,
      'employeeName': instance.employeeName,
      'companyName': instance.companyName,
      'halfDayLeaveName': instance.halfDayLeaveName,
      'transactionStatusName': instance.transactionStatusName,
      'currentWFLevelName': instance.currentWFLevelName,
      'transactionStatus': instance.transactionStatus,
      'employeeDto': instance.employeeDto,
    };

RemoteTransactionStatus _$RemoteTransactionStatusFromJson(
        Map<String, dynamic> json) =>
    RemoteTransactionStatus(
      id: json['id'] as int?,
      name: json['name'] as String?,
      code: json['code'] as String?,
      createdAt: json['createdAt'] as String?,
      createdBy: json['createdBy'] as int?,
      modifiedAt: json['modifiedAt'] as String?,
      modifiedBy: json['modifiedBy'] as int?,
      isDeleted: json['isDeleted'] as bool?,
      isEnabled: json['isEnabled'] as bool?,
    );

Map<String, dynamic> _$RemoteTransactionStatusToJson(
        RemoteTransactionStatus instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'createdAt': instance.createdAt,
      'createdBy': instance.createdBy,
      'modifiedAt': instance.modifiedAt,
      'modifiedBy': instance.modifiedBy,
      'isDeleted': instance.isDeleted,
      'isEnabled': instance.isEnabled,
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
