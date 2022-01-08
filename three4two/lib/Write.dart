import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:three4two/Drawer.dart';
import "package:three4two/widget/fetchOffers.dart";

class Write extends StatefulWidget {
  const Write({Key? key}) : super(key: key);

  @override
  State<Write> createState() => _Write();
}

class _Write extends State<Write> {
  String Name1 = '';
  String Name2 = '';
  String _enteredText = '';
  TextEditingController _controller = TextEditingController();
  TextEditingController name1Controller = TextEditingController();
  TextEditingController name2Controller = TextEditingController();
  bool myNewButton = false;
  String myText = "Senden";
  String txID = "";
  bool sucessfulPayment = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: MyDrawer(),
      body: Center(
        child: Container(
          child: SingleChildScrollView(
            padding: EdgeInsets.only(top: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  children: [
                    Flexible(
                      child: Container(
                        padding: const EdgeInsets.only(left: 20, right: 10),
                        child: TextField(
                          controller: name1Controller,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(50),
                          ],
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
                              hintText: "your name"),
                        ),
                      ),
                    ),
                    Text(
                      "+",
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                    Flexible(
                      child: Container(
                        padding: const EdgeInsets.only(left: 10, right: 20),
                        child: TextField(
                          controller: name2Controller,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(50),
                          ],
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
                              hintText: "your partner"),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  child: TextFormField(
                    onChanged: (value) {
                      setState(
                        () {
                          _enteredText = value;
                        },
                      );
                    },
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(200),
                    ],
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "your love message",
                      helperText: 'Maximal 200 Zeichen',
                      helperStyle: TextStyle(color: Colors.white),
                      counterText:
                          '${(200 - _enteredText.length).toString()} Zeichen übrig',
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide:
                            const BorderSide(width: 2.0, color: Colors.white),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(
                          color: Colors.pink,
                        ),
                      ),
                    ),
                    controller: _controller,
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 25.0, bottom: 50.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            onPressed: () async {
                              await fetchOffers(context);
                              print("test");
                              await sendToScript(_controller.text,
                                  name1Controller.text, name2Controller.text);
                              print("test2");

                              setState(() {
                                myNewButton = !myNewButton;
                                txID = "Your Transaction ID: ";
                              });
                            },
                            child: Row(children: [
                              Text(
                                myNewButton ? "Versendet" : myText,
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 8.0),
                                child: Icon(Icons.send),
                              )
                            ])),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    txID,
                    style: TextStyle(
                      color: Colors.white,
                    ),
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

Future<String> sendToScript(nachricht, name1, name2) async {
  try {
    Map form = {"nachricht": nachricht, "name1": name1, "name2": name2};

    var send = await http.post(Uri.parse('http://10.0.2.2:5000'),
        headers: {'Content-Type': 'application/json'}, body: json.encode(form));

    final txId = (json.decode(send.body)).substring(9, 75);

    return txId;
  } on Exception catch (e) {
    return "schweisse";
  }
}
