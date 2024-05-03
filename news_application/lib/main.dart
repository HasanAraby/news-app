import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_application/View/Screen/Home.dart';
import 'package:news_application/View/Screen/SplashScreen.dart';
import 'package:news_application/View/Screen/CategoryScreen.dart';
void main() {
  runApp(News());
}

class News extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder:()=> MaterialApp(
        debugShowCheckedModeBanner: false,
      home: SplashScreen(),

        routes: {
          SplashScreen.id:(context)=>SplashScreen(),
          Home.id:(context)=>Home(),
          CategoryScreen.id:(context)=>CategoryScreen(),

        },
      ),
    );
  }
}


