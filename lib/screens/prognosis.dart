import 'package:bionix/widgets/app_bar.dart';
import 'package:flutter/material.dart';

import '../widgets/leading_widget.dart';

class PrognosisScreen extends StatelessWidget {
  const PrognosisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: ("Help and Guide"),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
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
      body: Center(
        child: ListView(
          children: const [
            Text('Standard Operating Procedures (S.O.Ps)'),
            Text('How to Connect / Reconnect'),
            Text('Emergency'),
            Text('User Guide')
          ]
        )
            ),
    );
  }
}