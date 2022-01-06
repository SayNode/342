import 'package:flutter/material.dart';

class TreeOnClick extends StatelessWidget {
  final String text;
  TreeOnClick({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(text),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              child: Text(
                text,
                style: TextStyle(fontSize: 40),
              ),
            ),
            ElevatedButton(
              child: Text('zurück'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
