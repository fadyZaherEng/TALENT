import 'package:dio/dio.dart';

import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/home/home_api_service.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/home/model/remote_get_gross_salary_and_currency.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/home/model/remote_get_home_data_for_dashboard.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/home/model/remote_get_last_requests_for_dashboard.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/home/model/remote_get_news_list.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/home/model/remote_policies.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/home/model/remote_punch_from_dashboard.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/home/request/get_policies_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/home/request/insert_punch_from_dashboard_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_request.dart';
import 'package:talent_link/src/domain/entities/home/home_data.dart';
import 'package:talent_link/src/domain/entities/home/last_update_request.dart';
import 'package:talent_link/src/domain/entities/home/news.dart';
import 'package:talent_link/src/domain/entities/home/policies.dart';
import 'package:talent_link/src/domain/entities/home/punch.dart';
import '../../../domain/repositories/home/home_repository.dart';

class HomeRepositoryImplementation extends HomeRepository {
  final HomeApiService _homeApiService;

  HomeRepositoryImplementation(this._homeApiService);

  @override
  Future<DataState<List<News>>> getNewsList() async {
    try {
      TalentLinkHrRequest request =
          await TalentLinkHrRequest().createRequest({});

      final httpResponse = await _homeApiService.getNewsList(request);

      if ((httpResponse.data.success ?? false) &&
          (httpResponse.data.statusCode ?? 400) == 200) {
        return DataSuccess(
          data: (httpResponse.data.result ?? []).mapNewsListToDomain(),
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
  Future<DataState<Policies>> getPolicies({required int employeeId}) async {
    try {
      TalentLinkHrRequest<GetPoliciesRequest> request =
          await TalentLinkHrRequest<GetPoliciesRequest>()
              .createRequest(GetPoliciesRequest(employeeId: employeeId));

      final httpResponse = await _homeApiService.getPolicies(request);

      if ((httpResponse.data.success ?? false) &&
          (httpResponse.data.statusCode ?? 400) == 200) {
        return DataSuccess(
          data: (httpResponse.data.result ?? RemotePolicies()).mapToDomain(),
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
  Future<DataState<Punch>> insertPunch({
    required String punchTypeSystemCode,
    required String fingerPrint,
    required String latitude,
    required String longitude,
  }) async {
    try {
      TalentLinkHrRequest<InsertPunchFromDashboard> request =
          await TalentLinkHrRequest<InsertPunchFromDashboard>()
              .createRequest(InsertPunchFromDashboard(
        punchTypeSystemCode: punchTypeSystemCode,
        fingerPrintNo: fingerPrint,
        latitude: latitude,
        longitude: longitude,
      ));

      final httpResponse = await _homeApiService.insertPunch(request);

      if ((httpResponse.data.success ?? false) &&
          (httpResponse.data.statusCode ?? 400) == 200) {
        return DataSuccess(
          data: (httpResponse.data.result ?? RemotePunchFromDashboard())
              .mapToDomain(),
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
  Future<DataState<LastUpdateRequests>> getLastRequestsFroDashboard() async {
    try {
      TalentLinkHrRequest request =
          await TalentLinkHrRequest().createRequest({});
      final httpResponse =
          await _homeApiService.getLastRequestsForDashboard(request);

      if ((httpResponse.data.success ?? false) &&
          (httpResponse.data.statusCode ?? 400) == 200) {
        return DataSuccess(
          data:
              (httpResponse.data.result ?? RemoteGetLastRequestsForDashBoard())
                  .mapToDomain(),
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
  Future<DataState<HomeData>> getHomeDataForDashBoard() async {
    try {
      TalentLinkHrRequest request =
          await TalentLinkHrRequest().createRequest({});
      final httpResponse =
          await _homeApiService.getHomeDateForDashboard(request);

      if ((httpResponse.data.success ?? false) &&
          (httpResponse.data.statusCode ?? 400) == 200) {
        return DataSuccess(
          data: (httpResponse.data.result ?? RemoteGetDataForDashBoard())
              .mapToDomain(),
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
  Future<DataState<RemoteGetGrossSalaryAndCurrency>>
      getGrossSalaryAndCurrency() async {
    try {
      TalentLinkHrRequest request =
          await TalentLinkHrRequest().createRequest({});
      final httpResponse =
          await _homeApiService.getGrossSalaryAndCurrency(request);
      if ((httpResponse.data.success ?? false) &&
          (httpResponse.data.statusCode ?? 400) == 200) {
        return DataSuccess(
          data: (httpResponse.data.result ?? RemoteGetGrossSalaryAndCurrency()),
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
