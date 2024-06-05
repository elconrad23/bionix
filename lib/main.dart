import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/analytics.dart';
import 'screens/chat.dart';
import 'screens/home.dart';
import 'screens/prognosis.dart';
import 'screens/saved_orthopedics.dart';
import 'widgets/temperature_counter_widget.dart';
import 'widgets/water_drop_nav_bar.dart';

final List<Widget> appScreens = [
  const MyHomePage(),
  const TemperatureCounterWidget(),
  const PrognosisScreen(),
  const SavedOrthopedicsScreen(),
  const ChatScreen(),
];

class NavigationProvider extends ChangeNotifier {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  int get selectedIndex => _selectedIndex;
  PageController get pageController => _pageController;

  void onItemSelected(int index) {
    _selectedIndex = index;
    _pageController.animateToPage(
      _selectedIndex,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeOutQuad,
    );
    notifyListeners();
  }
}

void main() {
  // FlutterBluePlus.setLogLevel(LogLevel.verbose, color: true);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => NavigationProvider(),
      child: MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      home: Consumer<NavigationProvider>(
      builder: (context, navigationProvider, child) {
        return Scaffold(
          appBar: AppBar(),
          body: appScreens.elementAt(navigationProvider.selectedIndex),
          bottomNavigationBar: WaterDropNavBar(
            backgroundColor: Colors.greenAccent,
            onItemSelected: navigationProvider.onItemSelected,
            selectedIndex: navigationProvider.selectedIndex,
            barItems: <BarItem>[
              BarItem(
                filledIcon: Icons.home_rounded,
                outlinedIcon: Icons.home_rounded,
              ),
              BarItem(
                filledIcon: Icons.favorite_rounded,
                outlinedIcon: Icons.favorite_border_rounded,
              ),
              BarItem(
                filledIcon: Icons.email_rounded,
                outlinedIcon: Icons.email_outlined,
              ),
              BarItem(
                filledIcon: Icons.app_registration_outlined,
                outlinedIcon: Icons.app_registration_outlined,
              ),
              BarItem(
                filledIcon: Icons.add_to_home_screen_rounded,
                outlinedIcon: Icons.add_to_home_screen_rounded,
              ),
            ],
          ),
        );
      },),
      navigatorObservers: [BluetoothAdapterStateObserver(),],
    ),
    );
  }
}
