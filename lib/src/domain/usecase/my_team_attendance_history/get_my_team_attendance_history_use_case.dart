import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/domain/entities/my_team_attendance/my_team_attendance.dart';
import 'package:talent_link/src/domain/repositories/my_team_attendance/get_my_team_attendance_repository.dart';

class GetMyTeamAttendanceHistoryUseCase {
  final GetMyTeamAttendanceRepository _getMyTeamAttendanceRepository;

  GetMyTeamAttendanceHistoryUseCase(this._getMyTeamAttendanceRepository);

  Future<DataState<List<MyTeamAttendance>>> call({
    required int managerEmployeeId,
    required String attendanceDateFrom,
    required String attendanceDateTo,
    required int filterCompanyId,
    required int filterEmployeeId,
  }) async {
    return await _getMyTeamAttendanceRepository.getMyTeamAttendanceHistory(
        managerEmployeeId: managerEmployeeId,
        attendanceDateFrom: attendanceDateFrom,
        attendanceDateTo: attendanceDateTo,
        filterCompanyId: filterCompanyId,
        filterEmployeeId: filterEmployeeId);
  }
}
