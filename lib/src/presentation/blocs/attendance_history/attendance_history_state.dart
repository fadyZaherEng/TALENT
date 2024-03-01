part of 'attendance_history_bloc.dart';

@immutable
abstract class AttendanceHistoryState extends Equatable {
  @override
  List<Object?> get props => [identityHashCode(this)];
}

class AttendanceHistoryInitialState extends AttendanceHistoryState {}
class AttendanceHistorySkeletonState extends AttendanceHistoryState {}

class AttendanceHistoryBackState extends AttendanceHistoryState {}

class GetAttendanceHistorySuccessState extends AttendanceHistoryState {
  final List<AttendanceHistory> attendanceHistories;

  GetAttendanceHistorySuccessState({
    required this.attendanceHistories,
  });
}

class GetAttendanceHistoryErrorState extends AttendanceHistoryState {
  final String errorMessage;

  GetAttendanceHistoryErrorState({required this.errorMessage});
}
