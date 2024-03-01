import 'package:shared_preferences/shared_preferences.dart';

import 'package:talent_link/src/core/resources/shared_preferences_keys.dart';

class SaveTotalAllowanceUseCase {
  final SharedPreferences sharedPreferences;

  SaveTotalAllowanceUseCase({required this.sharedPreferences});

  Future<bool?> call(int totalAllowance) async {
    return await sharedPreferences.setInt(
        SharedPreferenceKeys.totalAllowance, totalAllowance);
  }
}
