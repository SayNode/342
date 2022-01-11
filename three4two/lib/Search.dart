import 'package:flutter/material.dart';
import 'globals.dart' as globals;
import 'dart:convert';

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

void displayMessages() async {}
