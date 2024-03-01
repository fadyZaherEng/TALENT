import 'package:shared_preferences/shared_preferences.dart';

import 'package:talent_link/src/core/resources/shared_preferences_keys.dart';

class SaveCheckInUseCase {
  final SharedPreferences sharedPreferences;

  SaveCheckInUseCase({required this.sharedPreferences});

  Future<bool?> call(String checkIn) async {
    return await sharedPreferences.setString(
        SharedPreferenceKeys.checkIn, checkIn);
  }
}
