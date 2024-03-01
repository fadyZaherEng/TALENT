import 'package:rxdart/rxdart.dart';

abstract class NotificationServices {
  Future<void> initializeNotificationService();

  static BehaviorSubject<String>? onNotificationClick;
}
