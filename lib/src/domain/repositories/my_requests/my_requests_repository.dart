import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_response.dart';
import 'package:talent_link/src/domain/entities/my_requests/address_details/address_details.dart';
import 'package:talent_link/src/domain/entities/my_requests/asset_details/asset_details.dart';
import 'package:talent_link/src/domain/entities/my_requests/contact_details/contact_details.dart';
import 'package:talent_link/src/domain/entities/my_requests/get_business_trip_details.dart';
import 'package:talent_link/src/domain/entities/my_requests/get_indemnity_encashment_details/get_indemnity_encashment_details.dart';
import 'package:talent_link/src/domain/entities/my_requests/get_leave_details.dart';
import 'package:talent_link/src/domain/entities/my_requests/get_leave_encashment_details/get_leave_encashment_details.dart';
import 'package:talent_link/src/domain/entities/my_requests/get_loan_details/get_loan_details.dart';
import 'package:talent_link/src/domain/entities/my_requests/get_resume_duty_details.dart';
import 'package:talent_link/src/domain/entities/my_requests/get_short_leave_details/get_short_level_details.dart';
import 'package:talent_link/src/domain/entities/my_requests/git_air_ticket_details.dart';
import 'package:talent_link/src/domain/entities/my_requests/half_day/half_day_details.dart';
import 'package:talent_link/src/domain/entities/my_requests/my_request.dart';
import 'package:talent_link/src/domain/entities/my_requests/other_request_details/other_request_details.dart';
import 'package:talent_link/src/domain/entities/request/request_type.dart';

abstract class MyRequestsRepository {
  Future<DataState<GetIndemnityEncashmentDetails>>
      getIndemnityEncashmentDetails({
    required int transactionId,
  });

  Future<DataState<GetAirTicketDetails>> getAirTicketDetails({
    required int transactionId,
  });

  Future<DataState<GetResumeDutyDetails>> getResumeDutyDetails({
    required int transactionId,
  });

  Future<DataState<GetBusinessTripDetails>> getBusinessTripDetails({
    required int transactionId,
  });

  Future<DataState<GetHalfDayLeaveDetails>> getHalfDayLeaveDetails({
    required int transactionId,
  });

  Future<DataState<GetOtherRequestDetails>> getOtherRequestDetails({
    required int transactionId,
  });

  Future<DataState<List<MyRequest>>> getEmployeeRequests({
    required int requestTypeId,
    required int employeeId,
    required int transactionStatusId,
    required String requestFromDate,
    required String requestToDate,
    required String createdDateAt,
    required String createdDateFrom,
    required int requestDataId,
  });

  Future<DataState<GetLeaveDetails>> getLeaveDetails({
    required int transactionId,
  });

  Future<DataState<GetShortLevelDetails>> getShortLeaveDetails({
    required int transactionId,
  });

  Future<DataState<GetLeaveEncashmentDetails>> getLeaveEncashmentDetails({
    required int transactionId,
  });

  Future<DataState<GetLoanDetails>> getLoanDetails({
    required int transactionId,
  });

  Future<DataState<AssetDetails>> getAssetDetails({
    required int transactionId,
  });

  Future<DataState<ContactDetails>> getContactDetails({
    required int transactionId,
  });

  Future<DataState<AddressDetails>> getAddressDetails({
    required int transactionId,
  });

  Future<DataState<TalentLinkResponse>> cancelRequest({
    required int tableId,
    required int transactionId,
  });

  Future<DataState<List<RequestType>>> getAllRequestsList();

  Future<DataState<List<RequestType>>> transactionStatus();
}
