import 'package:shared_preferences/shared_preferences.dart';

import 'package:talent_link/src/core/resources/shared_preferences_keys.dart';

class SaveUserNameUseCase {
  final SharedPreferences sharedPreferences;

  SaveUserNameUseCase({required this.sharedPreferences});

  Future<bool?> call(String userName) async {
    return await sharedPreferences.setString(
        SharedPreferenceKeys.userName, userName);
  }
}
