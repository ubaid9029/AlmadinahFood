import 'package:flutter/material.dart';
import 'package:food_home/constant/constants.dart';
import 'Screens/splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: redTheme),
      home: Splash(),
    );
  }
}
