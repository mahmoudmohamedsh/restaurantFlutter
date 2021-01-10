import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant/authenticate/authenticate.dart';
import 'package:restaurant/screens/bottomNavBar.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("in wrapper");
    final user = Provider.of<User>(context);
    if(user == null ){
      return Authenticate();
    }else{
      return BottomNavBar();
    }
  }
}