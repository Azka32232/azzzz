import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static const String _keyEmail = 'email';
  static const String _keyPassword = 'password';
  static const String _keyIsLoggedIn = 'isLoggedIn';

  final SharedPreferences _prefs;

  AuthService(this._prefs);

  // Simpan data login
  Future<bool> saveLoginData({
    required String email,
    required String password,
  }) async {
    try {
      await _prefs.setString(_keyEmail, email);
      await _prefs.setString(_keyPassword, password);
      await _prefs.setBool(_keyIsLoggedIn, true);
      return true;
    } catch (e) {
      print('Error saving login data: $e');
      return false;
    }
  }

  // Cek status login
  bool isLoggedIn() {
    return _prefs.getBool(_keyIsLoggedIn) ?? false;
  }

  // Ambil data email
  String? getEmail() {
    return _prefs.getString(_keyEmail);
  }

  // Ambil data password
  String? getPassword() {
    return _prefs.getString(_keyPassword);
  }

  // Hapus data login (logout)
  Future<bool> logout() async {
    try {
      await _prefs.remove(_keyEmail);
      await _prefs.remove(_keyPassword);
      await _prefs.setBool(_keyIsLoggedIn, false);
      return true;
    } catch (e) {
      print('Error during logout: $e');
      return false;
    }
  }

  // Update data akun
  Future<bool> updateAccount({
    String? newEmail,
    String? newPassword,
  }) async {
    try {
      if (newEmail != null) {
        await _prefs.setString(_keyEmail, newEmail);
      }
      if (newPassword != null) {
        await _prefs.setString(_keyPassword, newPassword);
      }
      return true;
    } catch (e) {
      print('Error updating account: $e');
      return false;
    }
  }
}
