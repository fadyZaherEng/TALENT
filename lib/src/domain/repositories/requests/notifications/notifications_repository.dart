import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/domain/entities/notifications/notifications.dart';

abstract class NotificationsRepository {
  Future<DataState<List<Notifications>>> notifications();
}
