import 'package:shared_preferences/shared_preferences.dart';

import 'package:talent_link/src/core/resources/shared_preferences_keys.dart';

class SaveGrossSalaryUseCase {
  final SharedPreferences sharedPreferences;

  SaveGrossSalaryUseCase({required this.sharedPreferences});

  Future<bool?> call(int grossSalary) async {
    return await sharedPreferences.setInt(
        SharedPreferenceKeys.grossSalary, grossSalary);
  }
}
