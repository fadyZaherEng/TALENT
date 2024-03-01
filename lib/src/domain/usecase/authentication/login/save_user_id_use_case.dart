import 'package:shared_preferences/shared_preferences.dart';

import 'package:talent_link/src/core/resources/shared_preferences_keys.dart';

class SaveUserIdUseCase {
  final SharedPreferences sharedPreferences;

  SaveUserIdUseCase({required this.sharedPreferences});

  Future<bool?> call(int userId) async {
    return await sharedPreferences.setInt(
        SharedPreferenceKeys.userId, userId);
  }
}
