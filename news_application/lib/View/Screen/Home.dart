import 'dart:async';
import 'package:news_application/Controller/Api.dart';
import 'package:news_application/Models/Model/Article.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_application/Models/Model/ListScreens.dart';
import 'package:news_application/Models/Model/Themes.dart';
import 'package:news_application/View/Screen/CategoryScreen.dart';
import 'package:connectivity/connectivity.dart';
class Home extends StatefulWidget {
  static String id='Home';

  @override
  _HomeState createState() => _HomeState();
}



class _HomeState extends State<Home> {
  List <ListScreens>screens =[
    ListScreens(name:'General',image: 'assets/images/general.jpg'),
    ListScreens(name:'Business',image: 'assets/images/business.jpg'),
    ListScreens(name:'Sport',image: 'assets/images/sports.jpg'),
  ];

  List <Themes>themes =[
    Themes(image: 'assets/images/general.jpg'),
    Themes( image: 'assets/images/business.jpg'),
    Themes( image: 'assets/images/sports.jpg'),
  ];
  bool connected=false;
  var connect=Connectivity();
  StreamSubscription stream;

  List<Article> list=[];
  Api api=Api();
  getNews(){
    api.getNews().then((x){
      setState(() {
        list=x;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNews();
   stream= connect.onConnectivityChanged.listen((result) {
      if(result!=ConnectivityResult.none){
        setState(() {
          connected=true;
        });
      }
    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    stream.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,

            title: Text('      NEWS',style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 38,
              color: Colors.black38,
            ),
            ),


            bottom: PreferredSize(
              preferredSize: Size(1.sw,60.h),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.end,
               children: [
                 CountryCodePicker(
                   initialSelection: 'EG',
                   showOnlyCountryWhenClosed: true,
                 ),
               ],
             ),
            ),
          ),

            body:
            !connected?Center(child: Icon(Icons.wifi_off_rounded,size: 60.sw,),):
            Column(
              children: [
                Container(
                  height: 160.h,

                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: screens.length,
                  itemBuilder: (context,index)
                  {
                   return InkWell(
                     onTap: (){
                       Navigator.push(context, MaterialPageRoute(builder:(context)=>CategoryScreen(
                         listScreens: screens[index],
                       )));
                     },
                     child: Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Container(

                         width: .7.sw,
                         decoration: BoxDecoration(
                           color: Colors.black38,
                           image: DecorationImage(
                             image: AssetImage(screens[index].image),
                                 fit: BoxFit.cover
                           )
                         ),
                         child: Center(
                           child: Text(screens[index].name,
                           style: TextStyle(
                             fontSize: 30,
                             fontWeight: FontWeight.w600,
                             color: Colors.white,
                           ),),
                         ),
                       ),
                     ),
                   );
                   }
                  ),
                ),

                Expanded(
                  child: ListView.builder(
                      itemCount: list.length,
                      itemBuilder: (context,index)
                  {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 260.h,
                        width: 280.w,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: list[index].image==null?

                              AssetImage(themes[index].image,):NetworkImage(list[index].image,)
                              ,fit:BoxFit.cover
                          )
                        ),
                        child: Image(),
                      ),
                    );
                  }),
                )
              ],
            ),


        );
  }
}
