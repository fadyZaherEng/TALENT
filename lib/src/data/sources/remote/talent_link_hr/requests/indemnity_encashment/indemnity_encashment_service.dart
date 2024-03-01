import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'package:talent_link/src/data/sources/remote/api_keys.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/indemnity_encashment/model/remote_calculate_in_case_indemnity_encashment.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/indemnity_encashment/model/remote_get_employee_indemnity_encashment_details.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/indemnity_encashment/request/get_employee_indemnity_encashment_details_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_response.dart';

part 'indemnity_encashment_service.g.dart';

@RestApi()
abstract class IndemnityEncashmentApiService {
  factory IndemnityEncashmentApiService(Dio dio) =
      _IndemnityEncashmentApiService;

  @POST(APIKeys.insertIndemnityEncashment)
  @MultiPart()
  Future<HttpResponse<TalentLinkResponse>> insertIndemnityEncashment(
    @Part(name: 'requestbody') String requestBody,
    @Part(name: "Files") List<MultipartFile> file,
  );

  @POST(APIKeys.getEmployeeIndemnityEncashmentDetails)
  Future<
          HttpResponse<
              TalentLinkResponse<
                  List<RemoteGetEmployeeIndemnityEncashmentDetails>>>>
      getEmployeeIndemnityEncashmentDetails(
          @Body()
          TalentLinkHrRequest<GetEmployeeIndemnityEncashmentDetailsRequest>
              request);

  @POST(APIKeys.calculateInCaseIndemnityEncashment)
  Future<
          HttpResponse<
              TalentLinkResponse<RemoteCalculateInCaseIndemnityEncashment>>>
      calculateInCaseIndemnity(@Body() TalentLinkHrRequest request);
}
