import 'package:shared_preferences/shared_preferences.dart';

import 'package:talent_link/src/core/resources/shared_preferences_keys.dart';

class SaveNumberOfDigitsUseCase {
  final SharedPreferences sharedPreferences;

  SaveNumberOfDigitsUseCase({required this.sharedPreferences});

  Future<bool?> call(int numberOfDigits) async {
    return await sharedPreferences.setInt(
      SharedPreferenceKeys.numberOfDigits,
      numberOfDigits,
    );
  }
}
