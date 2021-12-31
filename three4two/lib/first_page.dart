import 'package:three4two/second_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.network(
            'https://media.giphy.com/media/26BRv0ThflsHCqDrG/giphy.gif'),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) {
                  return ListenableProvider(
                    create: (context) => animation,
                    child: SecondPage(),
                  );
                },
                transitionDuration: const Duration(seconds: 1),
              ),
            );
          },
          child: Text('Start')),
    );
  }
}

Future<String> sendToScript(nachricht) async {
  print(nachricht);
  Map form = {"nachricht": nachricht};
  print(form);
  var send = await http.post(Uri.parse(''),
      headers: {'Content-Type': 'application/json'}, body: json.encode(form));

  return "Txnummer"; //jsonDecode(send.body);
}
