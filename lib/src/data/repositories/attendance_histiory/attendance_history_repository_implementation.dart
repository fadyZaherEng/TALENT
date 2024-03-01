import 'package:dio/dio.dart';

import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/attendance_history/attendance_history_api_service.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/attendance_history/model/remote_attendance_history.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/attendance_history/request/attendance_history_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_request.dart';
import 'package:talent_link/src/domain/entities/attendance_history/attendance_history.dart';
import 'package:talent_link/src/domain/repositories/attendance_history/attendance_history_repository.dart';

class AttendanceHistoryRepositoryImplementation
    extends AttendanceHistoryRepository {
  final AttendanceHistoryApiService _attendanceHistoryApiService;

  AttendanceHistoryRepositoryImplementation(this._attendanceHistoryApiService);

  @override
  Future<DataState<List<AttendanceHistory>>> getAttendanceHistory(
      AttendanceHistoryRequest attendanceRequest) async {
    try {
      TalentLinkHrRequest request =
          await TalentLinkHrRequest().createRequest(attendanceRequest);

      final httpResponse =
          await _attendanceHistoryApiService.getAttendanceHistory(request);

      if ((httpResponse.data.success ?? false) &&
          (httpResponse.data.statusCode ?? 400) == 200) {
        return DataSuccess(
          data: (httpResponse.data.result ?? []).mapAttendanceHistoryToDomain(),
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
