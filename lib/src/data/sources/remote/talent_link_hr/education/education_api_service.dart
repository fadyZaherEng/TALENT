import 'package:dio/dio.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';

import 'package:talent_link/src/data/sources/remote/api_keys.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_response.dart';

part 'education_api_service.g.dart';

@RestApi()
abstract class EducationApiService {
  factory EducationApiService(Dio dio) = _EducationApiService;

  @POST(APIKeys.insertEducation)
  @MultiPart()
  Future<HttpResponse<TalentLinkResponse>> insertEducation(
    @Part(name: 'requestbody') String requestBody,
    @Part(name: "Files") List<MultipartFile> file,
  );
}
