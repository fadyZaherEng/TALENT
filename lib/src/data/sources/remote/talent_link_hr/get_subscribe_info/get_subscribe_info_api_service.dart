import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'package:talent_link/src/data/sources/remote/api_keys.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/get_subscribe_info/model/remote_get_subscribe_info.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_response.dart';

part 'get_subscribe_info_api_service.g.dart';

@RestApi()
abstract class GetSubscribeInfoApiService {
  factory GetSubscribeInfoApiService(Dio dio) = _GetSubscribeInfoApiService;

  @POST(APIKeys.getSubscriberInfo)
  Future<HttpResponse<TalentLinkResponse<RemoteGetSubscribeInfo>>>
      getSubscribeInfo(@Body() TalentLinkHrRequest request);
}
