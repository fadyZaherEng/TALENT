import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'package:talent_link/src/data/sources/remote/api_keys.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/qualification/model/remote_qualification.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_response.dart';

part 'qualification_api_service.g.dart';

@RestApi()
abstract class QualificationApiService {
  factory QualificationApiService(Dio dio) = _QualificationApiService;

  @POST(APIKeys.getQualificationTypeList)
  Future<HttpResponse<TalentLinkResponse<List<RemoteQualification>>>> getQualificationList(
      @Body() TalentLinkHrRequest request);
}
