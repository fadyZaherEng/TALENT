import 'package:shared_preferences/shared_preferences.dart';

import 'package:talent_link/src/core/resources/shared_preferences_keys.dart';

class SaveLanguageUseCase {
  final SharedPreferences sharedPreferences;

  SaveLanguageUseCase({required this.sharedPreferences});

  Future<bool?> call(String language) async {
    return await sharedPreferences.setString(
        SharedPreferenceKeys.language, language);
  }
}
