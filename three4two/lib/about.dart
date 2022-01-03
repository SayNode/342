import 'package:flutter/material.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hier kommt die About Saynode Seite'),
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
