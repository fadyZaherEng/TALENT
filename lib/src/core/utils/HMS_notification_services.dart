import 'dart:convert';

import 'package:huawei_push/huawei_push.dart';
import 'package:rxdart/rxdart.dart';

import 'package:talent_link/src/core/utils/notification_services.dart';
import 'package:talent_link/src/di/data_layer_injector.dart';
import 'package:talent_link/src/domain/usecase/firebase_notification/save_firebase_notification_token_usecase.dart';

class HMSNotificationServices extends NotificationServices {
  String _token = "";

  @override
  static BehaviorSubject<String>? onNotificationClick;

  @override
  Future<void> initializeNotificationService() async {
    await Push.setAutoInitEnabled(true);

    Push.enableLogger();
    Push.turnOnPush();

    Push.getToken("");
    Push.getTokenStream.listen(
      _onTokenEvent,
    );
    onNotificationClick = BehaviorSubject<String>();

    Push.onNotificationOpenedApp.listen(
      _onNotificationOpenedApp,
    );

    var initialNotification = await Push.getInitialNotification();
    _onNotificationOpenedApp(initialNotification);

    Push.onMessageReceivedStream.listen(
      _onMessageReceived,
    );

    await Push.registerBackgroundMessageHandler(
      backgroundMessageCallback,
    );
  }

  void _onNotificationOpenedApp(dynamic remoteMessage) {
    if (remoteMessage != null) {
      Map<String, dynamic> remoteNotification = {
        "transactionId": remoteMessage["extras"]['transactionId'],
        "message": remoteMessage["extras"]['message'],
        "viewId": remoteMessage["extras"]['viewId'],
        "requestTypeId": remoteMessage["extras"]['requestTypeId'],
      };
      onNotificationClick?.add(json.encode(remoteNotification));
    }
  }

  static void backgroundMessageCallback(RemoteMessage remoteMessage) async {
    String? data = remoteMessage.data;

    Map<String, dynamic> remoteNotification = {
      "transactionId": remoteMessage.dataOfMap?['transactionId'],
      "message": remoteMessage.dataOfMap?['message'],
      "viewId": remoteMessage.dataOfMap?['viewId'],
      "requestTypeId": remoteMessage.dataOfMap?['requestTypeId'],
    };
    if (data != null) {
      onNotificationClick?.add(json.encode(remoteNotification));
    }
  }

  void _onMessageReceived(RemoteMessage remoteMessage) {
    String? data = remoteMessage.data;
    Map<String, dynamic> remoteNotification = {
      "transactionId": remoteMessage.dataOfMap?['transactionId'],
      "message": remoteMessage.dataOfMap?['message'],
      "viewId": remoteMessage.dataOfMap?['viewId'],
      "requestTypeId": remoteMessage.dataOfMap?['requestTypeId'],
    };
    if (data != null) {
      onNotificationClick?.add(json.encode(remoteNotification));
    }
  }

  void _onTokenEvent(Object event) async {
    _token = event.toString();
    await SaveFirebaseNotificationTokenUseCase(sharedPreferences: injector())(
        firebaseNotificationToken: _token);
  }
}
