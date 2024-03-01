import 'package:shared_preferences/shared_preferences.dart';

import 'package:talent_link/src/core/resources/shared_preferences_keys.dart';

class SaveWorkHoursUseCase {
  final SharedPreferences sharedPreferences;

  SaveWorkHoursUseCase({required this.sharedPreferences});

  Future<bool?> call(String workHours) async {
    return await sharedPreferences.setString(
        SharedPreferenceKeys.workHours, workHours);
  }
}
