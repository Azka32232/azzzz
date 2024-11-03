import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'screens/mainmenu_screen.dart';
import 'services/auth_service.dart';

void main() async {
  // Pastikan binding diinisialisasi
  WidgetsFlutterBinding.ensureInitialized();
  
  // Inisialisasi AuthService menggunakan singleton pattern
  final authService = await AuthService.getInstance();
  
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
        // Konfigurasi tema aplikasi
        appBarTheme: const AppBarTheme(
          elevation: 0,
          centerTitle: true,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
        ),
      ),
      // Set route awal ke login
      initialRoute: '/login',
      routes: {
        '/login': (context) =>  LoginScreen(),
        '/register': (context) =>  RegisterScreen(),
        '/mainmenu': (context) =>  MainmenuScreen(),
      },
      // Handle route yang tidak terdaftar
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text('Halaman tidak ditemukan'),
            ),
          ),
        );
      },
      // Handler untuk sharing AuthService ke seluruh aplikasi
      builder: (context, child) {
        return _InheritedAuthService(
          authService: authService,
          child: child!,
        );
      },
    );
  }
}

// Widget untuk menyediakan AuthService ke seluruh aplikasi
class _InheritedAuthService extends InheritedWidget {
  final AuthService authService;

  const _InheritedAuthService({
    Key? key,
    required this.authService,
    required Widget child,
  }) : super(key: key, child: child);

  static AuthService of(BuildContext context) {
    final widget = context.dependOnInheritedWidgetOfExactType<_InheritedAuthService>();
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

// Extension untuk memudahkan akses AuthService
extension AuthServiceContext on BuildContext {
  AuthService get authService => _InheritedAuthService.of(this);
}