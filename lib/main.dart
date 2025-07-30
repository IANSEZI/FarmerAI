import 'package:flutter/material.dart';
// Import all screens
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/app_settings.dart';
import 'screens/login_screen.dart';
import 'screens/notifications_screen.dart';
import 'screens/news_detail_screen.dart';
import 'screens/analytics_screen.dart';
import 'screens/weather_screen.dart';
import 'screens/favorites_screen.dart';
import 'screens/settings_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize app settings
  final settings = AppSettings();
  await settings.init(); // Initialize with saved preferences

  runApp(
    ChangeNotifierProvider(
      create: (context) => settings,
      child: const FarmerAIApp(),
    ),
  );
}

class FarmerAIApp extends StatelessWidget {
  const FarmerAIApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppSettings>(
      builder: (context, settings, child) {
        return MaterialApp(
          title: 'Farmer AI App',
          debugShowCheckedModeBanner: false,
          theme: _buildTheme(context, settings, Brightness.light),
          darkTheme: _buildTheme(context, settings, Brightness.dark),
          themeMode: settings.darkMode ? ThemeMode.dark : ThemeMode.light,
          initialRoute: '/login',
          routes: {
            '/login': (context) => LoginScreen(),
            '/NotificationsScreen': (context) => NotificationsScreen(),
            '/NewsDetailScreen': (context) => NewsDetailScreen(
                  title: "Agriculture News", // Default title
                  details:
                      "Latest farming trends and updates...", // Default content
                  image: "assets/default_news.jpg", // Default image
                ),
            '/analytics': (context) => const AnalyticsScreen(),
            '/WeatherScreen': (context) => WeatherScreen(),
            '/FavoritesScreen': (context) => FavoritesScreen(),
            '/SettingsScreen': (context) => SettingsScreen(),
          },
          onUnknownRoute: (settings) => MaterialPageRoute(
            builder: (context) => LoginScreen(),
          ),
        );
      },
    );
  }

  ThemeData _buildTheme(
      BuildContext context, AppSettings settings, Brightness brightness) {
    // Base text theme with dynamic font size
    final baseTextTheme = (brightness == Brightness.dark
            ? ThemeData.dark().textTheme
            : ThemeData.light().textTheme)
        .apply(
      fontSizeFactor: settings.fontSize / 16.0,
    );

    // Apply selected font family
    final textTheme = _applyFontFamily(settings.fontFamily, baseTextTheme);

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: ColorScheme.fromSeed(
        seedColor: settings.themeColor,
        brightness: brightness,
      ),
      textTheme: textTheme,
      appBarTheme: AppBarTheme(
        centerTitle: true,
        titleTextStyle: textTheme.titleLarge?.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  TextTheme _applyFontFamily(String fontFamily, TextTheme baseTextTheme) {
    switch (fontFamily) {
      case 'Roboto':
        return GoogleFonts.robotoTextTheme(baseTextTheme);
      case 'Lato':
        return GoogleFonts.latoTextTheme(baseTextTheme);
      case 'Montserrat':
        return GoogleFonts.montserratTextTheme(baseTextTheme);
      case 'Poppins':
        return GoogleFonts.poppinsTextTheme(baseTextTheme);
      case 'OpenSans':
        return GoogleFonts.openSansTextTheme(baseTextTheme);
      default:
        return baseTextTheme;
    }
  }
}
