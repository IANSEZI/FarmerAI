import 'package:flutter/material.dart';

class PredictionScreen extends StatelessWidget {
  final String crop;
  PredictionScreen({required this.crop});

  @override
  Widget build(BuildContext context) {
    // Placeholder ML prediction data
    String prediction = 'Prediction feature coming soon. Stay tuned!';

    return Scaffold(
      appBar: AppBar(title: Text('$crop Prediction')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            prediction,
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
