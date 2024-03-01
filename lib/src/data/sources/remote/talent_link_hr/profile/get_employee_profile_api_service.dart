import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'package:talent_link/src/data/sources/remote/api_keys.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/profile/model/remote_get_profile_employee.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_response.dart';

part 'get_employee_profile_api_service.g.dart';

@RestApi()
abstract class GetEmployeeProfileApiService {
  factory GetEmployeeProfileApiService(Dio dio) = _GetEmployeeProfileApiService;

  @POST(APIKeys.getProfileEmployee)
  Future<HttpResponse<TalentLinkResponse<RemoteGetProfileEmployee>>>
      getProfileEmployee(@Body() TalentLinkHrRequest request);
  @POST(APIKeys.insertAttachment)
  @MultiPart()
  Future<HttpResponse<TalentLinkResponse>> insertAttachment(
    @Part(name: 'requestbody') String requestBody,
    @Part(name: "Files") List<MultipartFile> file,
  );
}
