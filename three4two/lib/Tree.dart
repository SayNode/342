import 'package:flutter/material.dart';

class Screen4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hier kommt die Baum Seite'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Screen2'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
