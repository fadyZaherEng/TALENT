// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteUser _$RemoteUserFromJson(Map<String, dynamic> json) => RemoteUser(
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
      totalAllowance: json['totalAllowances'] as int?,
      basicSalary: json['basicSalary'] as int?,
      subscriberId: json['subscriberId'] as int?,
    );

Map<String, dynamic> _$RemoteUserToJson(RemoteUser instance) =>
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
      'totalAllowances': instance.totalAllowance,
      'basicSalary': instance.basicSalary,
      'subscriberId': instance.subscriberId,
    };
