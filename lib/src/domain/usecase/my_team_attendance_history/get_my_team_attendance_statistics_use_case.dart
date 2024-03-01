import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/domain/entities/my_team_attendance/my_team_attendance_statistics.dart';
import 'package:talent_link/src/domain/repositories/my_team_attendance/get_my_team_attendance_repository.dart';

class GetMyTeamAttendanceStatisticsUseCase {
  final GetMyTeamAttendanceRepository _getMyTeamAttendanceRepository;

  GetMyTeamAttendanceStatisticsUseCase(this._getMyTeamAttendanceRepository);

  Future<DataState<MyTeamAttendanceStatistics>> call({
    required int managerEmployeeId,
    required String attendanceDate,
    required int filterCompanyId,
  }) async {
    return await _getMyTeamAttendanceRepository.getMyTeamAttendanceStatistics(
        managerEmployeeId: managerEmployeeId,
        attendanceDate: attendanceDate,
        filterCompanyId: filterCompanyId);
  }
}
