import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:three4two/TreeOnClick.dart';
import "package:hex/hex.dart";

class Test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hier kommt Baum 10"),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text("Get data"),
          onPressed: () async {
            await getNames();
          },
        ),
      ),
    );
  }
}

List<String> bothNames = [];
List<String> fullMessage = [];

Future<String> getNames() async {
  try {
    Map form = {
      "range": {"unit": "block", "from": 0, "to": 12178663},
      "options": {"offset": 0, "limit": 100},
      "criteriaSet": [
        {"address": "0x6f7BeC0AFcfF5d87d1817d6a3291E96CbD156944"}
      ],
      "order": "asc"
    };

    var sendToNode = await http.post(
        Uri.parse('https://sync-testnet.vechain.org/logs/event'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(form));

    List<dynamic> nodeResponse = json.decode(sendToNode.body);
    var numberOfEvents = nodeResponse.length;
    print(numberOfEvents);
    for (int i = 1; i < numberOfEvents; i++) {
      try {
        String data = nodeResponse[i]["data"];
        var length = data.length;

        String name1 = ascii.decode(
            HEX.decode(data.substring(length - 5 * 64, length - 4 * 64)));
        String name2 = ascii.decode(
            HEX.decode(data.substring(length - 3 * 64, length - 2 * 64)));
        String message =
            ascii.decode(HEX.decode(data.substring(length - 64, length)));
        String names = name1 + " + " + name2;

        bothNames.add(names);
        fullMessage.add(message);
      } on Exception catch (e) {
        print(e);
      }
    }
    return "Hello";
  } on Exception catch (e) {
    print(e);
    return "oops";
  }
}
