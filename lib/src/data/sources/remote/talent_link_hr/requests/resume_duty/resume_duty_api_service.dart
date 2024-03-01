import 'package:dio/dio.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';

import 'package:talent_link/src/data/sources/remote/api_keys.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/resume_duty/model/remote_calculate_in_case_resume_duty.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/resume_duty/model/remote_resume_duty_reference_data.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/resume_duty/model/remote_resume_duty_reference_types.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_response.dart';

part 'resume_duty_api_service.g.dart';

@RestApi()
abstract class ResumeDutyApiService {
  factory ResumeDutyApiService(Dio dio) = _ResumeDutyApiService;

  @POST(APIKeys.resumeDutyReferenceType)
  Future<HttpResponse<TalentLinkResponse<List<RemoteResumeDutyReferenceTypes>>>>
      resumeDutyReferenceTypes(@Body() TalentLinkHrRequest request);

  @POST(APIKeys.resumeDutyReferenceData)
  Future<HttpResponse<TalentLinkResponse<RemoteResumeDutyReferenceData>>>
      resumeDutyReferenceData(@Body() TalentLinkHrRequest request);

  @POST(APIKeys.insertResumeDuty)
  @MultiPart()
  Future<HttpResponse<TalentLinkResponse>> insertResumeDuty(
    @Part(name: 'requestbody') String requestBody,
    @Part(name: "Files") List<MultipartFile> file,
  );

  @POST(APIKeys.calculateInResumeDuty)
  Future<HttpResponse<TalentLinkResponse<RemoteCalculateInCaseResumeDuty>>>
      calculateInCaseResumeDuty(@Body() TalentLinkHrRequest request);
}
