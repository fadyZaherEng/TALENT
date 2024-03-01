import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'package:talent_link/src/data/sources/remote/api_keys.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/my_requests/model/remote_address_details.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/my_requests/model/remote_asset_details.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/my_requests/model/remote_contact_details.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/my_requests/model/remote_get_air_ticket_details.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/my_requests/model/remote_get_all_requests_list.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/my_requests/model/remote_get_business_trip_details.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/my_requests/model/remote_get_employee_requests.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/my_requests/model/remote_get_half_day_leave_details.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/my_requests/model/remote_get_indemnity_encashment_details.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/my_requests/model/remote_get_leave_details.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/my_requests/model/remote_get_leave_encashment_details.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/my_requests/model/remote_get_loan_details.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/my_requests/model/remote_get_other_request_details.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/my_requests/model/remote_get_resume_duty_details.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/my_requests/model/remote_get_short_leave_details.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/my_requests/model/remote_get_transaction_status.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_response.dart';

part 'my_requests_api_service.g.dart';

@RestApi()
abstract class MyRequestApiService {
  factory MyRequestApiService(Dio dio) = _MyRequestApiService;

  @POST(APIKeys.getIndemnityEncashmentDetails)
  Future<HttpResponse<TalentLinkResponse<RemoteGetIndemnityEncashmentDetails>>>
      getIndemnityEncashmentDetails(@Body() TalentLinkHrRequest request);

  @POST(APIKeys.getAirTicketDetails)
  Future<HttpResponse<TalentLinkResponse<RemoteGetAirTicketDetails>>>
      getAirTicketDetails(@Body() TalentLinkHrRequest request);

  @POST(APIKeys.getResumeDutyDetails)
  Future<HttpResponse<TalentLinkResponse<RemoteGetResumeDutyDetails>>>
      getResumeDutyDetails(@Body() TalentLinkHrRequest request);

  @POST(APIKeys.getBusinessTripDetails)
  Future<HttpResponse<TalentLinkResponse<RemoteGetBusinessTripDetails>>>
      getBusinessTripDetails(@Body() TalentLinkHrRequest request);

  @POST(APIKeys.getOtherRequestDetails)
  Future<HttpResponse<TalentLinkResponse<RemoteGetOtherRequestDetails>>>
      getOtherRequestDetails(@Body() TalentLinkHrRequest request);

  @POST(APIKeys.getEmployeeRequests)
  Future<HttpResponse<TalentLinkResponse<List<RemoteGetEmployeeRequests>>>>
      getEmployeeRequests(@Body() TalentLinkHrRequest request);

  @POST(APIKeys.getLeaveDetails)
  Future<HttpResponse<TalentLinkResponse<RemoteGetLeaveDetails>>>
      getLeaveDetails(@Body() TalentLinkHrRequest request);

  @POST(APIKeys.getShortLeaveDetails)
  Future<HttpResponse<TalentLinkResponse<RemoteGetShortLeaveDetails>>>
      getShortLeaveDetails(@Body() TalentLinkHrRequest request);

  @POST(APIKeys.getLeaveEncashmentDetails)
  Future<HttpResponse<TalentLinkResponse<RemoteGetLeaveEncashmentDetails>>>
      getLeaveEncashmentDetails(@Body() TalentLinkHrRequest request);

  @POST(APIKeys.getLoanDetails)
  Future<HttpResponse<TalentLinkResponse<RemoteGetLoanDetails>>> getLoanDetails(
      @Body() TalentLinkHrRequest request);

  @POST(APIKeys.cancelRequest)
  Future<HttpResponse<TalentLinkResponse>> cancelRequest(
      @Body() TalentLinkHrRequest request);

  @POST(APIKeys.getAllRequestList)
  Future<HttpResponse<TalentLinkResponse<List<RemoteGetAllRequestsList>>>>
      allRequestsList(@Body() TalentLinkHrRequest request);

  @POST(APIKeys.getTransactionStatus)
  Future<HttpResponse<TalentLinkResponse<List<RemoteGetTransactionStatus>>>>
      transactionStatus(@Body() TalentLinkHrRequest request);

  @POST(APIKeys.getHalfDayLeaveDetails)
  Future<HttpResponse<TalentLinkResponse<RemoteGetHalfDayLeaveDetails>>>
      getHalfDayDetails(@Body() TalentLinkHrRequest request);

  @POST(APIKeys.getAssetDetails)
  Future<HttpResponse<TalentLinkResponse<RemoteAssetDetails>>> getAssetDetails(
      @Body() TalentLinkHrRequest request);

  @POST(APIKeys.getContactDetails)
  Future<HttpResponse<TalentLinkResponse<RemoteContactDetails>>>
      getContactsDetails(@Body() TalentLinkHrRequest request);

  @POST(APIKeys.getAddressDetails)
  Future<HttpResponse<TalentLinkResponse<RemoteAddressDetails>>>
      getAddressDetails(@Body() TalentLinkHrRequest request);
}
