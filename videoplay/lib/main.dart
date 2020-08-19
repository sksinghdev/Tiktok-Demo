import 'package:flutter/material.dart';
import 'package:videoplay/controller/bottom_nav_bar.dart';
import 'package:videoplay/controller/home.dart';
import 'package:videoplay/controller/home_page.dart';
import 'package:videoplay/uiutils/home_header.dart';

void main() => runApp(MyApp());

//class MyApp extends StatelessWidget {
//  // This widget is the root of your application.
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      title: 'Flutter Demo',
//      theme: ThemeData(
//        // Uncomment in phase 3 to apply white to text
//        textTheme: Theme.of(context).textTheme.apply(
//            bodyColor: Colors.white,
//            displayColor: Colors.white
//        ),
//      ),
//      home: Home(),
//    );
//  }
//}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: <Widget>[
            HomeScreen(),
            BottomNavigation(),
            homeHeader(),
          ],
        ),
      ),
    );
  }
}