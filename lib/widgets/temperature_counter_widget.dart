import 'package:flutter/material.dart';

class TemperatureCounterWidget extends StatefulWidget {
  const TemperatureCounterWidget({super.key});

  @override
  State<TemperatureCounterWidget> createState() => _TemperatureCounterWidgetState();
}

class _TemperatureCounterWidgetState extends State<TemperatureCounterWidget> {
  @override
  Widget build(BuildContext context) {
    return const Text("Temp");
  }
}