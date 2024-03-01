import 'package:shared_preferences/shared_preferences.dart';

import 'package:talent_link/src/core/resources/shared_preferences_keys.dart';

class RemoveCheckOutUseCase {
  final SharedPreferences sharedPreferences;

  RemoveCheckOutUseCase(this.sharedPreferences);

  Future<bool> call() async {
    return await sharedPreferences.remove(SharedPreferenceKeys.checkOut);
  }
}
