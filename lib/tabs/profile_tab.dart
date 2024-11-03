import 'package:flutter/material.dart';
import 'package:myapp/screens/login_screen.dart';
import 'package:myapp/services/auth_service.dart';

class ProfileTab extends StatefulWidget {
  @override
  _ProfileTabState createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  late AuthService _authService;
  String _userName = '';
  String _userEmail = '';

  @override
  void initState() {
    super.initState();
    _initializeAuthService();
  }

  Future<void> _initializeAuthService() async {
    _authService = await AuthService.getInstance();
    // Ambil data user yang sedang login
    setState(() {
      _userName = _authService.getName() ?? 'Nama Pengguna';
      _userEmail = _authService.getEmail() ?? 'user@email.com';
    });
  }

  Future<void> _logout(BuildContext context) async {
    try {
      final success = await _authService.signOut();

      if (success) {
        // Jika signOut berhasil, navigasi ke login screen
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => LoginScreen()),
          (Route<dynamic> route) => false, // Hapus semua route sebelumnya
        );
      } else {
        // Jika signOut gagal
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Gagal keluar. Silakan coba lagi.'),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Terjadi kesalahan: ${e.toString()}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil'),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // Implementasi navigasi ke halaman pengaturan
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.grey[300],
              child: Icon(
                Icons.person,
                size: 50,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 16),
            Text(
              _userName,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              _userEmail,
              style: TextStyle(
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 24),
            ListTile(
              leading: Icon(Icons.edit),
              title: Text('Edit Profil'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Implementasi navigasi ke edit profil
              },
            ),
            ListTile(
              leading: Icon(Icons.bookmark),
              title: Text('Berita Tersimpan'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Implementasi navigasi ke berita tersimpan
              },
            ),
            ListTile(
              leading: Icon(Icons.history),
              title: Text('Riwayat Bacaan'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Implementasi navigasi ke riwayat bacaan
              },
            ),
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text('Notifikasi'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Implementasi navigasi ke pengaturan notifikasi
              },
            ),
            ListTile(
              leading: Icon(Icons.logout, color: Colors.red),
              title: Text(
                'Keluar',
                style: TextStyle(color: Colors.red),
              ),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Konfirmasi Keluar'),
                      content: Text('Apakah Anda yakin ingin keluar?'),
                      actions: [
                        OverflowBar(
                          alignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              minimumSize: Size(120, 40), // Set lebar minimal yang sama
                            ), 
                            child: Text('Keluar'),
                            onPressed: () {
                              Navigator.of(context).pop(); // Tutup dialog
                              _logout(context); // Panggil method logout
                            },
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.blue,
                                minimumSize: Size(120, 40), // Set lebar minimal yang sama
                              ),
                              child: Text('Batal'),
                              onPressed: () {
                                Navigator.of(context).pop(); // Tutup dialog
                              },
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
