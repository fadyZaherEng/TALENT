import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'package:talent_link/src/data/sources/remote/api_keys.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/authentication/login/model/remote_user.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/authentication/login/request/login_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_response.dart';

part 'login_api_service.g.dart';

@RestApi()
abstract class LoginApiService {
  factory LoginApiService(Dio dio) = _LoginApiService;

  @POST(APIKeys.login)
  Future<HttpResponse<TalentLinkResponse<RemoteUser>>> login(
      @Body() TalentLinkHrRequest<LoginRequest> request);
}
