//Leave as is
import 'package:flutter/material.dart';
import 'home_screen.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  String fullName = '';
  String phoneNumber = '';
  String location = 'Kampala';
  String farmingType = 'Crop Farming';
  String selectedPlant = 'Maize';
  String email = '';
  String password = '';
  String confirmPassword = '';

  final List<String> farmingTypes = [
    'Crop Farming',
    'Animal Husbandry',
    'Mixed Farming',
    'Agroforestry',
  ];

  final List<String> plants = [
    'Maize',
    'Beans',
    'Cassava',
    'Coffee',
    'Bananas',
    'Cotton',
    'Tea',
    'Apples',
    'Cashewnuts',
  ];

  final List<String> ugandanDistricts = [
    'Kampala', 'Wakiso', 'Mukono', 'Mbarara', 'Mbale', 'Gulu', 'Arua',
    'Masaka', 'Fort Portal', 'Jinja', 'Soroti', 'Lira', 'Hoima', 'Kabale',
    'Bushenyi', 'Tororo', 'Iganga', 'Entebbe', 'Moroto', 'Kitgum',
    // Add all districts as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/signup_bg.jpg'), // Placeholder signup bg image
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
                      Icon(Icons.app_registration,
                          size: 80, color: Colors.green),
                      SizedBox(height: 10),
                      Text('Sign Up', style: TextStyle(fontSize: 24)),
                      TextField(
                        decoration: InputDecoration(labelText: 'Full Name'),
                        onChanged: (value) => fullName = value.trim(),
                      ),
                      TextField(
                        decoration: InputDecoration(labelText: 'Phone Number'),
                        keyboardType: TextInputType.phone,
                        onChanged: (value) => phoneNumber = value.trim(),
                      ),
                      DropdownButtonFormField<String>(
                        value: location,
                        decoration:
                            InputDecoration(labelText: 'Location (District)'),
                        items: ugandanDistricts.map((district) {
                          return DropdownMenuItem(
                            value: district,
                            child: Text(district),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            location = value!;
                          });
                        },
                      ),
                      DropdownButtonFormField<String>(
                        value: farmingType,
                        decoration:
                            InputDecoration(labelText: 'Type of Farming'),
                        items: farmingTypes.map((type) {
                          return DropdownMenuItem(
                            value: type,
                            child: Text(type),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            farmingType = value!;
                          });
                        },
                      ),
                      DropdownButtonFormField<String>(
                        value: selectedPlant,
                        decoration:
                            InputDecoration(labelText: 'Main Plant Grown'),
                        items: plants.map((plant) {
                          return DropdownMenuItem(
                            value: plant,
                            child: Text(plant),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedPlant = value!;
                          });
                        },
                      ),
                      TextField(
                        decoration: InputDecoration(labelText: 'Email'),
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (value) => email = value.trim(),
                      ),
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(labelText: 'Password'),
                        onChanged: (value) => password = value.trim(),
                      ),
                      TextField(
                        obscureText: true,
                        decoration:
                            InputDecoration(labelText: 'Confirm Password'),
                        onChanged: (value) => confirmPassword = value.trim(),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        child: Text('Register'),
                        onPressed: () {
                          if (password != confirmPassword) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Passwords do not match')),
                            );
                            return;
                          }

                          // Future: integrate Firebase Auth and Firestore here

                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MainNavigation(),
                            ),
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
  }//
}
