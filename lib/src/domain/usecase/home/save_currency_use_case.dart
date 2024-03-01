import 'package:shared_preferences/shared_preferences.dart';

import 'package:talent_link/src/core/resources/shared_preferences_keys.dart';

class SaveCurrencyUseCase {
  final SharedPreferences sharedPreferences;

  SaveCurrencyUseCase({required this.sharedPreferences});

  Future<bool?> call(String currency) async {
    return await sharedPreferences.setString(
        SharedPreferenceKeys.currency, currency);
  }
}
