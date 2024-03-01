import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/domain/entities/my_team_attendance/my_team_attendance.dart';
import 'package:talent_link/src/domain/entities/my_team_attendance/my_team_attendance_statistics.dart';

abstract class GetMyTeamAttendanceRepository {
  Future<DataState<List<MyTeamAttendance>>> getMyTeamAttendanceHistory({
    required int managerEmployeeId,
    required String attendanceDateFrom,
    required String attendanceDateTo,
    required int filterCompanyId,
    required int filterEmployeeId,
  });
  Future<DataState<MyTeamAttendanceStatistics>> getMyTeamAttendanceStatistics({
    required int managerEmployeeId,
    required String attendanceDate,
    required int filterCompanyId,
  });
}
