import 'package:flutter/material.dart';
import 'news_detail_screen.dart';
import 'widgets/main_scaffold.dart';

class LatestNewsScreen extends StatelessWidget {
  final List<Map<String, String>> news = [
    {
      'title': 'Pest outbreak in Mbale affecting Maize yields',
      'image': 'assets/pest_outbreak.jpg',
      'details':
          'A severe pest outbreak has been reported in Mbale district affecting maize yields. Farmers are advised to inspect their crops regularly and apply recommended pesticides.',
    },
    {
      'title': 'Ugandan coffee exports rise by 20%',
      'image': 'assets/coffee_export.jpg',
      'details':
          'Ugandan coffee exports have risen by 20% due to improved market access and favorable weather conditions. Farmers are expected to benefit from the increased revenue.',
    },
    {
      'title': 'Upcoming heavy rains in Western Uganda',
      'image': 'assets/rain_forecast.jpg',
      'details':
          'The meteorological department has forecasted heavy rains in the western region next week. Farmers should plan accordingly.',
    },
  ];
//do not touch this
  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      title: 'Latest News',
      activeIndex: 2,
      body: ListView.builder(
        itemCount: news.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: Image.asset(
                news[index]['image']!,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
              title: Text(news[index]['title']!),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NewsDetailScreen(
                      title: news[index]['title']!,
                      details: news[index]['details']!,
                      image: news[index]['image']!,
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
//
