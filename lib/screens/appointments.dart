import 'package:flutter/material.dart';

import '../widgets/app_bar.dart';
import '../widgets/leading_widget.dart';

class AppointmentsScreen extends StatelessWidget {
  const AppointmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: CustomAppBar(
        title: ("Appointments"),
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
        leading:  const LeadingWidget(),
        backgroundColor: Colors.white70,
      ),

      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20.0),
              const CircleAvatar(
                radius: 80.0,
                backgroundImage: AssetImage('logo/vector-robotic-arm.png'),
              ),
              const SizedBox(height: 20.0),
              const Text(
                'Book an Appointment',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10.0),
              const Text(
                'Booked Appointments',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10.0),
              const Text(
                'Past Appointments',
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