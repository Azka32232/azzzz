import 'package:flutter/material.dart';

class CategoryTab extends StatelessWidget {
  final List<Map<String, dynamic>> categories = [
    {'name': 'Politik', 'icon': Icons.gavel},
    {'name': 'Ekonomi', 'icon': Icons.monetization_on},
    {'name': 'Olahraga', 'icon': Icons.sports_soccer},
    {'name': 'Teknologi', 'icon': Icons.computer},
    {'name': 'Kesehatan', 'icon': Icons.health_and_safety},
    {'name': 'Hiburan', 'icon': Icons.movie},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kategori'),
      ),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: ListTile(
              leading: Icon(
                categories[index]['icon'],
                color: Colors.blue,
              ),
              title: Text(categories[index]['name']),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Implementasi navigasi ke kategori yang dipilih
              },
            ),
          );
        },
      ),
    );
  }
}
