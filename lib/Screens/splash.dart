import 'dart:async';
import 'package:flutter/material.dart';

import 'home(menu).dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  startTime() async {
    var duration = Duration(seconds: 7);
    return Timer(duration, navigationPage);
  }

  void navigationPage() {
    Navigator.pushAndRemoveUntil(
        context, MaterialPageRoute(builder: (context) => Home()), (_) => false);
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              child: Image.asset(
                'assets/images/Presentation1.gif',
                height: 300,
                width: 300,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
