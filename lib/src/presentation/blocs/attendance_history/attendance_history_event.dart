part of 'attendance_history_bloc.dart';

@immutable
abstract class AttendanceHistoryEvent extends Equatable {
  @override
  List<Object?> get props => [identityHashCode(this)];
}

class GetAttendanceHistoryEvent extends AttendanceHistoryEvent {
  final AttendanceHistoryRequest attendanceHistoryRequest;

  GetAttendanceHistoryEvent({
    required this.attendanceHistoryRequest,
  });
}

class AttendanceHistoryBackEvent extends AttendanceHistoryEvent {}
