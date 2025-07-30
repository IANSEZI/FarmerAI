import 'package:flutter/material.dart';
import 'widgets/main_scaffold.dart';

class WeatherScreen extends StatelessWidget {
  final List<Map<String, String>> forecast = [
    {'day': 'Monday', 'status': 'Sunny', 'temp': '28°C'},
    {'day': 'Tuesday', 'status': 'Rainy', 'temp': '23°C'},
    {'day': 'Wednesday', 'status': 'Cloudy', 'temp': '25°C'},
    {'day': 'Thursday', 'status': 'Thunderstorm', 'temp': '21°C'},
    {'day': 'Friday', 'status': 'Sunny', 'temp': '29°C'},
    {'day': 'Saturday', 'status': 'Sunny', 'temp': '26°C'},
    {'day': 'Sunday', 'status': 'Sunny', 'temp': '28°C'}
  ];

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      title: 'Weather Forecast',
      activeIndex: 0,
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
//
