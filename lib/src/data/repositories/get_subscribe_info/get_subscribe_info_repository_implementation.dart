import 'package:dio/dio.dart';

import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/get_subscribe_info/get_subscribe_info_api_service.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/get_subscribe_info/model/remote_get_subscribe_info.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_request.dart';
import 'package:talent_link/src/domain/entities/get_subscribe_info/get_subscribe_info.dart';
import 'package:talent_link/src/domain/repositories/get_subscribe_info/get_subscribe_info_repository.dart';

class GetSubscribeInfoRepositoryImplementation
    extends GetSubscribeInfoRepository {
  final GetSubscribeInfoApiService _getSubscribeInfoApiService;

  GetSubscribeInfoRepositoryImplementation(this._getSubscribeInfoApiService);

  @override
  Future<DataState<GetSubscribeInfo>> getSubscribeInfo({
    required int subscriberId,
    required String subscriberName,
    required String termsAndConditions,
    required String aboutUs,
  }) async {
    try {
      TalentLinkHrRequest request =
          await TalentLinkHrRequest().createRequest({});

      final httpResponse =
          await _getSubscribeInfoApiService.getSubscribeInfo(request);

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
