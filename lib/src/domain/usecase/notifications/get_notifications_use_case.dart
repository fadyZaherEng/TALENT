import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/domain/entities/notifications/notifications.dart';
import 'package:talent_link/src/domain/repositories/requests/notifications/notifications_repository.dart';

class GetNotificationsUseCase {
  final NotificationsRepository _repository;

  GetNotificationsUseCase(this._repository);

  Future<DataState<List<Notifications>>> call() async {
    return await _repository.notifications();
  }
}
