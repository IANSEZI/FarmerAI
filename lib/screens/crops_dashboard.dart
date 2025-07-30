import 'package:flutter/material.dart';
import 'crop_dashboard_screen.dart';
import 'widgets/main_scaffold.dart';


class CropsDashboard extends StatelessWidget {
  final List<Map<String, String>> crops = [
    {'name': 'Maize', 'image': 'assets/maize.jpg'},
    {'name': 'Coffee', 'image': 'assets/coffee.jpg'},
    {'name': 'Cassava', 'image': 'assets/cassava.jpg'},
    {'name': 'Beans', 'image': 'assets/beans.jpg'},
    {'name': 'Bananas', 'image': 'assets/bananas.jpg'},
    {'name': 'Cotton', 'image': 'assets/cotton.jpg'},
    {'name': 'Tea', 'image': 'assets/tea.jpg'},
    {'name': 'Apples', 'image': 'assets/apples.jpg'},
    {'name': 'Cashewnuts', 'image': 'assets/cashewnuts.jpg'},
  ];

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      title: 'Select a Crop',
      activeIndex: 0,
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: crops.length,
        itemBuilder: (ctx, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CropDashboardScreen(
                    crop: crops[index]['name']!,
                  ),
                ),
              );
            },
            child: Card(
              elevation: 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Image.asset(
                      crops[index]['image']!,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    crops[index]['name']!,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
