import 'package:flutter/material.dart';
import 'crops_dashboard.dart';
import 'notifications_screen.dart';
import 'latest_news_screen.dart';
import 'weather_screen.dart';
import 'favorites_screen.dart';
import 'settings_screen.dart';
import 'widgets/contact_floating.dart'; 

class MainNavigation extends StatefulWidget {
  @override
  _MainNavigationState createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _selectedIndex = 0;
//list of screens
  final List<Widget> _screens = [
    CropsDashboard(),
    LatestNewsScreen(),
    NotificationsScreen(),
    WeatherScreen(),
    FavoritesScreen(),
    SettingsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      floatingActionButton: ContactFloating(),
    );
  }
}
//
