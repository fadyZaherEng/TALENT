import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'package:talent_link/src/data/sources/remote/api_keys.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/contact/model/remote_contect_type.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_response.dart';

part 'contact_api_service.g.dart';

@RestApi()
abstract class ContactApiService {
  factory ContactApiService(Dio dio) = _ContactApiService;

  @POST(APIKeys.getContactTypeList)
  Future<HttpResponse<TalentLinkResponse<List<RemoteContactType>>>> contactType(
      @Body() TalentLinkHrRequest request);

  @POST(APIKeys.insertContact)
  Future<HttpResponse<TalentLinkResponse>> insertContact(
      @Body() TalentLinkHrRequest request);
}
