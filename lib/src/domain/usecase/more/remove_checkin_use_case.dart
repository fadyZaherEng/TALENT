import 'package:shared_preferences/shared_preferences.dart';

import 'package:talent_link/src/core/resources/shared_preferences_keys.dart';

class RemoveCheckInUseCase {
  final SharedPreferences sharedPreferences;

  RemoveCheckInUseCase(this.sharedPreferences);

  Future<bool> call() async {
    return await sharedPreferences.remove(SharedPreferenceKeys.checkIn);
  }
}
