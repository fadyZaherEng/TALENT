import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'package:talent_link/src/data/sources/remote/api_keys.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/get_time_line/model/get_time_line_remote.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_response.dart';

part 'get_time_line_api_service.g.dart';

@RestApi()
abstract class GetTimeLineApiService {
  factory GetTimeLineApiService(Dio dio) = _GetTimeLineApiService;

  @POST(APIKeys.getTimeLine)
  Future<HttpResponse<TalentLinkResponse<List<GetTimeLineRemote>>>> getTimeLine(
      @Body() TalentLinkHrRequest request);
}
