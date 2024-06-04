import 'package:flutter/material.dart';

import '../widgets/app_bar.dart';
import '../widgets/leading_widget.dart';
import 'saved_orthopedics.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 142, 179, 241),
      appBar: CustomAppBar(
        title: ("Bionix Home"),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () {
              Navigator.push(context,
              MaterialPageRoute(
              builder: (BuildContext context) => const SavedOrthopedicsScreen(),
              ),
          );},),

          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(context,
                MaterialPageRoute(
                builder: (BuildContext context) => const Settings(),
                ),
              );
            },
          ),
          const Image(image: AssetImage("logo/vector-robotic-arm.png")),
        ],
        leading: const LeadingWidget(),
        backgroundColor: Colors.white70,
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
  }
}