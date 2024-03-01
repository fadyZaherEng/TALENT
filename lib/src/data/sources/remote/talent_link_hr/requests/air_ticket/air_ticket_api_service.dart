import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'package:talent_link/src/data/sources/remote/api_keys.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/air_ticket/model/remote_calculate_in_case_air_ticket.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/air_ticket/model/remote_dependent_air_ticket.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/air_ticket/model/remote_get_air_ticket_by_employee.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/air_ticket/request/calculate_in_case_air_ticket_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/air_ticket/request/get_air_ticket_by_employee_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/air_ticket/request/get_dependent_air_ticket_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_response.dart';

part 'air_ticket_api_service.g.dart';

@RestApi()
abstract class AirTicketApiService {
  factory AirTicketApiService(Dio dio) = _AirTicketApiService;

  @POST(APIKeys.insertAirTicket)
  @MultiPart()
  Future<HttpResponse<TalentLinkResponse>> insertAirTicket(
    @Part(name: 'requestbody') String requestBody,
    @Part(name: "Files") List<MultipartFile> file,
  );

  @POST(APIKeys.getDependentAirTicket)
  Future<HttpResponse<TalentLinkResponse<List<RemoteDependentAirTicket>>>>
      getDependentAirTicket(
          @Body() TalentLinkHrRequest<GetDependentAirTicketRequest> request);

  @POST(APIKeys.getAirTicketByEmployee)
  Future<HttpResponse<TalentLinkResponse<RemoteGetAirTicketByEmployee>>>
      getAirTicketByEmployee(
          @Body() TalentLinkHrRequest<GetAirTicketByEmployeeRequest> request);

  @POST(APIKeys.calculateInCaseAirTicket)
  Future<HttpResponse<TalentLinkResponse<RemoteCalculateInCaseAirTicket>>>
      calculateInCaseAirTicket(
          @Body() TalentLinkHrRequest<CalculateInCaseAirTicketRequest> request);
}
