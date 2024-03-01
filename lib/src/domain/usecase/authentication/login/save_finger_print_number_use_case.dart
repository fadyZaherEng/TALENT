import 'package:shared_preferences/shared_preferences.dart';

import 'package:talent_link/src/core/resources/shared_preferences_keys.dart';

class SaveFingerPrintNumberUseCase {
  final SharedPreferences sharedPreferences;

  SaveFingerPrintNumberUseCase({required this.sharedPreferences});

  Future<bool?> call(String fingerPrintNumber) async {
    return await sharedPreferences.setString(
        SharedPreferenceKeys.fingerPrintNumber, fingerPrintNumber);
  }
}
