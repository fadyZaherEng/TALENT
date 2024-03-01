import 'package:json_annotation/json_annotation.dart';

import 'package:talent_link/src/domain/entities/get_my_team_request/get_companies_and_employees_list/allow_companies.dart';
import 'package:talent_link/src/domain/entities/get_my_team_request/get_companies_and_employees_list/allow_employees.dart';
import 'package:talent_link/src/domain/entities/get_my_team_request/get_companies_and_employees_list/get_companies_and_employees_list.dart';

part 'remote_get_companies_and_employees_list.g.dart';

@JsonSerializable()
class RemoteGetCompaniesAndEmployeesList {
  @JsonKey(name: "allowedCompanies")
  final List<RemoteAllowedCompanies>? allowedCompanies;
  @JsonKey(name: "allowedEmployees")
  final List<RemoteAllowedEmployees>? allowedEmployees;

  const RemoteGetCompaniesAndEmployeesList({
    this.allowedCompanies,
    this.allowedEmployees,
  });

  factory RemoteGetCompaniesAndEmployeesList.fromJson(
          Map<String, dynamic> json) =>
      _$RemoteGetCompaniesAndEmployeesListFromJson(json);

  Map<String, dynamic> toJson() =>
      _$RemoteGetCompaniesAndEmployeesListToJson(this);
}

@JsonSerializable()
class RemoteAllowedCompanies {
  @JsonKey(name: "companyId")
  final int? companyId;
  @JsonKey(name: "parentId")
  final int? parentId;
  @JsonKey(name: "companyName")
  final String? companyName;

  const RemoteAllowedCompanies({
    this.companyId,
    this.parentId,
    this.companyName,
  });

  factory RemoteAllowedCompanies.fromJson(Map<String, dynamic> json) =>
      _$RemoteAllowedCompaniesFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteAllowedCompaniesToJson(this);
}

@JsonSerializable()
class RemoteAllowedEmployees {
  @JsonKey(name: "companyId")
  final int? companyId;
  @JsonKey(name: "employeeId")
  final int? employeeId;
  @JsonKey(name: "employeeName")
  final String? employeeName;

  const RemoteAllowedEmployees({
    this.companyId,
    this.employeeId,
    this.employeeName,
  });

  factory RemoteAllowedEmployees.fromJson(Map<String, dynamic> json) =>
      _$RemoteAllowedEmployeesFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteAllowedEmployeesToJson(this);
}

extension RemoteAllowCompaniesExtension on RemoteAllowedCompanies {
  AllowedCompanies mapToDomain() {
    return AllowedCompanies(
      companyId: companyId ?? 0,
      parentId: parentId ?? 0,
      companyName: companyName ?? "",
    );
  }
}

extension RemoteAllowEmployeesExtension on RemoteAllowedEmployees {
  AllowEmployees mapToDomain() {
    return AllowEmployees(
      companyId: companyId ?? 0,
      employeeId: employeeId ?? 0,
      employeeName: employeeName ?? "",
    );
  }
}

extension RemoteAllowCompaniesListExtension on List<RemoteAllowedCompanies>? {
  List<AllowedCompanies> mapAllowCompaniesListToDomain() {
    return this?.map((e) => e.mapToDomain()).toList() ?? [];
  }
}

extension RemoteAllowedEmployeesListExtension on List<RemoteAllowedEmployees>? {
  List<AllowEmployees> mapAllowEmployeesListToDomain() {
    return this?.map((e) => e.mapToDomain()).toList() ?? [];
  }
}

extension RemoteGetCompaniesAndEmployeesListExtension
    on RemoteGetCompaniesAndEmployeesList {
  CompaniesAndEmployeesList mapToDomain() {
    return CompaniesAndEmployeesList(
      allowedCompanies: allowedCompanies.mapAllowCompaniesListToDomain(),
      allowedEmployees: allowedEmployees.mapAllowEmployeesListToDomain(),
    );
  }
}
