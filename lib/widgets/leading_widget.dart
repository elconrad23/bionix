import 'package:flutter/material.dart';

class LeadingWidget extends StatefulWidget {
  const LeadingWidget({super.key});

  @override
  State<LeadingWidget> createState() => _LeadingWidgetState();
}

class _LeadingWidgetState extends State<LeadingWidget> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      onSelected: (value) {
        if (value == "profile") {
          // add desired output
        }else if(value == "settings"){
          // add desired output
        }else if(value == "logout"){
          // add desired output
        }
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry>[
        const PopupMenuItem(
          value: "profile",
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: Icon(Icons.account_circle_outlined ),
              ),
              Text(
                'Profile',
                style: TextStyle(fontSize: 15),
              ),
            ],
          ),
        ),
        const PopupMenuItem(
          value: "settings",
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: Icon(Icons.settings)
              ),
              Text(
                'Settings',
                style: TextStyle(fontSize: 15),
              ),
            ],
          ),
      ),],
      iconSize: 35,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Image.asset(
          "assets/logo/logo.png",
          width: 35,
        ),
      ),
      );
  }
}