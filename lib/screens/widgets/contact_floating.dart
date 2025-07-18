import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContactFloating extends StatelessWidget {
  void _showContactDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Contact Us'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading:
                      FaIcon(FontAwesomeIcons.whatsapp, color: Colors.green),
                  title: Text('WhatsApp'),
                  subtitle: Text('+256 700 123456'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.email, color: Colors.red),
                  title: Text('Email'),
                  subtitle: Text('info@farmerai.com'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.web, color: Colors.blue),
                  title: Text('Website'),
                  subtitle: Text('www.farmerai.com'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.phone, color: Colors.teal),
                  title: Text('Phone'),
                  subtitle: Text('+256 700 123456'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                Divider(),
                ListTile(
                  leading: FaIcon(FontAwesomeIcons.twitter, color: Colors.blue),
                  title: Text('Twitter'),
                  subtitle: Text('@farmerai'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading:
                      FaIcon(FontAwesomeIcons.instagram, color: Colors.purple),
                  title: Text('Instagram'),
                  subtitle: Text('@farmerai_ug'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading:
                      FaIcon(FontAwesomeIcons.linkedin, color: Colors.blueGrey),
                  title: Text('LinkedIn'),
                  subtitle: Text('FarmerAI Uganda'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: Text('Close', style: TextStyle(color: Colors.green)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => _showContactDialog(context),
      child: Icon(Icons.phone),
      backgroundColor: Colors.green,
      tooltip: 'Contact Us',
    );
  }
}
