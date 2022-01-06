import 'package:flutter/foundation.dart';
import 'package:three4two/Help.dart';
import 'package:three4two/Home.dart';
import 'package:three4two/Write.dart';
import 'package:three4two/Search.dart';
import 'package:three4two/Tree0.dart';
import 'package:flutter/material.dart';
import 'package:three4two/about.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  SharedPreferences.setMockInitialValues({});
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.pink,
        primaryColor: Colors.pink,
        scaffoldBackgroundColor: Colors.pink,
        fontFamily: 'Flama',
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: Colors.pink,
              displayColor: Colors.pink,
            ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              onPrimary: Colors.pink, primary: Colors.red[50], elevation: 1),
        ),
      ),
      debugShowCheckedModeBanner: false,
      title: '342',
      initialRoute: "/",
      routes: {
        "/": (context) => Screen0(),
        "/home": (context) => Home(),
        "/write": (context) => Write(),
        "/search": (context) => Search(),
        "/about": (context) => About(),
        "/tree": (context) => Tree(),
      },
    );
  }
}