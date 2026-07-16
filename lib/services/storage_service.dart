import 'package:shared_preferences/shared_preferences.dart';
import '../core/constants/app_strings.dart';

class StorageService {
  static StorageService? _instance;
  static SharedPreferences? _preferences;

  StorageService._();

  static Future<StorageService> getInstance() async {
    _instance ??= StorageService._();
    _preferences ??= await SharedPreferences.getInstance();
    return _instance!;
  }

  // Write Data
  Future<bool> setString(String key, String value) async {
    return await _preferences?.setString(key, value) ?? false;
  }

  Future<bool> setBool(String key, bool value) async {
    return await _preferences?.setBool(key, value) ?? false;
  }

  Future<bool> setInt(String key, int value) async {
    return await _preferences?.setInt(key, value) ?? false;
  }

  // Read Data
  String? getString(String key) {
    return _preferences?.getString(key);
  }

  bool? getBool(String key) {
    return _preferences?.getBool(key);
  }

  int? getInt(String key) {
    return _preferences?.getInt(key);
  }

  // Remove Data
  Future<bool> remove(String key) async {
    return await _preferences?.remove(key) ?? false;
  }

  // Clear Preferences
  Future<bool> clear() async {
    return await _preferences?.clear() ?? false;
  }

  // Helper getters/setters for Login State, Token and Theme Mode
  bool get isLoggedIn => getBool(AppStrings.keyIsLoggedIn) ?? false;
  
  Future<bool> setLoggedIn(bool value) async {
    return await setBool(AppStrings.keyIsLoggedIn, value);
  }

  String? get authToken => getString(AppStrings.keyAuthToken);
  
  Future<bool> setAuthToken(String token) async {
    return await setString(AppStrings.keyAuthToken, token);
  }

  bool get isDarkMode => getBool(AppStrings.keyThemeMode) ?? false;
  
  Future<bool> setDarkMode(bool value) async {
    return await setBool(AppStrings.keyThemeMode, value);
  }

  bool get isFirstTime => getBool(AppStrings.keyIsFirstTime) ?? true;

  Future<bool> setFirstTime(bool value) async {
    return await setBool(AppStrings.keyIsFirstTime, value);
  }
}
