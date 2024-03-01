import 'package:shared_preferences/shared_preferences.dart';

import 'package:talent_link/src/core/resources/shared_preferences_keys.dart';

class SaveCheckOutUseCase {
  final SharedPreferences sharedPreferences;

  SaveCheckOutUseCase({required this.sharedPreferences});

  Future<bool?> call(String checkOut) async {
    return await sharedPreferences.setString(
        SharedPreferenceKeys.checkOut, checkOut);
  }
}
