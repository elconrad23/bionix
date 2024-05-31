//Genevieve

import 'package:flutter/material.dart';

import '../main.dart';
import '../widgets/app_bar.dart';
import 'saved_orthopedics.dart';

// import 'appointments.dart';

// class DoctorList extends StatefulWidget {
//   final String title;

//   const DoctorList({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

class DoctorList extends StatelessWidget {
  const DoctorList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 142, 179, 241),
      appBar: CustomAppBar(
        title: ("Bionix Doctors"),
        actions: [
          IconButton(
            icon: const Icon(Icons.home_rounded),
            onPressed: () {
              // Handle search button press
            },
          ),
          IconButton(
            icon: const Icon(Icons.account_circle),
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
          const Image(image: AssetImage("logo/logo.png")),
        ],
      ),
      body: Center(
        child: ListView(
          children:[
            InkWell(
              onTap: (){
                Navigator.push(context,
                MaterialPageRoute(
                builder: (BuildContext context) => const SavedOrthopedicsScreen(),
                ),
              );},
              child: const Text("Find a location"),

        ),
        InkWell(
              onTap: (){
                Navigator.push(context,
                MaterialPageRoute(
                builder: (BuildContext context) => const SavedOrthopedicsScreen(),
                ),
              );},
              child: const Text("Choose a doctor"),

        ),
        InkWell(
              onTap: (){
                Navigator.push(context,
                MaterialPageRoute(
                builder: (BuildContext context) => const SavedOrthopedicsScreen(),
                ),
              );},
              child: const Text("Make an appointment"),

        ),
        InkWell(
              onTap: (){
                Navigator.push(context,
                MaterialPageRoute(
                builder: (BuildContext context) => const SavedOrthopedicsScreen(),
                ),
              );},
              child: const Text("ER Waiting Period"),
        ),
        InkWell(
              onTap: (){
                Navigator.push(context,
                MaterialPageRoute(
                builder: (BuildContext context) => const SavedOrthopedicsScreen(),
                ),
              );},
              child: const Text("Find an Emergency Care location"),

        ),
        ],
        ),),);
  }}