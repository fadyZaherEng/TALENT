// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_get_indemnity_encashment_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteGetIndemnityEncashmentDetails
    _$RemoteGetIndemnityEncashmentDetailsFromJson(Map<String, dynamic> json) =>
        RemoteGetIndemnityEncashmentDetails(
          id: json['id'] as int?,
          companyId: json['companyId'] as int?,
          employeeId: json['employeeId'] as int?,
          indemnityEncashmentId: json['indemnityEncashmentId'] as int?,
          isByPayroll: json['isByPayroll'] as bool?,
          paymentMethodId: json['paymentMethodId'] as int?,
          salaryMonth: json['salaryMonth'] as int?,
          salaryYear: json['salaryYear'] as int?,
          requestedDate: json['requestedDate'] as String?,
          requestedDays: json['requestedDays'] as int?,
          totalAmount: json['totalAmount'] as int?,
          indemnityServiceDays: json['indemnityServiceDays'] as int?,
          indemnityDays: json['indemnityDays'] as int?,
          indemnityAmount: json['indemnityAmount'] as int?,
          basicSalaryAmount: json['basicSalaryAmount'] as int?,
          allowancesAmount: json['allowancesAmount'] as int?,
          isSettled: json['isSettled'] as bool?,
          settlementDate: json['settlementDate'] as String?,
          settlementRemarks: json['settlementRemarks'] as String?,
          remarks: json['remarks'] as String?,
          transactionStatusId: json['transactionStatusId'] as int?,
          transactionStatusName: json['transactionStatusName'] as String?,
          employee: json['employee'] == null
              ? null
              : EmployeeDto.fromJson(json['employee'] as Map<String, dynamic>),
          employeeIndemnityEncashmentAttachments:
              (json['employeeIndemnityEncashmentAttachments'] as List<dynamic>?)
                  ?.map((e) =>
                      RemoteEmployeeIndemnityEncashmentAttachments.fromJson(
                          e as Map<String, dynamic>))
                  .toList(),
          indemnityEncashmentName: json['indemnityEncashmentName'] as String?,
        );

Map<String, dynamic> _$RemoteGetIndemnityEncashmentDetailsToJson(
        RemoteGetIndemnityEncashmentDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'companyId': instance.companyId,
      'employeeId': instance.employeeId,
      'indemnityEncashmentId': instance.indemnityEncashmentId,
      'isByPayroll': instance.isByPayroll,
      'paymentMethodId': instance.paymentMethodId,
      'salaryMonth': instance.salaryMonth,
      'salaryYear': instance.salaryYear,
      'requestedDate': instance.requestedDate,
      'requestedDays': instance.requestedDays,
      'totalAmount': instance.totalAmount,
      'indemnityServiceDays': instance.indemnityServiceDays,
      'indemnityDays': instance.indemnityDays,
      'indemnityAmount': instance.indemnityAmount,
      'basicSalaryAmount': instance.basicSalaryAmount,
      'allowancesAmount': instance.allowancesAmount,
      'isSettled': instance.isSettled,
      'settlementDate': instance.settlementDate,
      'settlementRemarks': instance.settlementRemarks,
      'remarks': instance.remarks,
      'transactionStatusId': instance.transactionStatusId,
      'transactionStatusName': instance.transactionStatusName,
      'employee': instance.employee,
      'employeeIndemnityEncashmentAttachments':
          instance.employeeIndemnityEncashmentAttachments,
      'indemnityEncashmentName': instance.indemnityEncashmentName,
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

RemoteEmployeeIndemnityEncashmentAttachments
    _$RemoteEmployeeIndemnityEncashmentAttachmentsFromJson(
            Map<String, dynamic> json) =>
        RemoteEmployeeIndemnityEncashmentAttachments(
          id: json['id'] as int?,
          employeeIndemnityEncashmentId:
              json['employeeIndemnityEncashmentId'] as int?,
          filePath: json['filePath'] as String?,
          fileName: json['fileName'] as String?,
          isDeleted: json['isDeleted'] as bool?,
        );

Map<String, dynamic> _$RemoteEmployeeIndemnityEncashmentAttachmentsToJson(
        RemoteEmployeeIndemnityEncashmentAttachments instance) =>
    <String, dynamic>{
      'id': instance.id,
      'employeeIndemnityEncashmentId': instance.employeeIndemnityEncashmentId,
      'filePath': instance.filePath,
      'fileName': instance.fileName,
      'isDeleted': instance.isDeleted,
    };
