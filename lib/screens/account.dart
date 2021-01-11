import 'package:flutter/material.dart';

import '../services/auth.dart';

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    final double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Column(children: [
        SizedBox(height: h*.3,),
        Expanded(child: _buildImageForProfile(context)),
      ]
          // body: RaisedButton(
          //   child: Icon(Icons.account_circle),
          //   onPressed: () {
          //     AuthService().signOut();
          //   },
          // ),
          ),
    );
  }

  Widget _buildImageForProfile(BuildContext context) {
    return Stack(
      overflow: Overflow.visible,
      alignment: AlignmentDirectional.topCenter,
      fit: StackFit.loose,
      children: <Widget>[
        Container(
          // height: MediaQuery.of(context).size.height * .7,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              SizedBox(height: 76,),
              Text(
                "name",
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
        ),
        Positioned(
          top: -50,
          child: CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage('https://picsum.photos/250?image=2'),
          ),
        ),
        Positioned(
          top: 6,
          left: MediaQuery.of(context).size.width / 2 + 13,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.grey, borderRadius: BorderRadius.circular(60)),
            child: IconButton(
                color: Colors.white,
                icon: Icon(
                  Icons.add_a_photo,
                  color: Colors.white,
                ),
                onPressed: () {}),
          ),
        ),
      ],
    );
  }
}
