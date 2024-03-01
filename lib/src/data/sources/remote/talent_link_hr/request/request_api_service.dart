import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'package:talent_link/src/data/sources/remote/api_keys.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/request/model/remote_requests.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_response.dart';

part 'request_api_service.g.dart';

@RestApi()
abstract class RequestsApiService {
  factory RequestsApiService(Dio dio) = _RequestsApiService;

  @POST(APIKeys.getESSPermission)
  Future<HttpResponse<TalentLinkResponse<RemoteRequests>>> getESSPermission(
      @Body() TalentLinkHrRequest request);
}
