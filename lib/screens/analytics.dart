// //Genevieve
// import 'dart:async';

// import 'package:flutter/material.dart';

// import '../widgets/temperature_counter_widget.dart';

// class AnalyticsScreen extends StatefulWidget {
//   const AnalyticsScreen({super.key});

//   @override
//   State<AnalyticsScreen> createState() => _AnalyticsScreenState();
// }

// class _AnalyticsScreenState extends State<AnalyticsScreen> {
//   BluetoothAdapterState _adapterState = BluetoothAdapterState.unknown;

//   late StreamSubscription<BluetoothAdapterState> _adapterStateStateSubscription;

//   @override
//   void initState() {
//     super.initState();
//     _adapterStateStateSubscription = FlutterBluePlus.adapterState.listen((state) {
//       _adapterState = state;
//       if (mounted) {
//         setState(() {});
//       }
//     });
//   }

//   @override
//   void dispose() {
//     _adapterStateStateSubscription.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     Widget screen = _adapterState == BluetoothAdapterState.on
//         ? const TemperatureCounterWidget()
//         : BluetoothOffScreen(adapterState: _adapterState);

//     return Scaffold(
//       navigatorObservers: [BluetoothAdapterStateObserver()],
//     );
//   }
// }

// //
// // This observer listens for Bluetooth Off and dismisses the DeviceScreen
// //
// class BluetoothAdapterStateObserver extends NavigatorObserver {
//   StreamSubscription<BluetoothAdapterState>? _adapterStateSubscription;

//   @override
//   void didPush(Route route, Route? previousRoute) {
//     super.didPush(route, previousRoute);
//     if (route.settings.name == '/DeviceScreen') {
//       // Start listening to Bluetooth state changes when a new route is pushed
//       _adapterStateSubscription ??= FlutterBluePlus.adapterState.listen((state) {
//         if (state != BluetoothAdapterState.on) {
//           // Pop the current route if Bluetooth is off
//           navigator?.pop();
//         }
//       });
//     }
//   }

//   @override
//   void didPop(Route route, Route? previousRoute) {
//     super.didPop(route, previousRoute);
//     // Cancel the subscription when the route is popped
//     _adapterStateSubscription?.cancel();
//     _adapterStateSubscription = null;
//   }
// }