import 'package:flutter/material.dart';

class ProfileTab extends StatelessWidget {
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
              'Nama Pengguna',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'user@email.com',
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
                // Implementasi logout
              },
            ),
          ],
        ),
      ),
    );
  }
}