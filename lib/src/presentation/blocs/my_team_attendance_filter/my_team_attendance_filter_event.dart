part of 'my_team_attendance_filter_bloc.dart';

@immutable
abstract class MyTeamAttendanceFilterEvent extends Equatable {
  @override
  List<Object?> get props => [identityHashCode(this)];
}

class MyTeamAttendanceValidationFromDateEvent
    extends MyTeamAttendanceFilterEvent {
  final String fromDate;
  final String toDate;

  MyTeamAttendanceValidationFromDateEvent({
    required this.fromDate,
    required this.toDate,
  });
}

class MyTeamAttendanceValidationToDateEvent
    extends MyTeamAttendanceFilterEvent {
  final String fromDate;
  final String toDate;

  MyTeamAttendanceValidationToDateEvent(
      {required this.toDate, required this.fromDate});
}

class MyTeamAttendanceApplyFilterEvent extends MyTeamAttendanceFilterEvent {
  final MyTeamAttendanceFilter myTeamAttendanceFilter;
  final String fromDate;
  final String toDate;

  MyTeamAttendanceApplyFilterEvent({
    required this.myTeamAttendanceFilter,
    required this.toDate,
    required this.fromDate,
  });
}

class OpenEmployeesScreenEvent extends MyTeamAttendanceFilterEvent {
  final MyTeamAttendanceFilter myTeamAttendanceFilter;
  final String title;

  OpenEmployeesScreenEvent({required this.myTeamAttendanceFilter, required this.title});
}

class OpenCompaniesScreenEvent extends MyTeamAttendanceFilterEvent {
  final List<AllowedCompanies> companies;
  final String title;

  OpenCompaniesScreenEvent({required this.companies, required this.title});
}

class SelectCompanyFromSearchScreenEvent extends MyTeamAttendanceFilterEvent {
  final List<SearchableItem> searchable;

  final MyTeamAttendanceFilter myTeamAttendanceFilter;

  SelectCompanyFromSearchScreenEvent(
      {required this.searchable, required this.myTeamAttendanceFilter});
}

class SelectEmployeeFromSearchScreenEvent extends MyTeamAttendanceFilterEvent {
  final List<SearchableItem> searchable;

  final MyTeamAttendanceFilter myTeamAttendanceFilter;

  SelectEmployeeFromSearchScreenEvent({
    required this.searchable,
    required this.myTeamAttendanceFilter,
  });
}

class SaveEmployeesFilterEvent extends MyTeamAttendanceFilterEvent {
  final MyTeamAttendanceFilter myTeamAttendanceFilter;

  SaveEmployeesFilterEvent({required this.myTeamAttendanceFilter});
}

class MyTeamAttendanceFilterSelectCompanyEvent
    extends MyTeamAttendanceFilterEvent {
  final AllowedCompanies company;
  final List<AllowedCompanies> companies;

  MyTeamAttendanceFilterSelectCompanyEvent({
    required this.company,
    required this.companies,
  });
}
class MyTeamAttendanceFilterUnSelectCompanyEvent
    extends MyTeamAttendanceFilterEvent {
  final AllowedCompanies company;
  final List<AllowedCompanies> companies;

  MyTeamAttendanceFilterUnSelectCompanyEvent({
    required this.company,
    required this.companies,
  });
}
class ResetMyTeamAttendanceFilterEvent extends MyTeamAttendanceFilterEvent {
  final MyTeamAttendanceFilter myTeamAttendanceFilter;

  ResetMyTeamAttendanceFilterEvent({required this.myTeamAttendanceFilter});
}
