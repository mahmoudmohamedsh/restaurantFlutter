import 'package:flutter/material.dart';
import 'package:restaurant/homepage.dart';
import 'package:restaurant/screens/account.dart';
import 'package:restaurant/screens/bottomNavBar.dart';
import 'package:restaurant/screens/itemdetails.dart';
import 'package:restaurant/screens/products.dart';
import 'package:restaurant/screens/searchScreen.dart';
void main()=> runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottomNavBar(),
      routes: {
        'account': (context) => Account(),
        'search': (context) => SearchScreen(),
        'homepage': (context) => HomePage(),
        'itemDetails': (context)=>ItemDetails(),
        'products': (context) => Products(),

      },
    );
  }
}