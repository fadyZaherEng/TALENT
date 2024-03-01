import 'package:shared_preferences/shared_preferences.dart';

import 'package:talent_link/src/core/resources/shared_preferences_keys.dart';

class SaveNotificationStatusUseCase {
  final SharedPreferences sharedPreferences;

  SaveNotificationStatusUseCase({required this.sharedPreferences});

  Future<bool?> call(bool status) async {
    return await sharedPreferences.setBool(
        SharedPreferenceKeys.notificationStatus, status);
  }
}
