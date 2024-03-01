import 'package:shared_preferences/shared_preferences.dart';

import 'package:talent_link/src/core/resources/shared_preferences_keys.dart';

class SaveEmployeeIdUseCase {
  final SharedPreferences sharedPreferences;

  SaveEmployeeIdUseCase({required this.sharedPreferences});

  Future<bool?> call(int employeeId) async {
    return await sharedPreferences.setInt(
        SharedPreferenceKeys.employeeId, employeeId);
  }
}
