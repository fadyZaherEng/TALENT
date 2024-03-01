import 'package:talent_link/src/domain/entities/get_my_team_request/get_companies_and_employees_list/allow_companies.dart';
import 'package:talent_link/src/domain/entities/get_my_team_request/get_companies_and_employees_list/allow_employees.dart';
import 'package:talent_link/src/domain/entities/request/request_type.dart';

class MyTeamRequestFilter {
  List<AllowedCompanies>? companies;
  List<AllowEmployees>? employees;
  List<RequestType>? requests;
  DateTime? fromRequestedDate;
  DateTime? toRequestedDate;
  DateTime? fromCreatedDate;
  DateTime? toCreatedDate;
  String? fromRequestedDateErrorMessage;
  String? toRequestedDateErrorMessage;
  String? fromCreatedDateErrorMessage;
  String? toCreatedDateErrorMessage;
  int? filterEmployeeId;
  int? filterCompanyId;
  int? filterRequestId;

  MyTeamRequestFilter({
    this.companies,
    this.employees,
    this.requests,
    this.fromRequestedDate,
    this.toCreatedDate,
    this.fromCreatedDate,
    this.toRequestedDate,
    this.fromCreatedDateErrorMessage,
    this.fromRequestedDateErrorMessage,
    this.toCreatedDateErrorMessage,
    this.toRequestedDateErrorMessage,
    this.filterEmployeeId,
    this.filterCompanyId,
    this.filterRequestId,
  });

  MyTeamRequestFilter copy() {
    return MyTeamRequestFilter(
        companies: companies
                ?.map((e) =>
                    e.copy()) // assuming AllowedCompanies has a copy method
                .toList() ??
            [],
        employees: employees
                ?.map((e) => AllowEmployees(
                      companyId: e.companyId,
                      employeeId: e.employeeId,
                      isSelected: e.isSelected,
                      employeeName: e.employeeName,
                    ))
                .toList() ??
            [],
        requests: requests
                ?.map((e) => RequestType(
                    id: e.id, name: e.name, isSelected: e.isSelected))
                .toList() ??
            [],
        fromRequestedDate: fromRequestedDate,
        toRequestedDate: toRequestedDate,
        fromCreatedDate: fromCreatedDate,
        toCreatedDate: toCreatedDate,
        fromRequestedDateErrorMessage: fromRequestedDateErrorMessage,
        toRequestedDateErrorMessage: toRequestedDateErrorMessage,
        fromCreatedDateErrorMessage: fromCreatedDateErrorMessage,
        toCreatedDateErrorMessage: toCreatedDateErrorMessage,
        filterCompanyId: filterCompanyId,
        filterEmployeeId: filterEmployeeId,
        filterRequestId: filterRequestId);
  }
}
