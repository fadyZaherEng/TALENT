import 'package:dio/dio.dart';

import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/get_time_line/get_time_line_api_service.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/get_time_line/model/get_time_line_remote.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/get_time_line/request/get_time_line_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_request.dart';
import 'package:talent_link/src/domain/entities/get_time_line/get_time_line.dart';
import 'package:talent_link/src/domain/repositories/get_time_line/get_time_line_repository.dart';

class GetTimeLineRepositoryImplementation extends GetTimeLineRepository {
  final GetTimeLineApiService _getTimeLineApiService;

  GetTimeLineRepositoryImplementation(this._getTimeLineApiService);

  @override
  Future<DataState<List<GetTimeLine>>> getTimeLine({
    required int tableId,
    required int transactionId,
    required String baseUrl,
  }) async {
    try {
      TalentLinkHrRequest<GetTimeLineRequest> request =
          await TalentLinkHrRequest<GetTimeLineRequest>().createRequest(
              GetTimeLineRequest(
                  baseUrl: baseUrl,
                  tableId: tableId,
                  transactionId: transactionId));

      final httpResponse = await _getTimeLineApiService.getTimeLine(request);

      if ((httpResponse.data.success ?? false) &&
          (httpResponse.data.statusCode ?? 400) == 200) {
        return DataSuccess(
          data: (httpResponse.data.result ?? []).mapTimeLineListToDomain(),
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
