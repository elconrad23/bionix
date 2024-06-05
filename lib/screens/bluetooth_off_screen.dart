import 'package:flutter/material.dart';
// import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class BluetoothOffScreen extends StatelessWidget {
  const BluetoothOffScreen({super.key, required adapterState, });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text("Bluetoth is off")
    );
  }
}