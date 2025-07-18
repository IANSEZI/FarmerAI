import 'package:flutter/material.dart';

class WeatherScreen extends StatelessWidget {
  final List<Map<String, String>> forecast = [
    {'day': 'Monday', 'status': 'Sunny', 'temp': '28°C'},
    {'day': 'Tuesday', 'status': 'Rainy', 'temp': '23°C'},
    {'day': 'Wednesday', 'status': 'Cloudy', 'temp': '25°C'},
    {'day': 'Thursday', 'status': 'Thunderstorm', 'temp': '21°C'},
    {'day': 'Friday', 'status': 'Sunny', 'temp': '29°C'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Weather Forecast')),
      body: ListView.builder(
        itemCount: forecast.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: Icon(
                forecast[index]['status'] == 'Sunny'
                    ? Icons.wb_sunny
                    : forecast[index]['status'] == 'Rainy'
                        ? Icons.grain
                        : forecast[index]['status'] == 'Cloudy'
                            ? Icons.wb_cloudy
                            : Icons.flash_on,
                color: Colors.green,
              ),
              title: Text(
                  '${forecast[index]['day']} - ${forecast[index]['status']}'),
              trailing: Text(forecast[index]['temp']!,
                  style: TextStyle(fontSize: 18)),
            ),
          );
        },
      ),
    );
  }
}
