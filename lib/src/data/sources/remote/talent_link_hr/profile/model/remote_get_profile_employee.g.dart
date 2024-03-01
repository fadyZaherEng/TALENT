// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_get_profile_employee.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteGetProfileEmployee _$RemoteGetProfileEmployeeFromJson(
        Map<String, dynamic> json) =>
    RemoteGetProfileEmployee(
      userId: json['userId'] as int?,
      username: json['username'] as String?,
      employeeId: json['employeeId'] as int?,
      employeeName: json['employeeName'] as String?,
      positionName: json['positionName'] as String?,
      email: json['email'] as String?,
      companyId: json['companyId'] as int?,
      companyName: json['companyName'] as String?,
      companyLogo: json['companyLogo'] as String?,
      contactNo: json['contactNo'] as String?,
      joiningDate: json['joiningDate'] as String?,
      fingerPrintNo: json['fingerPrintNo'] as String?,
      mobileImageFilePath: json['mobileImageFilePath'] as String?,
      userTypeId: json['userTypeId'] as int?,
      noOfDigits: json['noOfDigits'] as int?,
      basicSalary: json['basicSalary'] as int?,
      totalAllowances: json['totalAllowances'] as int?,
      grossSalary: json['grossSalary'] as int?,
      employeeNo: json['employeeNo'] as String?,
      nationalityId: json['nationalityId'] as int?,
      nationality: json['nationality'] as String?,
      birthDate: json['birthDate'] as String?,
      civilId: json['civilId'] as String?,
      levelId: json['levelId'] as int?,
      level: json['level'] as String?,
      directManagerId: json['directManagerId'] as int?,
      directManager: json['directManager'] as String?,
      residencyIssueDate: json['residencyIssueDate'] as String?,
      residencyExpiryDate: json['residencyExpiryDate'] as String?,
    );

Map<String, dynamic> _$RemoteGetProfileEmployeeToJson(
        RemoteGetProfileEmployee instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'username': instance.username,
      'employeeId': instance.employeeId,
      'employeeName': instance.employeeName,
      'positionName': instance.positionName,
      'email': instance.email,
      'companyId': instance.companyId,
      'companyName': instance.companyName,
      'companyLogo': instance.companyLogo,
      'contactNo': instance.contactNo,
      'joiningDate': instance.joiningDate,
      'fingerPrintNo': instance.fingerPrintNo,
      'mobileImageFilePath': instance.mobileImageFilePath,
      'userTypeId': instance.userTypeId,
      'noOfDigits': instance.noOfDigits,
      'basicSalary': instance.basicSalary,
      'totalAllowances': instance.totalAllowances,
      'grossSalary': instance.grossSalary,
      'employeeNo': instance.employeeNo,
      'nationalityId': instance.nationalityId,
      'nationality': instance.nationality,
      'birthDate': instance.birthDate,
      'civilId': instance.civilId,
      'levelId': instance.levelId,
      'level': instance.level,
      'directManagerId': instance.directManagerId,
      'directManager': instance.directManager,
      'residencyIssueDate': instance.residencyIssueDate,
      'residencyExpiryDate': instance.residencyExpiryDate,
    };
