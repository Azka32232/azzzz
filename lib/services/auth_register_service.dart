import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static AuthService? _instance;
  static SharedPreferences? _prefs;

  // Private constructor
  AuthService._();

  static Future<AuthService> getInstance() async {
    if (_instance == null) {
      _prefs = await SharedPreferences.getInstance();
      _instance = AuthService._();
    }
    return _instance!;
  }

  static const String _keyName = 'name';
  static const String _keyEmail = 'email';
  static const String _keyPassword = 'password';
  static const String _keyIsLoggedIn = 'isLoggedIn';

  // Fungsi register
  Future<bool> register({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      await _prefs?.setString(_keyName, name);
      await _prefs?.setString(_keyEmail, email);
      await _prefs?.setString(_keyPassword, password);
      await _prefs?.setBool(_keyIsLoggedIn, true);
      return true;
    } catch (e) {
      print('Error during registration: $e');
      return false;
    }
  }

  // Fungsi untuk mendapatkan nama user
  String? getName() {
    return _prefs?.getString(_keyName);
  }

  // Fungsi lainnya tetap sama seperti sebelumnya...
}
