import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/attendance_history/request/attendance_history_request.dart';
import 'package:talent_link/src/domain/entities/attendance_history/attendance_history.dart';

abstract class AttendanceHistoryRepository {
  Future<DataState<List<AttendanceHistory>>> getAttendanceHistory(AttendanceHistoryRequest attendanceRequest);
}