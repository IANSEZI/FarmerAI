import 'package:flutter/material.dart';
import 'widgets/top_icons.dart';
import 'widgets/contact_floating.dart';
import 'crops_dashboard.dart';

class CropDashboardScreen extends StatelessWidget {
  final String crop;
  CropDashboardScreen({required this.crop});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$crop Dashboard'),
        actions: [
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => CropsDashboard()),
                (route) => false,
              );
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopIcons(),
            ListTile(
              leading: Icon(Icons.show_chart, color: Colors.green),
              title: Text('Market Prediction'),
              onTap: () {}, // ML Placeholder
            ),
            ListTile(
              leading: Icon(Icons.price_check, color: Colors.green),
              title: Text('Price Prediction'),
              onTap: () {}, // ML Placeholder
            ),
            ListTile(
              leading: Icon(Icons.cloud, color: Colors.green),
              title: Text('Weather Prediction'),
              subtitle: Text('Favorable for planting',
                  style: TextStyle(color: Colors.green)),
              onTap: () {},
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Crop Specific News',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            ListTile(
              leading: Image.asset('assets/pest_outbreak.jpg',
                  width: 50, height: 50), // Placeholder image
              title: Text('Pest outbreak in Mbale affecting Maize yields'),
              subtitle: Text('Read more...'),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.school, color: Colors.green),
              title: Text('Professional’s Advice'),
              subtitle: Text(
                  'It is recommended to plant after the upcoming rains...'),
            ),
          ],
        ),
      ),
      floatingActionButton: ContactFloating(),
    );
  }
}

//hello huu
