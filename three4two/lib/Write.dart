import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:three4two/Drawer.dart';
import 'package:three4two/globals.dart' as globals;
import "package:three4two/widget/fetchOffers.dart";

class Write extends StatefulWidget {
  const Write({Key? key}) : super(key: key);

  @override
  State<Write> createState() => _Write();
}

class _Write extends State<Write> {
  TextEditingController _controller = TextEditingController();
  TextEditingController name1Controller = TextEditingController();
  TextEditingController name2Controller = TextEditingController();
  bool myNewButton = false;
  String myText = "send";
  String txID = "";
  bool sucessfulPayment = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.pink, size: 30),
      ),
      drawer: MyDrawer(),
      body: Center(
        child: Container(
          child: SingleChildScrollView(
            padding: EdgeInsets.only(top: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(20),
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: Colors.pink.shade800,
                        borderRadius: BorderRadius.all(Radius.circular(25))),
                    child: Column(
                      children: [
                        Text(
                          " Write your message",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "Be aware, that your message is stored permanently and can't be removed from the blockchain.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  children: [
                    Flexible(
                      child: Container(
                        padding: const EdgeInsets.only(left: 20, right: 10),
                        child: TextField(
                          controller: name1Controller,
                          onChanged: (value) {
                            setState(
                              () {
                                globals.name1 = value;
                              },
                            );
                          },
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
                          onChanged: (value) {
                            setState(
                              () {
                                globals.name2 = value;
                              },
                            );
                          },
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
                              hintText: "your loved one"),
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
                          globals.message = value;
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
                      helperStyle: TextStyle(color: Colors.white),
                      counterText:
                          '${(200 - globals.message.length).toString()} characters left',
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
                              FocusScope.of(context).requestFocus(FocusNode());
                              await fetchOffers(context);
                            },
                            child: Row(children: [
                              Text(
                                myText,
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
