import 'package:flutter/material.dart';
import 'globals.dart' as globals;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _Search();
}

class _Search extends State<Search> {
  @override
  Widget build(BuildContext context) {
    displayMessages();
    return Scaffold(
        appBar: AppBar(
          title: Text('Hier kommt die Suchseite'),
        ),
        body: Center(
          child: Text("hello"),
        ));
  }
}

void displayMessages() async {
  final prefs = await SharedPreferences.getInstance();

// Try reading data from the counter key. If it doesn't exist, return 0.
  final counter = prefs.getString('txId') ?? 0;
  print(counter);
}
