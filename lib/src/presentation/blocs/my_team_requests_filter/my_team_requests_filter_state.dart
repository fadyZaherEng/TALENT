part of 'my_team_requests_filter_bloc.dart';

@immutable
abstract class MyTeamRequestsFilterState extends Equatable {
  @override
  List<Object?> get props => [identityHashCode(this)];
}

class MyTeamRequestsFilterInitialState extends MyTeamRequestsFilterState {}

class NavigateToCompaniesScreenState extends MyTeamRequestsFilterState {
  final SearchableModel searchableModel;

  NavigateToCompaniesScreenState({
    required this.searchableModel,
  });
}

class NavigateToRequestsScreenState extends MyTeamRequestsFilterState {
  final SearchableModel searchableModel;

  NavigateToRequestsScreenState({
    required this.searchableModel,
  });
}

class NavigateToEmployeesScreenState extends MyTeamRequestsFilterState {
  final SearchableModel searchableModel;

  NavigateToEmployeesScreenState({
    required this.searchableModel,
  });
}

class ValidationMyTeamRequestFilterFromRequestedDateValidState
    extends MyTeamRequestsFilterState {}

class ValidationMyTeamRequestFilterFromRequestedDateNotValidState
    extends MyTeamRequestsFilterState {
  final String validationMessage;

  ValidationMyTeamRequestFilterFromRequestedDateNotValidState({
    required this.validationMessage,
  });
}

class ValidationMyTeamRequestFilterToRequestedDateValidState
    extends MyTeamRequestsFilterState {}

class ValidationMyTeamRequestFilterToRequestedDateNotValidState
    extends MyTeamRequestsFilterState {
  final String validationMessage;

  ValidationMyTeamRequestFilterToRequestedDateNotValidState({
    required this.validationMessage,
  });
}

class ValidationMyTeamRequestFilterFromCreatedDateValidState
    extends MyTeamRequestsFilterState {}

class ValidationMyTeamRequestFilterFromCreatedDateNotValidState
    extends MyTeamRequestsFilterState {
  final String validationMessage;

  ValidationMyTeamRequestFilterFromCreatedDateNotValidState({
    required this.validationMessage,
  });
}

class ValidationMyTeamRequestFilterToCreatedDateValidState
    extends MyTeamRequestsFilterState {}

class ValidationMyTeamRequestFilterToCreatedDateNotValidState
    extends MyTeamRequestsFilterState {
  final String validationMessage;

  ValidationMyTeamRequestFilterToCreatedDateNotValidState({
    required this.validationMessage,
  });
}

class ApplyFilterState extends MyTeamRequestsFilterState {
  final MyTeamRequestFilter myTeamRequestFilter;

  ApplyFilterState({required this.myTeamRequestFilter});
}

class SelectCompanyFromSearchScreenState extends MyTeamRequestsFilterState {
  final List<AllowedCompanies> companies;
  final List<AllowEmployees> employees;
  final String employeeController;
  final String companyController;

  SelectCompanyFromSearchScreenState({
    required this.companies,
    required this.companyController,
    required this.employeeController,
    required this.employees,
  });
}

class SelectEmployeeFromSearchScreenState extends MyTeamRequestsFilterState {
  final String employeeController;
  final List<AllowEmployees> employees;

  SelectEmployeeFromSearchScreenState({
    required this.employeeController,
    required this.employees,
  });
}

class SelectRequestsFromSearchScreenState extends MyTeamRequestsFilterState {
  final String requestController;
  final List<RequestType> requests;

  SelectRequestsFromSearchScreenState({
    required this.requestController,
    required this.requests,
  });
}

class MyTeamRequestsFilterSelectCompanyState extends MyTeamRequestsFilterState {
  final List<AllowedCompanies> allowedCompanies;
  final int companyId;

  MyTeamRequestsFilterSelectCompanyState(
      {required this.allowedCompanies, required this.companyId});
}

class MyTeamRequestsFilterUnSelectCompanyState
    extends MyTeamRequestsFilterState {
  final List<AllowedCompanies> allowedCompanies;
  final int companyId;

  MyTeamRequestsFilterUnSelectCompanyState({
    required this.allowedCompanies,
    required this.companyId,
  });
}

class SaveEmployeesFilterState extends MyTeamRequestsFilterState {
  final MyTeamRequestFilter myTeamRequestFilter;

  SaveEmployeesFilterState({
    required this.myTeamRequestFilter,
  });
}
class ResetMyTeamRequestsFilterState extends MyTeamRequestsFilterState {
  final MyTeamRequestFilter myTeamRequestFilter;

  ResetMyTeamRequestsFilterState({required this.myTeamRequestFilter});
}