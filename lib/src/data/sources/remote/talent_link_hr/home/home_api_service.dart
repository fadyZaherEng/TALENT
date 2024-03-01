import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'package:talent_link/src/data/sources/remote/api_keys.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/home/model/remote_get_gross_salary_and_currency.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/home/model/remote_get_home_data_for_dashboard.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/home/model/remote_get_last_requests_for_dashboard.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/home/model/remote_get_news_list.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/home/model/remote_policies.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/home/model/remote_punch_from_dashboard.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/home/request/get_policies_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/home/request/insert_punch_from_dashboard_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_response.dart';

part 'home_api_service.g.dart';

@RestApi()
abstract class HomeApiService {
  factory HomeApiService(Dio dio) = _HomeApiService;

  @POST(APIKeys.getNewsList)
  Future<HttpResponse<TalentLinkResponse<List<RemoteGetNewsList>>>> getNewsList(
      @Body() TalentLinkHrRequest request);

  @POST(APIKeys.getPolicies)
  Future<HttpResponse<TalentLinkResponse<RemotePolicies>>> getPolicies(
      @Body() TalentLinkHrRequest<GetPoliciesRequest> request);

  @POST(APIKeys.insertPunchFromDashboard)
  Future<HttpResponse<TalentLinkResponse<RemotePunchFromDashboard>>>
      insertPunch(
          @Body() TalentLinkHrRequest<InsertPunchFromDashboard> request);

  @POST(APIKeys.getLastRequestsForDashboard)
  Future<HttpResponse<TalentLinkResponse<RemoteGetLastRequestsForDashBoard>>>
      getLastRequestsForDashboard(@Body() TalentLinkHrRequest request);

  @POST(APIKeys.getHomeDataForDashboard)
  Future<HttpResponse<TalentLinkResponse<RemoteGetDataForDashBoard>>>
      getHomeDateForDashboard(@Body() TalentLinkHrRequest request);

  @POST(APIKeys.getGrossSalaryAndCurrency)
  Future<HttpResponse<TalentLinkResponse<RemoteGetGrossSalaryAndCurrency>>>
      getGrossSalaryAndCurrency(@Body() TalentLinkHrRequest request);
}
