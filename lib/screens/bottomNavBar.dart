import 'package:flutter/material.dart';
import 'package:restaurant/homepage.dart';
import 'package:restaurant/screens/account.dart';
import 'package:restaurant/screens/searchScreen.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  List screens =[
    HomePage(),SearchScreen(),Account()
  ];
  int current=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white70,
        elevation: 0.0,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
          BottomNavigationBarItem(
              icon: Icon(Icons.search), title: Text('Search')),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), title: Text('Account')),
        ],
        selectedIconTheme: IconThemeData(
          color: Colors.red[600],
          size: 20.0,
        ),
        selectedLabelStyle: TextStyle(
          color: Colors.red[600],
          fontSize: 15.0,
          fontWeight: FontWeight.normal,
        ),
        selectedItemColor: Colors.red[600],
        unselectedIconTheme:IconThemeData(
          color: Colors.grey,
          size: 15.0,
        ),
        unselectedLabelStyle: TextStyle(
          color: Colors.grey,
          fontSize: 10.0,
          fontWeight: FontWeight.normal,
        ),
        unselectedItemColor:Colors.grey,
        currentIndex:current ,
        onTap: (index){
          setState(() {
            current=index;
          });
          
        },
      ),
      body: screens[current],
    );
  }
}
