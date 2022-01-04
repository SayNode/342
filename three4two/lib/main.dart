import 'package:three4two/Help.dart';
import 'package:three4two/Home.dart';
import 'package:three4two/Write.dart';
import 'package:three4two/Search.dart';
import 'package:three4two/Tree0.dart';
import 'package:flutter/material.dart';
import 'package:three4two/about.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: new ThemeData(
        primarySwatch: Colors.red,
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
