import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant/homepage.dart';
import 'package:restaurant/providers/productProvider.dart';
import 'package:restaurant/screens/account.dart';
import 'package:restaurant/screens/itemdetails.dart';
import 'package:restaurant/screens/products.dart';
import 'package:restaurant/screens/searchScreen.dart';
import 'package:restaurant/screens/wrapper.dart';

import './services/auth.dart';
import 'services/auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider.value(value: ProductProvider())],
      child: StreamProvider<User>.value(
        value: new AuthService().getUser,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Wrapper(),
          routes: {
            'account': (context) => Account(),
            'search': (context) => SearchScreen(),
            'homepage': (context) => HomePage(),
            'itemDetails': (context) => ItemDetails(),
            'products': (context) => Products(),
          },
        ),
      ),
    );
  }
}
