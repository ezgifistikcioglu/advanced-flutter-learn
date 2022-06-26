import 'package:shared_preferences/shared_preferences.dart';

import 'shared_not_initialize.dart';

enum SharedKeys { counter }

class SharedManager {
  SharedPreferences? preferences;

  SharedManager() {
    init();
  }

  Future<void> init() async {
    preferences = await SharedPreferences.getInstance();
  }

  void _checkPreferences() {
    if (preferences == null) {
      throw SharedNotInitializeException();
    }
  }

  Future<void> saveString(SharedKeys key, String value) async {
    // Obtain shared preferences.
    //final prefs = await SharedPreferences.getInstance();
    _checkPreferences();
    await preferences?.setString(key.name, value);
  }

  Future<String?> getString(SharedKeys key) async {
    _checkPreferences();
    return preferences?.getString(key.name);
  }

  Future<bool> removeItem(SharedKeys key) async {
    _checkPreferences();
    return (await preferences?.remove(key.name)) ?? false;
  }
}
