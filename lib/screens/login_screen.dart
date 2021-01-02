import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            TextFormField(
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            ElevatedButton(
              onPressed: () {
                // Validate returns true if the form is valid, otherwise false.
                if (_formKey.currentState.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.

                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text('Processing Data'),
                    duration: const Duration(seconds: 2),
                  ));
                }
              },
              child: Text('Submit'),
            ),
            //
            //button to test some firebase function
            //
            ElevatedButton(
              onPressed: () {
                
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text('done'),
                  duration: const Duration(seconds: 2),
                ));
              },
              child: Text('do some firebase'),
            ),
          ],
        ),
      ),
    );
  }
}
