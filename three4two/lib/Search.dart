import 'package:flutter/material.dart';

class Screen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hier kommt die Suchseite'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Suchen'),
          onPressed: () {},
        ),
      ),
    );
  }
}
