import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../loading.dart';
import '../services/auth.dart';
import '../constant.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();

  final Function toggleView;
  SignIn({this.toggleView});
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();

  String email = '';
  String password = '';

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
              title: Text("sign in"),
              elevation: 0.0,
              centerTitle: true,
              actions: [
                RaisedButton.icon(
                  onPressed: () {
                    widget.toggleView();
                  },
                  icon: Icon(Icons.person),
                  label: Text("register"),
                  textColor: Colors.white,
                  color: Colors.grey[700],
                ),
              ],
            ),
      body: loading
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
                          dynamic result = await _auth
                              .signInWithEmailAndPassword(email, password);
                          if (result == null) {
                            setState(() {
                              loading = false;
                            });
                            print("not sign in with email and password");
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
                        "signin",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    // other sign in method
                    Divider(
                      color: Colors.black,
                      indent: MediaQuery.of(context).size.width / 5,
                      endIndent: MediaQuery.of(context).size.width / 5,
                      height: 30,
                      thickness: 1.5,
                    ),
                    // RaisedButton(
                    //   onPressed: () async {
                    //     dynamic result = await _auth.signinAnon();
                    //     if (result == null)
                    //       print("error in sign in anu");
                    //     else {
                    //       print("signed in ");
                    //       print(result);
                    //     }
                    //   },
                    //   child: Text("signin anu"),
                    // ),
                  ],
                ),
              ),
            ),
    );
  }
}
