import 'package:shared_preferences/shared_preferences.dart';

import 'package:talent_link/src/core/resources/shared_preferences_keys.dart';

class SaveCompanyIdUseCase {
  final SharedPreferences sharedPreferences;

  SaveCompanyIdUseCase({required this.sharedPreferences});

  Future<bool?> call(int companyId) async {
    return await sharedPreferences.setInt(
        SharedPreferenceKeys.companyId, companyId);
  }
}
