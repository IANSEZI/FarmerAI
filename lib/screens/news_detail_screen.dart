import 'package:flutter/material.dart';

class NewsDetailScreen extends StatelessWidget {
  final String title;
  final String details;
  final String image;

  NewsDetailScreen(
      {required this.title, required this.details, required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(image),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(details, style: TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}
