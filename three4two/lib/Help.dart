import 'package:flutter/material.dart';
import 'package:three4two/Home.dart';

class Screen0 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hier steht die Einleitung'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Weiter'),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return Screen1();
            }));
          },
        ),
      ),
    );
  }
}
