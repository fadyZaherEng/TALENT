part of 'my_team_attendance_bloc.dart';

@immutable
abstract class MyTeamAttendanceState extends Equatable {
  @override
  List<Object?> get props => [identityHashCode(this)];
}

class MyTeamAttendanceInitialState extends MyTeamAttendanceState {}

class MyTeamAttendanceSkeletonState extends MyTeamAttendanceState {}

class MyTeamAttendanceBackState extends MyTeamAttendanceState {}

class GetMyTeamAttendanceSuccessState extends MyTeamAttendanceState {
  final List<MyTeamAttendance> myTeamAttendance;
  final int companyId;
  final int employeeId;

  GetMyTeamAttendanceSuccessState({
    required this.myTeamAttendance,
    required this.companyId,
    required this.employeeId,
  });
}

class GetMyTeamAttendanceErrorState extends MyTeamAttendanceState {
  final String errorMessage;

  GetMyTeamAttendanceErrorState({
    required this.errorMessage,
  });
}

class GetMyTeamAttendanceStatisticsSuccessState extends MyTeamAttendanceState {
  final MyTeamAttendanceStatistics myTeamAttendanceStatistics;

  GetMyTeamAttendanceStatisticsSuccessState({
    required this.myTeamAttendanceStatistics,
  });
}

class GetMyTeamAttendanceStatisticsErrorState extends MyTeamAttendanceState {
  final String errorMessage;

  GetMyTeamAttendanceStatisticsErrorState({
    required this.errorMessage,
  });
}

class OpenMyTeamAttendanceFilterState extends MyTeamAttendanceState {}

class GetMyTeamAttendanceFilterSuccessState extends MyTeamAttendanceState {
  final MyTeamAttendanceFilter myTeamAttendanceFilter;

  final int filterEmployeeId;

  final int filterCompanyId;

  GetMyTeamAttendanceFilterSuccessState({
    required this.myTeamAttendanceFilter,
    required this.filterEmployeeId,
    required this.filterCompanyId,
  });
}

class MyTeamAttendanceApplyFilterState extends MyTeamAttendanceState {
  final MyTeamAttendanceFilter myTeamAttendanceFilter;

  MyTeamAttendanceApplyFilterState({
    required this.myTeamAttendanceFilter,
  });
}

class GetMyTeamAttendanceFilterErrorState extends MyTeamAttendanceState {
  final String errorMessage;

  GetMyTeamAttendanceFilterErrorState({required this.errorMessage});
}

class GetCompaniesAndEmployeesSuccessState extends MyTeamAttendanceState {
  final MyTeamAttendanceFilter myTeamAttendanceFilter;

  GetCompaniesAndEmployeesSuccessState({
    required this.myTeamAttendanceFilter,
  });
}

class UpdateDateState extends MyTeamAttendanceState {
  final MyTeamAttendanceFilter myTeamAttendanceFilter;

  UpdateDateState({required this.myTeamAttendanceFilter});
}

class GetLanguageState extends MyTeamAttendanceState {
  final bool isEnglish;

  GetLanguageState({
    required this.isEnglish,
  });
}


