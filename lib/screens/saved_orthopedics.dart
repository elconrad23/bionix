import 'package:flutter/material.dart';

import '../widgets/app_bar.dart';
import '../widgets/leading_widget.dart';

class SavedOrthopedicsScreen extends StatelessWidget {
  const SavedOrthopedicsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: CustomAppBar(
        title: ("Doctors on Dial"),
        actions: [
          IconButton(
            icon: const Icon(Icons.location_pin),
            onPressed: () {
              // Handle search button press
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Handle settings button press
            },
          ),
        ],
        leading: const LeadingWidget(),
        backgroundColor: Colors.white70,
      ),

      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20.0),
              const CircleAvatar(
                radius: 80.0,
                backgroundImage: AssetImage('logo/logo.png'),
              ),
              const SizedBox(height: 20.0),
              const Text(
                'About Us',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10.0),
              const Text(
                'Bionix, a futuristic company!',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20.0),
              const Text(
                'Mission',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10.0),
              const Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20.0),
              const Text(
                'Vision',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10.0),
              const Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  // Handle button press
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                  ),
                ),
                child: const Text(
                  'Contact Us',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}