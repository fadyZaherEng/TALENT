import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'package:talent_link/src/data/sources/remote/api_keys.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/area/model/remote_area.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_response.dart';

part 'area_api_service.g.dart';

@RestApi()
abstract class AreaApiService {
  factory AreaApiService(Dio dio) = _AreaApiService;

  @POST(APIKeys.getAreaList)
  Future<HttpResponse<TalentLinkResponse<List<RemoteArea>>>> allArea(
      @Body() TalentLinkHrRequest request);
}
