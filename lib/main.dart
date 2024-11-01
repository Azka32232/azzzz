import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'screens/mainmenu_screen.dart';
import 'services/auth_service.dart';

void main() async {
  // Pastikan binding diinisialisasi
  WidgetsFlutterBinding.ensureInitialized();

  // Inisialisasi SharedPreferences
  final prefs = await SharedPreferences.getInstance();
  final authService = AuthService(prefs);

  runApp(MyApp(authService: authService));
}

class MyApp extends StatelessWidget {
  final AuthService authService;

  const MyApp({
    Key? key,
    required this.authService,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Berita',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(
          elevation: 0,
          centerTitle: true,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            minimumSize: Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        ),
      ),
      // Mengubah initialRoute selalu ke login
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/mainmenu': (context) => MainmenuScreen(),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: Text('Halaman tidak ditemukan'),
            ),
          ),
        );
      },
      builder: (context, child) {
        return _InheritedAuthService(
          authService: authService,
          child: child!,
        );
      },
    );
  }
}

class _InheritedAuthService extends InheritedWidget {
  final AuthService authService;

  const _InheritedAuthService({
    Key? key,
    required this.authService,
    required Widget child,
  }) : super(key: key, child: child);

  static AuthService of(BuildContext context) {
    final widget =
        context.dependOnInheritedWidgetOfExactType<_InheritedAuthService>();
    if (widget == null) {
      throw Exception('AuthService not found in context');
    }
    return widget.authService;
  }

  @override
  bool updateShouldNotify(_InheritedAuthService oldWidget) {
    return false;
  }
}

extension AuthServiceContext on BuildContext {
  AuthService get authService => _InheritedAuthService.of(this);
}
