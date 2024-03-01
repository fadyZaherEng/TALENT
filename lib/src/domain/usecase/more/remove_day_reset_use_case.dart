import 'package:shared_preferences/shared_preferences.dart';

import 'package:talent_link/src/core/resources/shared_preferences_keys.dart';

class RemoveResetDayUseCase {
  final SharedPreferences sharedPreferences;

  RemoveResetDayUseCase(this.sharedPreferences);

  Future<bool> call() async {
    return await sharedPreferences.remove(SharedPreferenceKeys.checkInDay);
  }
}
