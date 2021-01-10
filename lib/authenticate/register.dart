import 'package:flutter/material.dart';
import '../constant.dart';
import '../loading.dart';
import '../services/auth.dart';
import '../services/auth.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();

  final Function toggleView;
  Register({this.toggleView});
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  String email = '';
  String password = '';
  String error;
  final _formkey = GlobalKey<FormState>();
  final _globalKey = GlobalKey<ScaffoldState>();
bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      appBar: loading
          ? null
          : AppBar(
        backgroundColor: Colors.grey[700],
        title: Text("Register"),
        elevation: 0.0,
        centerTitle: true,
        actions: [
          RaisedButton.icon(
            onPressed: () {
              widget.toggleView();
            },
            icon: Icon(Icons.person),
            label: Text("signin"),
          ),
        ],
      ),
      body:loading
          ? Loading()
          : Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: textFormDecoration.copyWith(
                        hintText: 'Email',
                      ),
                validator: (val) =>
                    val.isEmpty ? "that should not be empty" : null,
                onChanged: (val) {
                  setState(() {
                    email = val;
                  });
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: textFormDecoration.copyWith(
                        hintText: 'password',
                      ),
                validator: (val) {
                  if (val.isEmpty) {
                    return "that should not be empty";
                  }
                  if (val.length < 6) {
                    return "that should be more than 6 char";
                  } else {
                    return null;
                  }
                },
                obscureText: true,
                onChanged: (val) {
                  setState(() {
                    password = val;
                  });
                },
              ),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                color: Colors.grey[600],
                onPressed: () async {
                  if (_formkey.currentState.validate()) {
                     setState(() {
                            loading = true;
                          });
                    dynamic result = await _auth.registerWithEmailAndPassword(
                        email, password);
                    if (result == null) {
                      setState(() {
                            loading = false;
                          });
                           if (_globalKey.currentState != null &&
                                loading == false)
                              _globalKey.currentState.showSnackBar(
                                SnackBar(
                                  content:
                                      Text("enter valid email and password"),
                                  duration: Duration(seconds: 6),
                                ),
                              );
                    }
                  }
                },
                child: Text(
                  "register",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
