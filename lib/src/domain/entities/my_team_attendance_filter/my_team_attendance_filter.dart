import 'package:talent_link/src/domain/entities/get_my_team_request/get_companies_and_employees_list/allow_companies.dart';
import 'package:talent_link/src/domain/entities/get_my_team_request/get_companies_and_employees_list/allow_employees.dart';

class MyTeamAttendanceFilter {
  List<AllowEmployees>? employees;
  List<AllowedCompanies>? companies;
  DateTime? fromDate;
  DateTime? toDate;
  String? fromDateErrorMessage;
  String? toDateErrorMessage;
  int? employeeId;
  int? companyId;

  MyTeamAttendanceFilter({
    this.fromDate,
    this.toDate,
    this.fromDateErrorMessage,
    this.toDateErrorMessage,
    this.employees,
    this.companies,
    this.employeeId,
    this.companyId,
  });

  MyTeamAttendanceFilter copy() {
    return MyTeamAttendanceFilter(
        employees: employees
                ?.map((e) =>
                    e.copy()) // assuming AllowedCompanies has a copy method
                .toList() ??
            [],
        companies: companies
                ?.map((e) =>
                    e.copy()) // assuming AllowedCompanies has a copy method
                .toList() ??
            [],
        fromDate: fromDate,
        toDate: toDate,
        fromDateErrorMessage: fromDateErrorMessage,
        toDateErrorMessage: toDateErrorMessage,
        employeeId: employeeId,
        companyId: companyId);
  }
}
