import 'package:shared_preferences/shared_preferences.dart';

import 'package:talent_link/src/core/resources/shared_preferences_keys.dart';

class SaveSubscriberIdUseCase {
  final SharedPreferences sharedPreferences;

  SaveSubscriberIdUseCase({required this.sharedPreferences});

  Future<bool?> call(int subscriberId) async {
    return await sharedPreferences.setInt(
        SharedPreferenceKeys.subscriberId, subscriberId);
  }
}
