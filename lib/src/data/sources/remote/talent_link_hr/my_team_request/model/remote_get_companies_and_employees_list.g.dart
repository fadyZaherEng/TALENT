// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_get_companies_and_employees_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteGetCompaniesAndEmployeesList _$RemoteGetCompaniesAndEmployeesListFromJson(
        Map<String, dynamic> json) =>
    RemoteGetCompaniesAndEmployeesList(
      allowedCompanies: (json['allowedCompanies'] as List<dynamic>?)
          ?.map(
              (e) => RemoteAllowedCompanies.fromJson(e as Map<String, dynamic>))
          .toList(),
      allowedEmployees: (json['allowedEmployees'] as List<dynamic>?)
          ?.map(
              (e) => RemoteAllowedEmployees.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RemoteGetCompaniesAndEmployeesListToJson(
        RemoteGetCompaniesAndEmployeesList instance) =>
    <String, dynamic>{
      'allowedCompanies': instance.allowedCompanies,
      'allowedEmployees': instance.allowedEmployees,
    };

RemoteAllowedCompanies _$RemoteAllowedCompaniesFromJson(
        Map<String, dynamic> json) =>
    RemoteAllowedCompanies(
      companyId: json['companyId'] as int?,
      parentId: json['parentId'] as int?,
      companyName: json['companyName'] as String?,
    );

Map<String, dynamic> _$RemoteAllowedCompaniesToJson(
        RemoteAllowedCompanies instance) =>
    <String, dynamic>{
      'companyId': instance.companyId,
      'parentId': instance.parentId,
      'companyName': instance.companyName,
    };

RemoteAllowedEmployees _$RemoteAllowedEmployeesFromJson(
        Map<String, dynamic> json) =>
    RemoteAllowedEmployees(
      companyId: json['companyId'] as int?,
      employeeId: json['employeeId'] as int?,
      employeeName: json['employeeName'] as String?,
    );

Map<String, dynamic> _$RemoteAllowedEmployeesToJson(
        RemoteAllowedEmployees instance) =>
    <String, dynamic>{
      'companyId': instance.companyId,
      'employeeId': instance.employeeId,
      'employeeName': instance.employeeName,
    };
