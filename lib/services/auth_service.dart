import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static const String _keyEmail = 'email';
  static const String _keyPassword = 'password';
  static const String _keyIsLoggedIn = 'isLoggedIn';
  static const String _keyName = 'name';  // Tambah key untuk nama user

  final SharedPreferences _prefs;
  
  // Private constructor
  AuthService._(this._prefs);
  
  // Singleton pattern implementation
  static AuthService? _instance;
  
  // Get instance method untuk singleton
  static Future<AuthService> getInstance() async {
    if (_instance == null) {
      final prefs = await SharedPreferences.getInstance();
      _instance = AuthService._(prefs);
    }
    return _instance!;
  }

  // Method untuk login
  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    try {
      // Cek apakah email dan password cocok dengan yang tersimpan
      String? savedEmail = _prefs.getString(_keyEmail);
      String? savedPassword = _prefs.getString(_keyPassword);

      if (savedEmail == null || savedPassword == null) {
        return {
          'success': false,
          'message': 'Akun tidak ditemukan'
        };
      }

      if (email == savedEmail && password == savedPassword) {
        // Set status login menjadi true
        await _prefs.setBool(_keyIsLoggedIn, true);
        
        return {
          'success': true,
          'message': 'Login berhasil',
          'data': {
            'email': savedEmail,
            'name': _prefs.getString(_keyName)
          }
        };
      } else {
        return {
          'success': false,
          'message': 'Email atau password salah'
        };
      }
    } catch (e) {
      return {
        'success': false,
        'message': 'Terjadi kesalahan: ${e.toString()}'
      };
    }
  }

  // Method untuk register
  Future<Map<String, dynamic>> register({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      // Cek apakah email sudah terdaftar
      String? existingEmail = _prefs.getString(_keyEmail);
      if (existingEmail != null) {
        return {
          'success': false,
          'message': 'Email sudah terdaftar'
        };
      }

      // Simpan data registrasi
      await _prefs.setString(_keyName, name);
      await _prefs.setString(_keyEmail, email);
      await _prefs.setString(_keyPassword, password);
      await _prefs.setBool(_keyIsLoggedIn, true);

      return {
        'success': true,
        'message': 'Registrasi berhasil',
        'data': {
          'name': name,
          'email': email
        }
      };
    } catch (e) {
      return {
        'success': false,
        'message': 'Terjadi kesalahan: ${e.toString()}'
      };
    }
  }

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

  // Ambil data nama user
  String? getName() {
    return _prefs.getString(_keyName);
  }

  // Method untuk sign out
  Future<bool> signOut() async {
    try {
      await _prefs.setBool(_keyIsLoggedIn, false);
      return true;
    } catch (e) {
      print('Error during sign out: $e');
      return false;
    }
  }

  // Hapus data login (logout) - menghapus semua data
  Future<bool> logout() async {
    try {
      await _prefs.remove(_keyEmail);
      await _prefs.remove(_keyPassword);
      await _prefs.remove(_keyName);
      await _prefs.setBool(_keyIsLoggedIn, false);
      return true;
    } catch (e) {
      print('Error during logout: $e');
      return false;
    }
  }

  // Update data akun
  Future<bool> updateAccount({
    String? newName,
    String? newEmail,
    String? newPassword,
  }) async {
    try {
      if (newName != null) {
        await _prefs.setString(_keyName, newName);
      }
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