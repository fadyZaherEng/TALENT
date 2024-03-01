part of 'my_team_attendance_bloc.dart';

@immutable
abstract class MyTeamAttendanceEvent extends Equatable {
  @override
  List<Object?> get props => [identityHashCode(this)];
}

class MyTeamAttendanceBackEvent extends MyTeamAttendanceEvent {}

class GetMyTeamAttendanceEvent extends MyTeamAttendanceEvent {
  final String fromDate;
  final String toDate;
  final MyTeamAttendanceFilter myTeamAttendanceFilter;

  GetMyTeamAttendanceEvent(
      {required this.toDate,
      required this.fromDate,
      required this.myTeamAttendanceFilter});
}

class GetMyTeamAttendanceStatisticsEvent extends MyTeamAttendanceEvent {
  final String attendanceDate;
  final MyTeamAttendanceFilter myTeamAttendanceFilter;

  GetMyTeamAttendanceStatisticsEvent({
    required this.attendanceDate,
    required this.myTeamAttendanceFilter,
  });
}

class OpenMyTeamAttendanceFilterEvent extends MyTeamAttendanceEvent {}

class GetMyTeamAttendanceFilterEvent extends MyTeamAttendanceEvent {}

class ApplyFilterMyTeamAttendanceEvent extends MyTeamAttendanceEvent {
  final MyTeamAttendanceFilter myTeamAttendanceFilter;

  ApplyFilterMyTeamAttendanceEvent({
    required this.myTeamAttendanceFilter,
  });
}

class GetCompaniesAndEmployeesEvent extends MyTeamAttendanceEvent {}

class UpdateDateEvent extends MyTeamAttendanceEvent {
  final DateTime fromDate;
  final DateTime toDate;

  UpdateDateEvent({required this.toDate, required this.fromDate});
}

class GetLanguageEvent extends MyTeamAttendanceEvent {}

