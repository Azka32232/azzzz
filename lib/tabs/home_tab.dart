import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Portal Berita'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Terbaru'),
              Tab(text: 'Populer'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Tab Terbaru
            ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.all(8),
                  child: ListTile(
                    leading: Container(
                      width: 60,
                      height: 60,
                      color: Colors.grey[300],
                      child: Icon(Icons.image),
                    ),
                    title: Text('Berita Terbaru ${index + 1}'),
                    subtitle: Text('Deskripsi singkat berita terbaru ${index + 1}'),
                    onTap: () {
                      // Implementasi navigasi ke detail berita
                    },
                  ),
                );
              },
            ),
            // Tab Populer
            ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.all(8),
                  child: ListTile(
                    leading: Container(
                      width: 60,
                      height: 60,
                      color: Colors.grey[300],
                      child: Icon(Icons.image),
                    ),
                    title: Text('Berita Populer ${index + 1}'),
                    subtitle: Text('Deskripsi singkat berita populer ${index + 1}'),
                    onTap: () {
                      // Implementasi navigasi ke detail berita
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}