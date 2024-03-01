import 'dart:convert';

import 'package:dio/dio.dart';

import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/my_team_request/get_my_team_request_api_service.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/my_team_request/model/remote_get_companies_and_employees_list.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/my_team_request/model/remote_get_my_team_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/my_team_request/request/approve_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/my_team_request/request/get_companies_and_employees_list_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/my_team_request/request/get_my_team_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/my_team_request/request/reject_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_request.dart';
import 'package:talent_link/src/domain/entities/get_my_team_request/get_companies_and_employees_list/get_companies_and_employees_list.dart';
import 'package:talent_link/src/domain/entities/get_my_team_request/get_my_team_request.dart';
import 'package:talent_link/src/domain/repositories/get_my_team_request/get_my_team_request_repository.dart';

class GetMyTeamRequestRepositoryImplementation
    extends GetMyTeamRequestRepository {
  final GetMyTeamRequestApiService _getMyTeamRequestApiService;

  GetMyTeamRequestRepositoryImplementation(this._getMyTeamRequestApiService);

  @override
  Future<DataState<CompaniesAndEmployeesList>> getCompaniesAndEmployeesList({
    required int employeeId,
  }) async {
    try {
      TalentLinkHrRequest<GetCompaniesAndEmployeesListRequest> request =
          await TalentLinkHrRequest<GetCompaniesAndEmployeesListRequest>()
              .createRequest(GetCompaniesAndEmployeesListRequest(
        employeeId: employeeId,
      ));

      final httpResponse = await _getMyTeamRequestApiService
          .getCompaniesAndEmployeesList(request);
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
  Future<DataState<List<MyTeamRequest>>> getMyTeamRequest({
    required int managerEmployeeId,
    required int filterCompanyId,
    required int filerEmployeeId,
    required int requestTypeId,
    required String requestFromDate,
    required String requestToDate,
    required String createdDateAt,
    required String createdDateFrom,
    required int requestDataId,
    required int transactionStatusId,
  }) async {
    try {
      TalentLinkHrRequest<GetMyTeamRequest> request =
          await TalentLinkHrRequest<GetMyTeamRequest>()
              .createRequest(GetMyTeamRequest(
        filterCompanyId: filterCompanyId,
        managerEmployeeId: managerEmployeeId,
        createdDateAt: createdDateAt,
        createdDateFrom: createdDateFrom,
        filerEmployeeId: filerEmployeeId,
        requestDataId: requestDataId,
        requestFromDate: requestFromDate,
        requestToDate: requestToDate,
        requestTypeId: requestTypeId,
        transactionStatusId: transactionStatusId,
      ));

      print(filterCompanyId);
      print(managerEmployeeId);
      print(createdDateAt);
      print(createdDateFrom);
      print(filerEmployeeId);
      print(requestDataId);
      print(requestFromDate);
      print(requestToDate);
      print(requestTypeId);
      print(transactionStatusId);

      final httpResponse =
          await _getMyTeamRequestApiService.getMyTeamRequestHistory(request);
      if ((httpResponse.data.success ?? false) &&
          (httpResponse.data.statusCode ?? 400) == 200) {
        return DataSuccess(
          data: (httpResponse.data.result ?? [])
              .mapAttendanceHistoryListToDomain(),
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
  Future<DataState<bool>> approveRequest({
    required int transactionId,
    required employeeId,
    required requestTypeId,
  }) async {
    try {
      TalentLinkHrRequest<ApproveRequest> approveRequest =
          await TalentLinkHrRequest<ApproveRequest>()
              .createRequest(ApproveRequest(
        employeeId: employeeId,
        requestTypeId: requestTypeId,
        id: transactionId,
      ));
      final httpResponse = await _getMyTeamRequestApiService
          .approveRequest(jsonEncode(approveRequest.toMap()), []);
      if ((httpResponse.data.success == true) &&
          (httpResponse.data.statusCode ?? 400) == 200) {
        return DataSuccess(
          data: httpResponse.data.result?.status ?? false,
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
  Future<DataState<bool>> rejectRequest(
      {required int transactionId,
      required employeeId,
      required requestTypeId}) async {
    try {
      TalentLinkHrRequest<RejectRequest> rejectRequest =
          await TalentLinkHrRequest<RejectRequest>()
              .createRequest(RejectRequest(
        employeeId: employeeId,
        requestTypeId: requestTypeId,
        id: transactionId,
      ));

      final httpResponse = await _getMyTeamRequestApiService
          .rejectRequest(jsonEncode(rejectRequest.toMap()), []);

      if ((httpResponse.data.success == true) &&
          (httpResponse.data.statusCode ?? 400) == 200) {
        return DataSuccess(
          data: httpResponse.data.result?.status ?? false,
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
