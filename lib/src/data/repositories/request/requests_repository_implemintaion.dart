import 'package:dio/dio.dart';

import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/request/model/remote_submenu.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/request/request/requests_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_request.dart';
import 'package:talent_link/src/domain/entities/request/request.dart';
import 'package:talent_link/src/domain/repositories/request/requests_repository.dart';
import '../../sources/remote/talent_link_hr/request/request_api_service.dart';

class RequestsRepositoryImplementation extends RequestsRepository {
  final RequestsApiService _requestsApiService;

  RequestsRepositoryImplementation(this._requestsApiService);

  @override
  Future<DataState<List<Request>>> getESSPermission(
      {required int userTypeId}) async {
    try {
      TalentLinkHrRequest<RequestsRequest> request =
          await TalentLinkHrRequest<RequestsRequest>()
              .createRequest(RequestsRequest(userTypeId: userTypeId));

      final httpResponse = await _requestsApiService.getESSPermission(request);

      if ((httpResponse.data.success ?? false) &&
          (httpResponse.data.statusCode ?? 400) == 200) {
        return DataSuccess(
          data: (httpResponse.data.result!.remoteSubmenu ?? [])
              .remoteSubmenuToDomain(),
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
