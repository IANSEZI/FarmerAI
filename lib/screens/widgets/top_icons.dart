import 'package:flutter/material.dart';

class TopIcons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          IconButton(icon: Icon(Icons.notifications), onPressed: () {}),
          IconButton(icon: Icon(Icons.newspaper), onPressed: () {}),
          IconButton(icon: Icon(Icons.bar_chart), onPressed: () {}),
          IconButton(icon: Icon(Icons.cloud), onPressed: () {}),
          IconButton(icon: Icon(Icons.favorite), onPressed: () {}),
          IconButton(icon: Icon(Icons.settings), onPressed: () {}),
        ],
      ),
    );
  }
}
