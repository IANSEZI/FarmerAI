import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app_settings.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var settings = Provider.of<AppSettings>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            SwitchListTile(
              title: Text('Dark Mode'),
              value: settings.darkMode,
              onChanged: (value) {
                settings.toggleDarkMode(value);
              },
            ),
            ListTile(
              title: Text('Font Size'),
              subtitle: Slider(
                value: settings.fontSize,
                min: 12.0,
                max: 24.0,
                divisions: 6,
                label: settings.fontSize.round().toString(),
                onChanged: (value) {
                  settings.setFontSize(value);
                },
              ),
            ),
            ListTile(
              title: Text('Theme Color'),
              trailing: DropdownButton<Color>(
                value: settings.themeColor,
                items: [
                  DropdownMenuItem(
                    child: Text('Green'),
                    value: Colors.green,
                  ),
                  DropdownMenuItem(
                    child: Text('Blue'),
                    value: Colors.blue,
                  ),
                  DropdownMenuItem(
                    child: Text('Dark Orange'),
                    value: Colors.deepOrange,
                  ),
                  DropdownMenuItem(
                    child: Text('Purple'),
                    value: Colors.purple,
                  ),
                ],
                onChanged: (value) {
                  settings.setThemeColor(value!);
                },
              ),
            ),
            ListTile(
              title: Text('Font Family'),
              trailing: DropdownButton<String>(
                value: settings.fontFamily,
                items: [
                  DropdownMenuItem(
                    child: Text('Default'),
                    value: 'Default',
                  ),
                  DropdownMenuItem(
                    child: Text('Roboto'),
                    value: 'Roboto',
                  ),
                  DropdownMenuItem(
                    child: Text('Lato'),
                    value: 'Lato',
                  ),
                  DropdownMenuItem(
                    child: Text('Montserrat'),
                    value: 'Montserrat',
                  ),
                ],
                onChanged: (value) {
                  settings.setFontFamily(value!);
                },
              ),
            ),
            Divider(),
            SwitchListTile(
              title: Text('Enable Notifications'),
              value: true,
              onChanged: (value) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Notifications toggle coming soon')),
                );
              },
            ),
            ListTile(
              title: Text('Language'),
              subtitle: Text('English (Default)'),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Language change coming soon')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
