import 'package:shared_preferences/shared_preferences.dart';

import 'package:talent_link/src/core/resources/shared_preferences_keys.dart';

class GetNotificationStatusUseCase {
  SharedPreferences sharedPreferences;

  GetNotificationStatusUseCase({required this.sharedPreferences});

  Future<bool?> call() async {
    return sharedPreferences.getBool(SharedPreferenceKeys.notificationStatus);
  }
}
