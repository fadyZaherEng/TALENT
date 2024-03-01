import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/attendance_history/request/attendance_history_request.dart';
import 'package:talent_link/src/domain/entities/attendance_history/attendance_history.dart';
import 'package:talent_link/src/domain/repositories/attendance_history/attendance_history_repository.dart';

class GetAttendanceHistoryUseCase {
  final AttendanceHistoryRepository _repository;

  GetAttendanceHistoryUseCase(this._repository);

  Future<DataState<List<AttendanceHistory>>> call({
    required AttendanceHistoryRequest attendanceHistoryRequest,
  }) async {
    return await _repository.getAttendanceHistory(attendanceHistoryRequest);
  }
}
