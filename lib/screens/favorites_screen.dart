import 'package:flutter/material.dart';
import 'news_detail_screen.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Map<String, String>> favorites = [
    {
      'title': 'Stored: Pest outbreak in Mbale affecting Maize yields',
      'image': 'assets/pest_outbreak.jpg',
      'details':
          'A severe pest outbreak has been reported in Mbale district affecting maize yields...',
    },
    {
      'title': 'Stored: Upcoming heavy rains in Western Uganda',
      'image': 'assets/rain_forecast.jpg',
      'details':
          'Heavy rains are forecasted in the western region next week...',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Favorites')),
      body: favorites.isEmpty
          ? Center(child: Text('No bookmarks yet.'))
          : ListView.builder(
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: Image.asset(
                      favorites[index]['image']!,
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                    title: Text(favorites[index]['title']!),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NewsDetailScreen(
                            title: favorites[index]['title']!,
                            details: favorites[index]['details']!,
                            image: favorites[index]['image']!,
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
    );
  }
}
