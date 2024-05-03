import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Home.dart';

class SplashScreen extends StatefulWidget {
  static String id='SplashScreen';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
      Duration(seconds: 2),()
    {
      Navigator.pushNamed(context, Home.id);
    }



    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:Center(
        child: Text('N E W S',
        style: TextStyle(
          fontSize: 60,
          fontWeight: FontWeight.w900,
          color: Colors.yellowAccent,
        ),),
      )

    );
  }
}
