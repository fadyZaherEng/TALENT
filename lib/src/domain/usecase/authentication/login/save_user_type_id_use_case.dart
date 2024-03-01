import 'package:shared_preferences/shared_preferences.dart';

import 'package:talent_link/src/core/resources/shared_preferences_keys.dart';

class SaveUserTypeIdUseCase {
  final SharedPreferences sharedPreferences;

  SaveUserTypeIdUseCase({required this.sharedPreferences});

  Future<bool?> call(int userTypeId) async {
    return await sharedPreferences.setInt(
        SharedPreferenceKeys.userTypeId, userTypeId);
  }
}
