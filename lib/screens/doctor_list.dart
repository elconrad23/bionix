//Genevieve

import 'package:flutter/material.dart';

import '../widgets/app_bar.dart';
import '../widgets/leading_widget.dart';
import 'saved_orthopedics.dart';

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
        leading: const LeadingWidget(),
        backgroundColor: Colors.white70,
      ),
      body: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
          children:[
            InkWell(
              onTap: (){
                Navigator.push(context,
                MaterialPageRoute(
                builder: (BuildContext context) => const SavedOrthopedicsScreen(),
                ),
              );},
              child: const Text("Find a specific doc"),
        ),

        // ListView.builder(itemBuilder: itemBuilder)
        InkWell(
              onTap: (){
                Navigator.push(context,
                MaterialPageRoute(
                builder: (BuildContext context) => const SavedOrthopedicsScreen(),
                ),
              );},
              child: const Text("Choose "),

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
              child: const Text("Find an available doc at an Emergency Care location"),

        ),
        ],
        ),),);
  }}