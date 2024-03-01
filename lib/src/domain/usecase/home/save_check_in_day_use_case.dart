import 'package:shared_preferences/shared_preferences.dart';

import 'package:talent_link/src/core/resources/shared_preferences_keys.dart';

class SaveCheckInDayUseCase {
  final SharedPreferences _sharedPreferences;

  SaveCheckInDayUseCase(this._sharedPreferences);

  Future<void> call(int checkInDay) async {
    await _sharedPreferences.setInt(
        SharedPreferenceKeys.checkInDay, checkInDay);
  }
}
