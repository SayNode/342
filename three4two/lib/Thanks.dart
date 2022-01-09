import 'package:flutter/material.dart';
import 'package:three4two/Home.dart';
import 'package:three4two/globals.dart' as globals;

class Thanks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thank You'),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(30),
              child: Text(
                "Your Transaction ID: " + globals.recentTx,
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            ElevatedButton(
              child: Text('Home'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return Home();
                    },
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
