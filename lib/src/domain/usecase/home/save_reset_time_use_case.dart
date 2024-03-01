import 'package:shared_preferences/shared_preferences.dart';

import 'package:talent_link/src/core/resources/shared_preferences_keys.dart';

class SaveResetTimeUseCase {
  final SharedPreferences sharedPreferences;

  SaveResetTimeUseCase({required this.sharedPreferences});

  Future<bool?> call(String resetTime) async {
    return await sharedPreferences.setString(
        SharedPreferenceKeys.resetTime, resetTime);
  }
}
