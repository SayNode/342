import 'package:flutter/material.dart';
import 'package:three4two/Home.dart';
import 'package:three4two/Start.dart';
import 'package:three4two/widget/fetchOffers.dart';

class Screen0 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Container(
          padding: EdgeInsets.all(30),
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 50, bottom: 20),
                    child: Text(
                      "Welcome to TREE FOR TWO",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text:
                              "Here you can write a message directly to the VeChain Blockchain and store your words forever. To write a message, click on GET STARTED and on the next page click on the ",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey.shade600,
                          ),
                        ),
                        WidgetSpan(
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.red.shade100,
                                border: Border.all(color: Colors.pink),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            child: Container(
                              padding: EdgeInsets.only(left: 10, right: 8),
                              child: Icon(
                                Icons.send,
                                size: 18,
                                color: Colors.pink,
                              ),
                            ),
                          ),
                        ),
                        TextSpan(
                          text: " icon",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.only(top: 50),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                      primary: Colors.pink),
                  child: Text(
                    'Get started',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Home();
                    }));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
