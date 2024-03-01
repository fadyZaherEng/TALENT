import 'package:dio/dio.dart';

import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/my_team_attendance/get_my_team_attendance_api_service.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/my_team_attendance/model/remote_my_team_attendance_history.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/my_team_attendance/model/remote_my_team_attendance_statistics.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/my_team_attendance/request/my_team_attendance_history_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/my_team_attendance/request/my_team_attendance_statistics_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_request.dart';
import 'package:talent_link/src/domain/entities/my_team_attendance/my_team_attendance.dart';
import 'package:talent_link/src/domain/entities/my_team_attendance/my_team_attendance_statistics.dart';
import 'package:talent_link/src/domain/repositories/my_team_attendance/get_my_team_attendance_repository.dart';

class GetMyTeamAttendanceRepositoryImplementation
    extends GetMyTeamAttendanceRepository {
  final MyTeamAttendanceApiService _myTeamAttendanceApiService;
  GetMyTeamAttendanceRepositoryImplementation(this._myTeamAttendanceApiService);
  @override
  Future<DataState<List<MyTeamAttendance>>> getMyTeamAttendanceHistory(
      {required int managerEmployeeId,
      required String attendanceDateFrom,
      required String attendanceDateTo,
      required int filterCompanyId,
      required int filterEmployeeId}) async {
    try {
      TalentLinkHrRequest<MyTeamAttendanceHistoryRequest> request =
          await TalentLinkHrRequest<MyTeamAttendanceHistoryRequest>()
              .createRequest(
        MyTeamAttendanceHistoryRequest(
          attendanceDateFrom: attendanceDateFrom,
          attendanceDateTo: attendanceDateTo,
          filterCompanyId: filterCompanyId,
          filterEmployeeId: filterEmployeeId,
          managerEmployeeId: managerEmployeeId,
        ),
      );

      final httpResponse =
          await _myTeamAttendanceApiService.getMyTeamAttendanceHistory(request);
      if ((httpResponse.data.success ?? false) &&
          (httpResponse.data.statusCode ?? 400) == 200) {
        return DataSuccess(
          data: (httpResponse.data.result ?? [])
              .mapAttendanceHistoryListToDomain(),
          message: httpResponse.data.responseMessage ?? "",
        );
      }
      return DataFailed(
        message: httpResponse.data.responseMessage ?? "",
      );
    } on DioException catch (e) {
      return DataFailed(
        error: e,
        message: e.message ?? "",
      );
    }
  }

  @override
  Future<DataState<MyTeamAttendanceStatistics>> getMyTeamAttendanceStatistics({
    required int managerEmployeeId,
    required String attendanceDate,
    required int filterCompanyId,
  }) async {
    try {
      TalentLinkHrRequest<MyTeamAttendanceStatisticsRequest> request =
          await TalentLinkHrRequest<MyTeamAttendanceStatisticsRequest>()
              .createRequest(
        MyTeamAttendanceStatisticsRequest(
          managerEmployeeId: managerEmployeeId,
          filterCompanyId: filterCompanyId,
          attendanceDate: attendanceDate,
        ),
      );

      final httpResponse = await _myTeamAttendanceApiService
          .getMyTeamAttendanceStatistics(request);

      if ((httpResponse.data.success ?? false) &&
          (httpResponse.data.statusCode ?? 400) == 200) {
        return DataSuccess(
          data: httpResponse.data.result?.toMap(),
          message: httpResponse.data.responseMessage ?? "",
        );
      }
      return DataFailed(
        message: httpResponse.data.responseMessage ?? "",
      );
    } on DioException catch (e) {
      return DataFailed(
        error: e,
        message: e.message ?? "",
      );
    }
  }
}
