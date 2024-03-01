import 'package:dio/dio.dart';

import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/notifications/model/remote_notifications.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/notifications/notifications_api_service.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_request.dart';
import 'package:talent_link/src/domain/entities/notifications/notifications.dart';
import 'package:talent_link/src/domain/repositories/requests/notifications/notifications_repository.dart';

class NotificationsRepositoryImplementation extends NotificationsRepository {
  final NotificationsApiService _notificationsApiService;

  NotificationsRepositoryImplementation(this._notificationsApiService);

  @override
  Future<DataState<List<Notifications>>> notifications() async {
    try {
      TalentLinkHrRequest request =
          await TalentLinkHrRequest().createRequest({});

      final httpResponse =
          await _notificationsApiService.notifications(request);

      if ((httpResponse.data.success ?? false) &&
          (httpResponse.data.statusCode ?? 400) == 200) {
        return DataSuccess(
          data: (httpResponse.data.result ?? []).mapNotificationsToDomain(),
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
