import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'package:talent_link/src/data/sources/remote/api_keys.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/attendance_history/model/remote_attendance_history.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_response.dart';

part 'attendance_history_api_service.g.dart';

@RestApi()
abstract class AttendanceHistoryApiService {
  factory AttendanceHistoryApiService(Dio dio) = _AttendanceHistoryApiService;

  @POST(APIKeys.getEmployeeAttendanceHistory)
  Future<HttpResponse<TalentLinkResponse<List<RemoteAttendanceHistory>>>> getAttendanceHistory(
      @Body() TalentLinkHrRequest request);
}
