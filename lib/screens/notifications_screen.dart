import 'package:flutter/material.dart';  
import 'widgets/main_scaffold.dart';

class NotificationsScreen extends StatelessWidget {
  final List<Map<String, String>> notifications = [
    {
      'title': 'Market prices updated for Maize.',
      'time': '2 hours ago',
    },
    {
      'title': 'New pest outbreak reported in Mbale.',
      'time': 'Yesterday',
    },
    {
      'title': 'Rainfall forecast updated for your area.',
      'time': '3 days ago',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      title: 'Notifications',
      activeIndex:
          4, // ✅ Set to the correct index for Notifications in your nav
      body: Column(
        children: [
          // AppBar action replacement
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                // Implement clear all functionality here in the future
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Clear all not implemented yet')),
                );
              },
            ),
          ),
          Expanded(
            child: notifications.isEmpty
                ? Center(child: Text('No notifications yet.'))
                : ListView.builder(
                    itemCount: notifications.length,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 3,
                        margin:
                            EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                        child: ListTile(
                          leading:
                              Icon(Icons.notifications, color: Colors.green),
                          title: Text(notifications[index]['title']!),
                          subtitle: Text(notifications[index]['time']!),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}//
