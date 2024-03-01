import 'package:dio/dio.dart';

import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/my_requests/model/remote_address_details.dart';
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
import 'package:talent_link/src/data/sources/remote/talent_link_hr/my_requests/my_requests_api_service.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/my_requests/requests/cancel_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/my_requests/requests/get_details_requests.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/my_requests/requests/get_employee_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_request.dart';
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
import 'package:talent_link/src/domain/repositories/my_requests/my_requests_repository.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/my_requests/model/remote_asset_details.dart';

class MyRequestsRepositoryImplementation extends MyRequestsRepository {
  final MyRequestApiService _myRequestApiService;

  MyRequestsRepositoryImplementation(this._myRequestApiService);

  @override
  Future<DataState<List<MyRequest>>> getEmployeeRequests({
    required int requestTypeId,
    required int employeeId,
    required int transactionStatusId,
    required String requestFromDate,
    required String requestToDate,
    required String createdDateAt,
    required String createdDateFrom,
    required int requestDataId,
  }) async {
    try {
      TalentLinkHrRequest<GetEmployeeRequest> request =
          await TalentLinkHrRequest<GetEmployeeRequest>()
              .createRequest(GetEmployeeRequest(
        employeeId: employeeId,
        transactionStatusId: transactionStatusId,
        requestTypeId: requestTypeId,
        requestToDate: requestToDate,
        requestFromDate: requestFromDate,
        requestDataId: requestDataId,
        createdDateFrom: createdDateFrom,
        createdDateAt: createdDateAt,
      ));

      final httpResponse =
          await _myRequestApiService.getEmployeeRequests(request);

      if ((httpResponse.data.success ?? false) &&
          (httpResponse.data.statusCode ?? 400) == 200) {
        return DataSuccess(
          data: (httpResponse.data.result ?? [])
              .mapRemoteGetEmployeeRequestsListToDomain(),
          message: httpResponse.data.responseMessage ?? "",
        );
      }
      return DataFailed(
        message: httpResponse.data.responseMessage ?? "",
      );
    } on DioException catch (e) {
      return DataFailed(
        error: e,
        message: e.message ?? "",
      );
    }
  }

  @override
  Future<DataState<GetLeaveDetails>> getLeaveDetails({
    required int transactionId,
  }) async {
    try {
      TalentLinkHrRequest<GetDetailsRequests> request =
          await TalentLinkHrRequest<GetDetailsRequests>()
              .createRequest(GetDetailsRequests(
        transactionId: transactionId,
      ));

      final httpResponse = await _myRequestApiService.getLeaveDetails(request);

      if ((httpResponse.data.success ?? false) &&
          (httpResponse.data.statusCode ?? 400) == 200) {
        return DataSuccess(
          data: httpResponse.data.result?.mapToDomain(),
          message: httpResponse.data.responseMessage ?? "",
        );
      }
      return DataFailed(
        message: httpResponse.data.responseMessage ?? "",
      );
    } on DioException catch (e) {
      return DataFailed(
        error: e,
        message: e.message ?? "",
      );
    }
  }

  @override
  Future<DataState<GetLeaveEncashmentDetails>> getLeaveEncashmentDetails({
    required int transactionId,
  }) async {
    try {
      TalentLinkHrRequest<GetDetailsRequests> request =
          await TalentLinkHrRequest<GetDetailsRequests>()
              .createRequest(GetDetailsRequests(
        transactionId: transactionId,
      ));
      final httpResponse =
          await _myRequestApiService.getLeaveEncashmentDetails(request);

      if ((httpResponse.data.success ?? false) &&
          (httpResponse.data.statusCode ?? 400) == 200) {
        return DataSuccess(
          data: httpResponse.data.result?.mapToDomain(),
          message: httpResponse.data.responseMessage ?? "",
        );
      }
      return DataFailed(
        message: httpResponse.data.responseMessage ?? "",
      );
    } on DioException catch (e) {
      return DataFailed(
        error: e,
        message: e.message ?? "",
      );
    }
  }

  @override
  Future<DataState<GetLoanDetails>> getLoanDetails({
    required int transactionId,
  }) async {
    try {
      TalentLinkHrRequest<GetDetailsRequests> request =
          await TalentLinkHrRequest<GetDetailsRequests>()
              .createRequest(GetDetailsRequests(
        transactionId: transactionId,
      ));

      final httpResponse = await _myRequestApiService.getLoanDetails(request);

      if ((httpResponse.data.success ?? false) &&
          (httpResponse.data.statusCode ?? 400) == 200) {
        return DataSuccess(
          data: httpResponse.data.result?.mapToDomain(),
          message: httpResponse.data.responseMessage ?? "",
        );
      }
      return DataFailed(
        message: httpResponse.data.responseMessage ?? "",
      );
    } on DioException catch (e) {
      return DataFailed(
        error: e,
        message: e.message ?? "",
      );
    }
  }

  @override
  Future<DataState<GetShortLevelDetails>> getShortLeaveDetails({
    required int transactionId,
  }) async {
    try {
      TalentLinkHrRequest<GetDetailsRequests> request =
          await TalentLinkHrRequest<GetDetailsRequests>()
              .createRequest(GetDetailsRequests(
        transactionId: transactionId,
      ));

      final httpResponse =
          await _myRequestApiService.getShortLeaveDetails(request);

      if ((httpResponse.data.success ?? false) &&
          (httpResponse.data.statusCode ?? 400) == 200) {
        return DataSuccess(
          data: httpResponse.data.result?.mapToDomain(),
          message: httpResponse.data.responseMessage ?? "",
        );
      }
      return DataFailed(
        message: httpResponse.data.responseMessage ?? "",
      );
    } on DioException catch (e) {
      return DataFailed(
        error: e,
        message: e.message ?? "",
      );
    }
  }

  @override
  Future<DataState<GetAirTicketDetails>> getAirTicketDetails({
    required int transactionId,
  }) async {
    try {
      TalentLinkHrRequest<GetDetailsRequests> request =
          await TalentLinkHrRequest<GetDetailsRequests>()
              .createRequest(GetDetailsRequests(
        transactionId: transactionId,
      ));

      final httpResponse = await _myRequestApiService.getAirTicketDetails(
        request,
      );

      if ((httpResponse.data.success ?? false) &&
          (httpResponse.data.statusCode ?? 400) == 200) {
        return DataSuccess(
          data: httpResponse.data.result?.mapToGetAirTicketDetailsDomain(),
          message: httpResponse.data.responseMessage ?? "",
        );
      }
      return DataFailed(
        message: httpResponse.data.responseMessage ?? "",
      );
    } on DioException catch (e) {
      return DataFailed(
        error: e,
        message: e.message ?? "",
      );
    }
  }

  @override
  Future<DataState<GetBusinessTripDetails>> getBusinessTripDetails(
      {required int transactionId}) async {
    try {
      TalentLinkHrRequest<GetDetailsRequests> request =
          await TalentLinkHrRequest<GetDetailsRequests>()
              .createRequest(GetDetailsRequests(
        transactionId: transactionId,
      ));

      final httpResponse = await _myRequestApiService.getBusinessTripDetails(
        request,
      );

      if ((httpResponse.data.success ?? false) &&
          (httpResponse.data.statusCode ?? 400) == 200) {
        return DataSuccess(
          data: httpResponse.data.result?.mapToGetBusinessTripDetailsDomain(),
          message: httpResponse.data.responseMessage ?? "",
        );
      }
      return DataFailed(
        message: httpResponse.data.responseMessage ?? "",
      );
    } on DioException catch (e) {
      return DataFailed(
        error: e,
        message: e.message ?? "",
      );
    }
  }

  @override
  Future<DataState<GetIndemnityEncashmentDetails>>
      getIndemnityEncashmentDetails({
    required int transactionId,
  }) async {
    try {
      TalentLinkHrRequest<GetDetailsRequests> request =
          await TalentLinkHrRequest<GetDetailsRequests>()
              .createRequest(GetDetailsRequests(
        transactionId: transactionId,
      ));

      final httpResponse =
          await _myRequestApiService.getIndemnityEncashmentDetails(
        request,
      );

      if ((httpResponse.data.success ?? false) &&
          (httpResponse.data.statusCode ?? 400) == 200) {
        return DataSuccess(
          data: httpResponse.data.result
              ?.mapToGetIndemnityEncashmentDetailsDomain(),
          message: httpResponse.data.responseMessage ?? "",
        );
      }
      return DataFailed(
        message: httpResponse.data.responseMessage ?? "",
      );
    } on DioException catch (e) {
      return DataFailed(
        error: e,
        message: e.message ?? "",
      );
    }
  }

  @override
  Future<DataState<GetOtherRequestDetails>> getOtherRequestDetails({
    required int transactionId,
  }) async {
    try {
      TalentLinkHrRequest<GetDetailsRequests> request =
          await TalentLinkHrRequest<GetDetailsRequests>()
              .createRequest(GetDetailsRequests(
        transactionId: transactionId,
      ));

      final httpResponse = await _myRequestApiService.getOtherRequestDetails(
        request,
      );

      if ((httpResponse.data.success ?? false) &&
          (httpResponse.data.statusCode ?? 400) == 200) {
        return DataSuccess(
          data: httpResponse.data.result?.mapToGetOtherRequestDetails(),
          message: httpResponse.data.responseMessage ?? "",
        );
      }
      return DataFailed(
        message: httpResponse.data.responseMessage ?? "",
      );
    } on DioException catch (e) {
      return DataFailed(
        error: e,
        message: e.message ?? "",
      );
    }
  }

  @override
  Future<DataState<GetResumeDutyDetails>> getResumeDutyDetails({
    required int transactionId,
  }) async {
    try {
      TalentLinkHrRequest<GetDetailsRequests> request =
          await TalentLinkHrRequest<GetDetailsRequests>()
              .createRequest(GetDetailsRequests(
        transactionId: transactionId,
      ));

      final httpResponse = await _myRequestApiService.getResumeDutyDetails(
        request,
      );

      if ((httpResponse.data.success ?? false) &&
          (httpResponse.data.statusCode ?? 400) == 200) {
        return DataSuccess(
          data: httpResponse.data.result?.mapToGetResumeDutyDetailsDomain(),
          message: httpResponse.data.responseMessage ?? "",
        );
      }
      return DataFailed(
        message: httpResponse.data.responseMessage ?? "",
      );
    } on DioException catch (e) {
      return DataFailed(
        error: e,
        message: e.message ?? "",
      );
    }
  }

  @override
  Future<DataState<TalentLinkResponse>> cancelRequest(
      {required int tableId, required int transactionId}) async {
    try {
      TalentLinkHrRequest<CancelRequestRequest> request =
          await TalentLinkHrRequest<CancelRequestRequest>().createRequest(
              CancelRequestRequest(
                  tableId: tableId, transactionId: transactionId));

      final httpResponse = await _myRequestApiService.cancelRequest(request);

      if ((httpResponse.data.success ?? false) &&
          (httpResponse.data.statusCode ?? 400) == 200) {
        return DataSuccess(
          data: httpResponse.data,
          message: httpResponse.data.responseMessage ?? "",
        );
      }
      return DataFailed(
        message: httpResponse.data.responseMessage ?? "",
      );
    } on DioException catch (e) {
      return DataFailed(
        error: e,
        message: e.message ?? "",
      );
    }
  }

  @override
  Future<DataState<List<RequestType>>> getAllRequestsList() async {
    try {
      TalentLinkHrRequest request =
          await TalentLinkHrRequest().createRequest({});

      final httpResponse = await _myRequestApiService.allRequestsList(request);

      if ((httpResponse.data.success ?? false) &&
          (httpResponse.data.statusCode ?? 400) == 200) {
        return DataSuccess(
          data: (httpResponse.data.result ?? []).mapAllRequestsToDomain(),
          message: httpResponse.data.responseMessage ?? "",
        );
      }
      return DataFailed(
        message: httpResponse.data.responseMessage ?? "",
      );
    } on DioException catch (e) {
      return DataFailed(
        error: e,
        message: e.message ?? "",
      );
    }
  }

  @override
  Future<DataState<List<RequestType>>> transactionStatus() async {
    try {
      TalentLinkHrRequest request =
          await TalentLinkHrRequest().createRequest({});

      final httpResponse =
          await _myRequestApiService.transactionStatus(request);

      if ((httpResponse.data.success ?? false) &&
          (httpResponse.data.statusCode ?? 400) == 200) {
        return DataSuccess(
          data: (httpResponse.data.result ?? []).mapTransactionStatusToDomain(),
          message: httpResponse.data.responseMessage ?? "",
        );
      }
      return DataFailed(
        message: httpResponse.data.responseMessage ?? "",
      );
    } on DioException catch (e) {
      return DataFailed(
        error: e,
        message: e.message ?? "",
      );
    }
  }

  @override
  Future<DataState<GetHalfDayLeaveDetails>> getHalfDayLeaveDetails({
    required int transactionId,
  }) async {
    try {
      TalentLinkHrRequest<GetDetailsRequests> request =
          await TalentLinkHrRequest<GetDetailsRequests>()
              .createRequest(GetDetailsRequests(
        transactionId: transactionId,
      ));

      final httpResponse = await _myRequestApiService.getHalfDayDetails(
        request,
      );

      if ((httpResponse.data.success ?? false) &&
          (httpResponse.data.statusCode ?? 400) == 200) {
        return DataSuccess(
          data: httpResponse.data.result?.mapToDomain(),
          message: httpResponse.data.responseMessage ?? "",
        );
      }
      return DataFailed(
        message: httpResponse.data.responseMessage ?? "",
      );
    } on DioException catch (e) {
      return DataFailed(
        error: e,
        message: e.message ?? "",
      );
    }
  }

  @override
  Future<DataState<AssetDetails>> getAssetDetails(
      {required int transactionId}) async {
    try {
      TalentLinkHrRequest<GetDetailsRequests> request =
          await TalentLinkHrRequest<GetDetailsRequests>()
              .createRequest(GetDetailsRequests(
        transactionId: transactionId,
      ));

      final httpResponse = await _myRequestApiService.getAssetDetails(
        request,
      );

      if ((httpResponse.data.success ?? false) &&
          (httpResponse.data.statusCode ?? 400) == 200) {
        return DataSuccess(
          data: httpResponse.data.result?.mapToDomain(),
          message: httpResponse.data.responseMessage ?? "",
        );
      }
      return DataFailed(
        message: httpResponse.data.responseMessage ?? "",
      );
    } on DioException catch (e) {
      return DataFailed(
        error: e,
        message: e.message ?? "",
      );
    }
  }

  @override
  Future<DataState<ContactDetails>> getContactDetails(
      {required int transactionId}) async {
    try {
      TalentLinkHrRequest<GetDetailsRequests> request =
          await TalentLinkHrRequest<GetDetailsRequests>()
              .createRequest(GetDetailsRequests(
        transactionId: transactionId,
      ));

      final httpResponse = await _myRequestApiService.getContactsDetails(
        request,
      );

      if ((httpResponse.data.success ?? false) &&
          (httpResponse.data.statusCode ?? 400) == 200) {
        return DataSuccess(
          data: httpResponse.data.result?.mapToDomain(),
          message: httpResponse.data.responseMessage ?? "",
        );
      }
      return DataFailed(
        message: httpResponse.data.responseMessage ?? "",
      );
    } on DioException catch (e) {
      return DataFailed(
        error: e,
        message: e.message ?? "",
      );
    }
  }

  @override
  Future<DataState<AddressDetails>> getAddressDetails(
      {required int transactionId}) async {
    try {
      TalentLinkHrRequest<GetDetailsRequests> request =
          await TalentLinkHrRequest<GetDetailsRequests>()
              .createRequest(GetDetailsRequests(
        transactionId: transactionId,
      ));

      final httpResponse = await _myRequestApiService.getAddressDetails(
        request,
      );

      if ((httpResponse.data.success ?? false) &&
          (httpResponse.data.statusCode ?? 400) == 200) {
        return DataSuccess(
          data: httpResponse.data.result?.mapToDomain(),
          message: httpResponse.data.responseMessage ?? "",
        );
      }
      return DataFailed(
        message: httpResponse.data.responseMessage ?? "",
      );
    } on DioException catch (e) {
      return DataFailed(
        error: e,
        message: e.message ?? "",
      );
    }
  }
}
