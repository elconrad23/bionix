//Genevieve

import 'package:flutter/material.dart';

// import '../main.dart';
import '../widgets/app_bar.dart';
import 'saved_orthopedics.dart';
import 'settings.dart';

// import 'appointments.dart';

// class MyHomePage extends StatefulWidget {
//   final String title;

//   const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 142, 179, 241),
      appBar: CustomAppBar(
        title: ("Home"),
        actions: [
          const Icon(Icons.home_rounded),

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
          const CircleAvatar(
                radius: 13.0,
                backgroundImage: AssetImage("logo/logo.png")),
        ],
      ),
      body: SafeArea(
        child: Center(
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
              child: const Row(
                children:[ 
                  Icon(Icons.location_pin),
                  Text("Find a location"),],
        ),),

            InkWell(
              focusColor: Colors.amberAccent,
              onTap: (){
                Navigator.push(context,
                MaterialPageRoute(
                builder: (BuildContext context) => const SavedOrthopedicsScreen(),
                ),
              );},
              child: const Row(
                children:[
                  Icon(Icons.plus_one),
                  Text("Choose a doctor"),
                ],
        ),),
        InkWell(
              onTap: (){
                Navigator.push(context,
                MaterialPageRoute(
                builder: (BuildContext context) => const SavedOrthopedicsScreen(),
                ),
              );},
              child: const Row(
                children:[
                  Icon(Icons.apple_outlined),
                  Text("Make an appointment"),
                ],
        ),),
        InkWell(
              onTap: (){
                Navigator.push(context,
                MaterialPageRoute(
                builder: (BuildContext context) => const SavedOrthopedicsScreen(),
                ),
              );},
              child: const Row(
                children:[
                  Icon(Icons.access_time),
                  Text("ER Waiting Period"),
        ],),),
        InkWell(
              onTap: (){
                Navigator.push(context,
                MaterialPageRoute(
                builder: (BuildContext context) => const SavedOrthopedicsScreen(),
                ),
              );},
              child: const Row(
                children:[
                  Icon(Icons.location_pin),
                  Text("Find an Emergency Care location"),
                ],
        ),
        ),],
        ),),),);
  }}