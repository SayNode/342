import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPage();
}

class _SecondPage extends State<SecondPage> {
  String _enteredText = '';
  TextEditingController _controller = TextEditingController();
  bool myNewButton = false;
  String myText = "Senden";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          const Expanded(
            child: SlidingContainer(
              color: Colors.red,
              initialOffsetX: 1,
              intervalStart: 0,
              intervalEnd: 0.5,
            ),
          ),
          const Expanded(
            child: SlidingContainer(
              color: Color(0xffb71c1c),
              initialOffsetX: -1,
              intervalStart: 0.5,
              intervalEnd: 1,
            ),
          ),
          Container(
            padding: EdgeInsets.all(30),
            color: Colors.white,
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
                    color: Colors.black,
                    width: 2.0,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(
                    color: Colors.red.shade900,
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
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.red[900])),
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
    );
  }
}

class SlidingContainer extends StatelessWidget {
  final double initialOffsetX;
  final double intervalStart;
  final double intervalEnd;
  final Color color;

  const SlidingContainer({
    Key? key,
    required this.initialOffsetX,
    required this.intervalStart,
    required this.intervalEnd,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final animation = Provider.of<Animation<double>>(context, listen: false);

    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: Offset(initialOffsetX, 0),
            end: Offset(0, 0),
          ).animate(
            CurvedAnimation(
              curve: Interval(
                intervalStart,
                intervalEnd,
                curve: Curves.easeOutCubic,
              ),
              parent: animation,
            ),
          ),
          child: child,
        );
      },
      child: Container(
        color: color,
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
