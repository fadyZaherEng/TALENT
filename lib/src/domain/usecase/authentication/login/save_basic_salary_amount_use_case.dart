import 'package:shared_preferences/shared_preferences.dart';

import 'package:talent_link/src/core/resources/shared_preferences_keys.dart';

class SaveBasicSalaryAmountUseCase {
  final SharedPreferences sharedPreferences;

  SaveBasicSalaryAmountUseCase({required this.sharedPreferences});

  Future<bool?> call(int basicSalaryAmount) async {
    return await sharedPreferences.setInt(
        SharedPreferenceKeys.basicSalaryAmount, basicSalaryAmount);
  }
}
