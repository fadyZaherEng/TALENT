import 'package:dio/dio.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';

import 'package:talent_link/src/data/sources/remote/api_keys.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/education_details/response/remote_get_education_details.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_response.dart';

part 'education_details_api_service.g.dart';

@RestApi()
abstract class EducationDetailsApiService {
  factory EducationDetailsApiService(Dio dio) = _EducationDetailsApiService;

  @POST(APIKeys.getEducationDetails)
  Future<HttpResponse<TalentLinkResponse<RemoteGetEducationDetails>>>
      getEducationDetails(@Body() TalentLinkHrRequest request);
}
