import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import "package:hex/hex.dart";
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'globals.dart' as globals;
import 'dart:convert';
import 'package:three4two/TreeOnClick.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _Search();
}

String transactionID = "";
String message = "";
String names = "";

class _Search extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          clipBehavior: Clip.hardEdge,
          child: Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.height,
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: Text(
                            "Find your message",
                            style: TextStyle(fontSize: 30, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 20, right: 10),
                    child: TextField(
                      onChanged: (value) {
                        setState(
                          () {
                            transactionID = value;
                          },
                        );
                      },
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide: BorderSide(
                              color: Colors.pink,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide: BorderSide(
                              color: Colors.pink,
                            ),
                          ),
                          hintText: "Your transaction ID (Starts with 0x...)"),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(30),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size.fromHeight(50),
                          primary: Colors.pink),
                      child: Text(
                        'Search message',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      onPressed: () async {
                        getMessage(context, transactionID);
                      },
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }
}

Future getMessage(context, txID) async {
  var getTransaction =
      await http.get(Uri.parse('http://3.71.71.72:8669/transactions/$txID'));
  print(getTransaction.body);

  Map<String, dynamic> nodeResponse = json.decode(getTransaction.body);
  var numberOfEvents = nodeResponse.length;

  String data = nodeResponse["clauses"][0]["data"];

  var length = data.length;
  if (length > 330) {
    String name1 = ascii
        .decode(HEX.decode(data.substring(length - 5 * 64, length - 4 * 64)));
    String name2 = ascii
        .decode(HEX.decode(data.substring(length - 3 * 64, length - 2 * 64)));
    message = ascii.decode(HEX.decode(data.substring(length - 64, length)));
    names = name1 + " + " + name2;
  }

  Navigator.push(
    context,
    PageRouteBuilder(
      pageBuilder: (context, animation1, animation2) => TreeOnClick(
        names: names,
        message: message,
      ),
      transitionDuration: Duration.zero,
    ),
  );
}
