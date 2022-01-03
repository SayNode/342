import 'package:three4two/Help.dart';
import 'package:three4two/Home.dart';
import 'package:flutter/material.dart';

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
        "/first": (context) => Screen1(),
        /* "/second": (context) => screen2(),
        "/third": (context) => screen3(),
        "/fourth": (context) => screen4(),
        "/fifth": (context) => screen5(),
*/
      },
    );
  }
}
