import 'package:flutter/material.dart';
import 'package:three4two/Home.dart';
import 'package:three4two/Utils/globals.dart' as globals;
import 'package:share/share.dart';

class ErrorWithTransaction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        clipBehavior: Clip.hardEdge,
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    child: Image(
                      image: AssetImage("assets/UI/UIBG.png"),
                    ),
                  ),
                  Positioned(
                    top: (MediaQuery.of(context).size.width) / 4,
                    child: Container(
                      padding: EdgeInsets.only(
                          top: 5, bottom: 5, left: 15, right: 15),
                      decoration: BoxDecoration(
                          color: Colors.pink,
                          border: Border.all(color: Colors.white, width: 5),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Text(
                        "There was a error",
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                    ),
                  ),
                ],
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
