import 'package:flutter/material.dart';
import 'package:bionix/widgets/water_drop_nav_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  late final Color navigationBarColor= Colors.white;
  final int selectedIndex = 0;
  late final PageController pageController;

  MyApp({super.key}) {
    pageController = PageController(initialPage: selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      home: MyHomePage(
        title: 'Bionix Home Page',
        navigationBarColor: navigationBarColor,
        selectedIndex: selectedIndex,
        pageController: pageController,),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key,
  required this.title,
  required this.navigationBarColor,
  required this.selectedIndex,
  required this.pageController,
});

  final String title;
  final Color navigationBarColor ;
  final int selectedIndex;
  final PageController pageController;


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedIndex = 0;
  late PageController pageController;
  late Color navigationBarColor;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: selectedIndex);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            child: Icon(
              Icons.bookmark_rounded,
              size: 56,
              color: Colors.amber[400],
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Icon(
              Icons.favorite_rounded,
              size: 56,
              color: Colors.amber[400],
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Icon(
              Icons.favorite_rounded,
              size: 56,
              color: Colors.red[400],
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Icon(
              Icons.email_rounded,
              size: 56,
              color: Colors.green[400],
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Icon(
              Icons.folder_rounded,
              size: 56,
              color: Colors.blue[400],
            ),
          ),
        ],
      ),
      bottomNavigationBar: WaterDropNavBar(
        backgroundColor: navigationBarColor,
        onItemSelected: (int index) {
          setState(() {
            selectedIndex = index;
          });
          pageController.animateToPage(
            selectedIndex,
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeOutQuad,
          );
        },
        selectedIndex: selectedIndex,
        barItems: <BarItem>[
          BarItem(
            filledIcon: Icons.bookmark_rounded,
            outlinedIcon: Icons.bookmark_border_rounded,
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
            filledIcon: Icons.folder_rounded,
            outlinedIcon: Icons.folder_outlined,
          ),
        ],
      ),
    );
  }
}