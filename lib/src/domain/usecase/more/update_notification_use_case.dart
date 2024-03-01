import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/domain/repositories/more/update_notification/update_notification_repository.dart';

class UpdateNotificationUseCase {
  final UpdateNotificationRepository _updateNotificationRepository;

  UpdateNotificationUseCase(
    this._updateNotificationRepository,
  );

  Future<DataState<bool>> call({
    required int isAllowedNotification,
  }) async {
    return await _updateNotificationRepository.updateNotification(
      isAllowedNotification: isAllowedNotification,
    );
  }
}
