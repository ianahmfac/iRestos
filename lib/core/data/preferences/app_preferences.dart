import 'package:shared_preferences/shared_preferences.dart';

import '../../app/service_locator.dart';

class AppPreferences {
  AppPreferences._();
  static final instance = AppPreferences._();
  static const NOTIFICATION = 'DAILY_NEWS';

  Future<bool> get isNotificationActive async {
    final prefs = await getIt<Future<SharedPreferences>>();
    return prefs.getBool(NOTIFICATION) ?? false;
  }

  void setNotificationActive(bool value) async {
    final prefs = await getIt<Future<SharedPreferences>>();
    prefs.setBool(NOTIFICATION, value);
  }
}
