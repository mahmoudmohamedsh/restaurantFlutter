import 'package:flutter/material.dart';

import '../services/auth.dart';

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Center(
        child: RaisedButton(
          child: Icon(Icons.account_circle),
          onPressed: () {
            AuthService().signOut();
          },
        ),
      ),
    );
  }
}
