import 'package:talent_link/src/core/resources/data_state.dart';

abstract class UpdateNotificationRepository {
  Future<DataState<bool>> updateNotification({
    required int isAllowedNotification,
  });
}
