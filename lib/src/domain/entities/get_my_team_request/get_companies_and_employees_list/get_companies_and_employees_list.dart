import 'package:talent_link/src/domain/entities/get_my_team_request/get_companies_and_employees_list/allow_companies.dart';
import 'package:talent_link/src/domain/entities/get_my_team_request/get_companies_and_employees_list/allow_employees.dart';

class CompaniesAndEmployeesList {
  final List<AllowedCompanies> allowedCompanies;

  final List<AllowEmployees> allowedEmployees;

  CompaniesAndEmployeesList({
    required this.allowedCompanies,
    required this.allowedEmployees,
  });
}
