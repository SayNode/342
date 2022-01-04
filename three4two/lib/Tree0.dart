import 'package:flutter/material.dart';

class Tree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hier kommt Baum 0"),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('zurück'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
