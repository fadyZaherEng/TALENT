import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'package:talent_link/src/data/sources/remote/api_keys.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/my_team_request/model/remote_approve_my_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/my_team_request/model/remote_get_companies_and_employees_list.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/my_team_request/model/remote_get_my_team_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/my_team_request/model/remote_reject_my_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_response.dart';

part 'get_my_team_request_api_service.g.dart';

@RestApi()
abstract class GetMyTeamRequestApiService {
  factory GetMyTeamRequestApiService(Dio dio) = _GetMyTeamRequestApiService;

  @POST(APIKeys.getMyTeamRequest)
  Future<HttpResponse<TalentLinkResponse<List<RemoteGetMyTeamRequest>>>>
      getMyTeamRequestHistory(@Body() TalentLinkHrRequest request);

  @POST(APIKeys.getCompaniesAndEmployeesList)
  Future<HttpResponse<TalentLinkResponse<RemoteGetCompaniesAndEmployeesList>>>
      getCompaniesAndEmployeesList(@Body() TalentLinkHrRequest request);

  @POST(APIKeys.approveRequest)
  @MultiPart()
  Future<HttpResponse<TalentLinkResponse<RemoteApproveMyRequest>>>
      approveRequest(
    @Part(name: 'requestbody') String requestBody,
    @Part(name: "Files") List<MultipartFile> file,
  );

  @POST(APIKeys.rejectRequest)
  @MultiPart()
  Future<HttpResponse<TalentLinkResponse<RemoteRejectMyRequest>>> rejectRequest(
    @Part(name: 'requestbody') String requestBody,
    @Part(name: "Files") List<MultipartFile> file,
  );
}
