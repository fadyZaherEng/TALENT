part of 'my_team_attendance_filter_bloc.dart';

@immutable
abstract class MyTeamAttendanceFilterState extends Equatable {
  @override
  List<Object?> get props => [identityHashCode(this)];
}

class MyTeamAttendanceFilterInitialState extends MyTeamAttendanceFilterState {}

class ApplyFilterState extends MyTeamAttendanceFilterState {
  final MyTeamAttendanceFilter myTeamAttendanceFilter;

  ApplyFilterState({
    required this.myTeamAttendanceFilter,
  });
}

class OpenEmployeesScreenState extends MyTeamAttendanceFilterState {
  final SearchableModel searchableModel;

  OpenEmployeesScreenState({required this.searchableModel});
}

class OpenCompaniesScreenState extends MyTeamAttendanceFilterState {
  final SearchableModel searchableModel;

  OpenCompaniesScreenState({required this.searchableModel});
}

class ValidationMyTeamAttendanceFilterFromDateNotValidState
    extends MyTeamAttendanceFilterState {
  final String validationMessage;

  ValidationMyTeamAttendanceFilterFromDateNotValidState({
    required this.validationMessage,
  });
}

class ValidationMyTeamAttendanceFilterToDateNotValidState
    extends MyTeamAttendanceFilterState {
  final String validationMessage;

  ValidationMyTeamAttendanceFilterToDateNotValidState({
    required this.validationMessage,
  });
}

class ValidationMyTeamAttendanceFilterFromDateValidState
    extends MyTeamAttendanceFilterState {}

class ValidationMyTeamAttendanceFilterToDateValidState
    extends MyTeamAttendanceFilterState {}

class SelectCompanyFromSearchScreenState extends MyTeamAttendanceFilterState {
  final List<AllowedCompanies> companies;
  final List<AllowEmployees> employees;
  final String companyController;
  final String employeeController;

  SelectCompanyFromSearchScreenState({
    required this.companies,
    required this.employeeController,
    required this.companyController,
    required this.employees,
  });
}

class SelectEmployeeFromSearchScreenState extends MyTeamAttendanceFilterState {
  final List<AllowEmployees> employees;
  final String employeeController;

  SelectEmployeeFromSearchScreenState({
    required this.employees,
    required this.employeeController,
  });
}

class MyTeamAttendanceFilterSelectCompanyState
    extends MyTeamAttendanceFilterState {
  final List<AllowedCompanies> allowedCompanies;
  final int companyId;

  MyTeamAttendanceFilterSelectCompanyState({
    required this.allowedCompanies,
    required this.companyId,
  });
}

class MyTeamAttendanceFilterUnSelectCompanyState
    extends MyTeamAttendanceFilterState {
  final List<AllowedCompanies> allowedCompanies;
  final int companyId;

  MyTeamAttendanceFilterUnSelectCompanyState({
    required this.allowedCompanies,
    required this.companyId,
  });
}
class SaveEmployeesFilterState extends MyTeamAttendanceFilterState{
  final MyTeamAttendanceFilter myTeamAttendanceFilter;
  SaveEmployeesFilterState({required this.myTeamAttendanceFilter});
}
class ResetMyTeamAttendanceFilterState extends MyTeamAttendanceFilterState {
  final MyTeamAttendanceFilter myTeamAttendanceFilter;

  ResetMyTeamAttendanceFilterState({required this.myTeamAttendanceFilter});
}