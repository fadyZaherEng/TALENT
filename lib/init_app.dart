import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:gms_check/gms_check.dart';
import 'package:talent_link/firebase_options.dart';
import 'package:talent_link/src/core/utils/HMS_notification_services.dart';
import 'package:talent_link/src/core/utils/device_information.dart';
import 'package:talent_link/src/core/utils/firebase_notification_services.dart';
import 'package:talent_link/src/core/utils/notification_services.dart';
import 'package:talent_link/src/di/injector.dart';

Future<void> initApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  await DeviceInformation().initPlatformState();

  bool isHaveGms = await GmsCheck().checkGmsAvailability() ?? true;

  if (isHaveGms) {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    NotificationServices notificationServices = FirebaseNotificationService();

    await notificationServices.initializeNotificationService();
  } else {
    NotificationServices notificationServices = HMSNotificationServices();

    await notificationServices.initializeNotificationService();
  }
}
