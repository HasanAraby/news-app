import 'package:flutter/material.dart';
import 'package:news_application/Models/Model/ListScreens.dart';
class CategoryScreen extends StatefulWidget {
  static String id='CategoryScreen';
  ListScreens listScreens;
  CategoryScreen({this.listScreens});
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  ListScreens listScreens;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.listScreens.name,
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w600,
          color:Colors.black38,
        ),),
      ),

      body: Center(
        child: Text(widget.listScreens.name,style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w600,
          color:Colors.black38,
        ),),
      ),
    );
  }
}
