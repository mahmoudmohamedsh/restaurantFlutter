import 'package:flutter/material.dart';
import './register.dart';
import './sign_in.dart';
class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  bool showSignIN = true;
  void toggleView () {
    setState(() {
      showSignIN = !showSignIN;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: showSignIN? SignIn(toggleView: toggleView) : Register(toggleView: toggleView),
    );
  }
}