import 'package:flutter/material.dart';
import '../widgets/app_bar.dart';
import '../widgets/leading_widget.dart';
import 'appointments.dart';
import 'doctor_list.dart';
import 'emergency_care_locations.dart';
import 'erwaiting_screen.dart';
import 'device_status.dart';
import 'settings.dart';

class MyHomePage extends StatefulWidget {
  //final String title;

  const MyHomePage({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.
  @override
  State<MyHomePage> createState() => MyHomePageScreen();
}

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

class MyHomePageScreen extends State<MyHomePage> {
  final Color navigationBarColor = Colors.white;
  int selectedIndex = 0;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 142, 179, 241),
      appBar: CustomAppBar(
        title: ("Home"),
        actions: [
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
        ],
        leading: const LeadingWidget(),
        backgroundColor: Colors.white70,
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: <Widget>[
          Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center ,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 5,),

              InkWell(
                onTap: (){
                Navigator.push(context,
                MaterialPageRoute(
                builder: (BuildContext context) => const DeviceStatusScreen(),
                ),
              );},
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  Icon(Icons.device_thermostat),
                  Text("Device status"),],
              ),),

              const SizedBox(height: 5,),

              InkWell(
                focusColor: Colors.amberAccent,
                onTap: (){
                  Navigator.push(context,
                  MaterialPageRoute(
                  builder: (BuildContext context) => const DoctorList(),
                  ),
                );},
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                    Icon(Icons.plus_one),
                    Text("Choose a doctor"),
                  ],
              ),),

              const SizedBox(height: 5,),

              InkWell(
                onTap: (){
                  Navigator.push(context,
                  MaterialPageRoute(
                  builder: (BuildContext context) => const AppointmentsScreen(),
                  ),
                );},
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                    Icon(Icons.apple_outlined),
                    Text("Make an appointment"),
                  ],
              ),),

              const SizedBox(height: 5,),

              InkWell(
                onTap: (){
                  Navigator.push(context,
                  MaterialPageRoute(
                  builder: (BuildContext context) => const ERWaitingScreen(),
                  ),
                );},
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                    Icon(Icons.access_time),
                    Text("ER Waiting Period"),
              ],),),
            
              const SizedBox(height: 5,),

              InkWell(
                onTap: (){
                  Navigator.push(context,
                  MaterialPageRoute(
                  builder: (BuildContext context) => const EmergencyCareLocations(),
                  ),
                );},
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                    Icon(Icons.location_pin),
                    Text("Find an Emergency Care location"),
                ],
              ),
        ),],),),],),);
  }}
  