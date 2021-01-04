import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant/homepage.dart';
import 'package:restaurant/providers/productProvider.dart';
import 'package:restaurant/screens/account.dart';
import 'package:restaurant/screens/bottomNavBar.dart';
import 'package:restaurant/screens/itemdetails.dart';
import 'package:restaurant/screens/products.dart';
import 'package:restaurant/screens/searchScreen.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
  }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: ProductProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BottomNavBar(),
        routes: {
          'account': (context) => Account(),
          'search': (context) => SearchScreen(),
          'homepage': (context) => HomePage(),
          'itemDetails': (context) => ItemDetails(),
          'products': (context) => Products(),
        },
      ),
    );
  }
}
