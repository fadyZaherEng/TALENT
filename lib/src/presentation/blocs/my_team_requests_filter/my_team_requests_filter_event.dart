part of 'my_team_requests_filter_bloc.dart';

@immutable
abstract class MyTeamRequestsFilterEvent extends Equatable {
  @override
  List<Object?> get props => [identityHashCode(this)];
}

class NavigateToCompaniesScreenEvent extends MyTeamRequestsFilterEvent {
  final List<AllowedCompanies> companies;
  final String title;

  NavigateToCompaniesScreenEvent({
    required this.companies,
    required this.title,
  });
}

class NavigateToRequestsScreenEvent extends MyTeamRequestsFilterEvent {
  final List<RequestType> requests;
  final String title;

  NavigateToRequestsScreenEvent({
    required this.requests,
    required this.title,
  });
}

class NavigateToEmployeesScreenEvent extends MyTeamRequestsFilterEvent {
  final MyTeamRequestFilter myTeamRequestFilter;
  final String title;

  NavigateToEmployeesScreenEvent({
    required this.myTeamRequestFilter,
    required this.title,
  });
}

class ValidationMyTeamRequestFilterFromRequestedDateEvent
    extends MyTeamRequestsFilterEvent {
  final String fromRequestDate;
  final String toRequestDate;

  ValidationMyTeamRequestFilterFromRequestedDateEvent({
    required this.fromRequestDate,
    required this.toRequestDate,
  });
}

class ValidationMyTeamRequestFilterToRequestedDateEvent
    extends MyTeamRequestsFilterEvent {
  final String fromRequestDate;
  final String toRequestDate;

  ValidationMyTeamRequestFilterToRequestedDateEvent({
    required this.fromRequestDate,
    required this.toRequestDate,
  });
}

class ValidationMyTeamRequestFilterFromCreatedDateEvent
    extends MyTeamRequestsFilterEvent {
  final String fromCreatedDate;
  final String toCreatedDate;

  ValidationMyTeamRequestFilterFromCreatedDateEvent({
    required this.fromCreatedDate,
    required this.toCreatedDate,
  });
}

class ValidationMyTeamRequestFilterToCreatedDateEvent
    extends MyTeamRequestsFilterEvent {
  final String fromCreatedDate;
  final String toCreatedDate;

  ValidationMyTeamRequestFilterToCreatedDateEvent({
    required this.fromCreatedDate,
    required this.toCreatedDate,
  });
}

class ApplyFilterEvent extends MyTeamRequestsFilterEvent {
  final MyTeamRequestFilter myTeamRequestFilter;
  final String fromRequestDate;
  final String toRequestDate;
  final String fromCreateDate;
  final String toCreateDate;

  ApplyFilterEvent({
    required this.myTeamRequestFilter,
    required this.fromRequestDate,
    required this.toRequestDate,
    required this.fromCreateDate,
    required this.toCreateDate,
  });
}

class SelectCompanyFromSearchScreenEvent extends MyTeamRequestsFilterEvent {
  final List<SearchableItem> searchable;
  final MyTeamRequestFilter myTeamRequestFilter;

  SelectCompanyFromSearchScreenEvent({
    required this.myTeamRequestFilter,
    required this.searchable,
  });
}

class SelectEmployeeFromSearchScreenEvent extends MyTeamRequestsFilterEvent {
  final List<SearchableItem> searchable;
  final MyTeamRequestFilter myTeamRequestFilter;

  SelectEmployeeFromSearchScreenEvent({
    required this.myTeamRequestFilter,
    required this.searchable,
  });
}

class SelectRequestFromSearchScreenEvent extends MyTeamRequestsFilterEvent {
  final List<SearchableItem> searchable;
  final MyTeamRequestFilter myTeamRequestFilter;

  SelectRequestFromSearchScreenEvent({
    required this.myTeamRequestFilter,
    required this.searchable,
  });
}

class SaveEmployeesFilterEvent extends MyTeamRequestsFilterEvent {
  final MyTeamRequestFilter myTeamRequestFilter;

  SaveEmployeesFilterEvent({
    required this.myTeamRequestFilter,
  });
}

class MyTeamRequestsFilterSelectCompanyEvent extends MyTeamRequestsFilterEvent {
  final AllowedCompanies company;
  final List<AllowedCompanies> companies;

  MyTeamRequestsFilterSelectCompanyEvent({
    required this.company,
    required this.companies,
  });
}

class MyTeamRequestsFilterUnSelectCompanyEvent
    extends MyTeamRequestsFilterEvent {
  final AllowedCompanies company;
  final List<AllowedCompanies> companies;

  MyTeamRequestsFilterUnSelectCompanyEvent({
    required this.company,
    required this.companies,
  });
}

class ResetMyTeamRequestsFilterEvent extends MyTeamRequestsFilterEvent {
  final MyTeamRequestFilter myTeamRequestFilter;

  ResetMyTeamRequestsFilterEvent({
    required this.myTeamRequestFilter,
  });
}

