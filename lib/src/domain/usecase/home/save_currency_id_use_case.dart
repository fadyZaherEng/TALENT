import 'package:shared_preferences/shared_preferences.dart';

import 'package:talent_link/src/core/resources/shared_preferences_keys.dart';

class SaveCurrencyIdUseCase {
  final SharedPreferences sharedPreferences;

  SaveCurrencyIdUseCase({required this.sharedPreferences});

  Future<bool?> call(int currencyId) async {
    return await sharedPreferences.setInt(
        SharedPreferenceKeys.currencyId, currencyId);
  }
}
