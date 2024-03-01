import 'package:shared_preferences/shared_preferences.dart';

import 'package:talent_link/src/core/resources/shared_preferences_keys.dart';

class GetSubscriberIdUseCase {
  SharedPreferences sharedPreferences;

  GetSubscriberIdUseCase({required this.sharedPreferences});

  Future<int?> call() async {
    return  sharedPreferences.getInt(SharedPreferenceKeys.subscriberId);
  }
}
