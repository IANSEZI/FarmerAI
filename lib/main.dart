import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/app_settings.dart';
import 'screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    ChangeNotifierProvider(
      create: (context) => AppSettings(),
      child: FarmerAIApp(),
    ),
  );
}

class FarmerAIApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppSettings>(
      builder: (context, settings, child) {
        TextTheme baseTextTheme = Theme.of(context).textTheme.apply(
              fontSizeFactor: settings.fontSize / 16.0,
            );

        TextTheme finalTextTheme;

        // Apply GoogleFonts dynamically
        switch (settings.fontFamily) {
          case 'Roboto':
            finalTextTheme = GoogleFonts.robotoTextTheme(baseTextTheme);
            break;
          case 'Lato':
            finalTextTheme = GoogleFonts.latoTextTheme(baseTextTheme);
            break;
          case 'Montserrat':
            finalTextTheme = GoogleFonts.montserratTextTheme(baseTextTheme);
            break;
          default:
            finalTextTheme = baseTextTheme;
        }

        return MaterialApp(
          title: 'Farmer AI App',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            brightness: settings.darkMode ? Brightness.dark : Brightness.light,
            primaryColor: settings.themeColor,
            textTheme: finalTextTheme,
          ),
          home: LoginScreen(),
        );
      },
    );
  }
}
