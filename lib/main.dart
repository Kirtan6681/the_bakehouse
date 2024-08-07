import 'package:flutter/material.dart';
import 'Screens/bill_screen.dart';
import 'Screens/home_screen.dart';
import 'Screens/splash_screen.dart';
import 'Screens/explore_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/home': (context) => HomePage(),
        '/explore': (context) => ExplorePage(title: 'Explore Categories'),
        '/bill': (context) => BillScreen(),
      },
    );
  }
}
