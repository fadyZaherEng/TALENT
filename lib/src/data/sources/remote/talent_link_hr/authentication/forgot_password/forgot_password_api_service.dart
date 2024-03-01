import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'package:talent_link/src/data/sources/remote/api_keys.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/authentication/forgot_password/model/remote_forgot_password_state.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/authentication/forgot_password/request/forgot_password_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_response.dart';

part 'forgot_password_api_service.g.dart';

@RestApi()
abstract class ForgotPasswordApiService {
  factory ForgotPasswordApiService(Dio dio) = _ForgotPasswordApiService;

  @POST(APIKeys.forgotPassword)
  Future<HttpResponse<TalentLinkResponse<RemoteForgotPasswordState>>>
      forgotPassword(
          @Body() TalentLinkHrRequest<ForgotPasswordRequest> request);
}
