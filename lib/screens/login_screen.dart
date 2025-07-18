import 'package:flutter/material.dart';
import 'signup_screen.dart';
import 'home_screen.dart'; // ✅ Import your HomeScreen here

class LoginScreen extends StatelessWidget {
  String email = '', password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/login_bg.jpg'), // Placeholder background image
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Card(
                color: Colors.white.withOpacity(0.9),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Icon(Icons.agriculture, size: 80, color: Colors.green),
                      SizedBox(height: 10),
                      Text('Farmer AI Login', style: TextStyle(fontSize: 24)),
                      TextField(
                        decoration: InputDecoration(labelText: 'Email'),
                        onChanged: (value) => email = value.trim(),
                      ),
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(labelText: 'Password'),
                        onChanged: (value) => password = value.trim(),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        child: Text('Login'),
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MainNavigation()),
                          );
                        },
                      ),
                      TextButton(
                        child: Text("Don't have an account? Sign up"),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignupScreen()),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
