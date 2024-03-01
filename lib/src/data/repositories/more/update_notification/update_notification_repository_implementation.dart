import 'package:dio/dio.dart';

import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/more/update_notification/request/update_notification_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/more/update_notification/update_notification_api_service.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_request.dart';
import 'package:talent_link/src/domain/repositories/more/update_notification/update_notification_repository.dart';

class UpdateNotificationRepositoryImplementation
    extends UpdateNotificationRepository {
  final UpdateNotificationApiService _updateNotificationApiService;

  UpdateNotificationRepositoryImplementation(
    this._updateNotificationApiService,
  );

  @override
  Future<DataState<bool>> updateNotification({
    required int isAllowedNotification,
  }) async {
    try {
      TalentLinkHrRequest<UpdateNotificationRequest> request =
          await TalentLinkHrRequest<UpdateNotificationRequest>().createRequest(
        UpdateNotificationRequest(
          isAllowedNotification: isAllowedNotification,
        ),
      );
      final httpResponse =
          await _updateNotificationApiService.updateNotification(request);

      if ((httpResponse.data.success ?? false) &&
          (httpResponse.data.statusCode ?? 400) == 200) {
        return DataSuccess(
          data: httpResponse.data.result,
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
