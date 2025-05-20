import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(FallacyFinderApp());
}

class FallacyFinderApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fallacy Finder',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}
