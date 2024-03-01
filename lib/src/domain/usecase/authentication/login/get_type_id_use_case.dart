import 'package:shared_preferences/shared_preferences.dart';

import 'package:talent_link/src/core/resources/shared_preferences_keys.dart';

class GetTypeIdUseCase {
  final SharedPreferences _sharedPreferences;

  GetTypeIdUseCase(this._sharedPreferences);

  Future<int> call() async {
    return _sharedPreferences.getInt(SharedPreferenceKeys.userTypeId) ?? 0;
  }
}
