import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:three4two/TreeOnClick.dart';

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

    final nodeResponse = (json.decode(sendToNode.body));
    print(nodeResponse);
    return nodeResponse;
  } on Exception catch (e) {
    print(e);
    return "shit";
  }
}
