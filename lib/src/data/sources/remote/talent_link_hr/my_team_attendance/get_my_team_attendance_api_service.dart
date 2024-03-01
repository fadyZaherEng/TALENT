import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'package:talent_link/src/data/sources/remote/api_keys.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/my_team_attendance/model/remote_my_team_attendance_history.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/my_team_attendance/model/remote_my_team_attendance_statistics.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_response.dart';

part 'get_my_team_attendance_api_service.g.dart';

@RestApi()
abstract class MyTeamAttendanceApiService {
  factory MyTeamAttendanceApiService(Dio dio) = _MyTeamAttendanceApiService;

  @POST(APIKeys.getMyTeamAttendanceHistory)
  Future<HttpResponse<TalentLinkResponse<List<RemoteMyTeamAttendanceHistory>>>>
      getMyTeamAttendanceHistory(@Body() TalentLinkHrRequest request);

  @POST(APIKeys.getMyTeamAttendanceStatistics)
  Future<HttpResponse<TalentLinkResponse<RemoteMyTeamAttendanceStatistics>>>
      getMyTeamAttendanceStatistics(@Body() TalentLinkHrRequest request);
}
