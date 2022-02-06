import 'package:flutter/material.dart';
import 'package:three4two/Home.dart';
import 'package:three4two/Start.dart';
import 'package:three4two/widget/fetchOffers.dart';
import 'dart:convert';
import 'package:three4two/Utils/globals.dart' as globals;
import 'package:http/http.dart' as http;
import "package:hex/hex.dart";
import 'package:three4two/widget/getTrees.dart';

class Screen0 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    getTrees();
    getTreeNames();
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
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
                        "Welcome to \nTREE FOR TWO",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      child: Image.asset("assets/Gifs/Start.gif"),
                    ),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text:
                                "Confess your love to your loved ones and store your words forever on the blockchain! Let the tree of love grow, for each message it will get another leaf. By storing your messages on the blockchain they will be stored forever. That's even better than etching your name in a real tree or writing your name on a lock. To write a message, click on  ",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey.shade600,
                            ),
                          ),
                          WidgetSpan(
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.pink,
                                  border: Border.all(color: Colors.pink),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(7))),
                              child: Container(
                                padding: EdgeInsets.only(left: 10, right: 8),
                                child: Text(
                                  "Get started",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          TextSpan(
                            text: "  and on the next page click on the ",
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
      ),
    );
  }
}
