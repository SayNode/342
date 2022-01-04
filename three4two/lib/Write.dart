import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:three4two/Drawer.dart';

class Write extends StatefulWidget {
  const Write({Key? key}) : super(key: key);

  @override
  State<Write> createState() => _Write();
}

class _Write extends State<Write> {
  String _enteredText = '';
  TextEditingController _controller = TextEditingController();
  bool myNewButton = false;
  String myText = "Senden";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: MyDrawer(),
      body: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(30),
              child: TextFormField(
                onChanged: (value) {
                  setState(() {
                    _enteredText = value;
                  });
                },
                inputFormatters: [
                  LengthLimitingTextInputFormatter(200),
                ],
                decoration: InputDecoration(
                  hintText: 'Hier kannst du deine Nachricht eingeben',
                  helperText: 'Maximal 200 Zeichen',
                  counterText:
                      '${(200 - _enteredText.length).toString()} Zeichen übrig',
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: const BorderSide(
                      width: 2.0,
                    ),
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
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(top: 25.0, bottom: 50.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () async {
                          var tx = await sendToScript(_controller.text);
                          setState(() {
                            myNewButton = !myNewButton;
                            Text(tx);
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
          ],
        ),
      ),
    );
  }
}

Future<String> sendToScript(nachricht) async {
  print(nachricht);
  Map form = {"nachricht": nachricht};
  print(form);
  var send = await http.post(Uri.parse('https://www.google.ch'),
      headers: {'Content-Type': 'application/json'}, body: json.encode(form));

  return "Txnummer"; //jsonDecode(send.body);
}
