import 'package:flutter/material.dart';
import 'package:three4two/Home.dart';
import 'package:three4two/Thanks.dart';
import 'package:three4two/widget/paywall_widget.dart';
import 'package:three4two/api/purchase_api.dart';
import 'package:three4two/globals.dart' as globals;

import 'dart:convert';
import 'package:http/http.dart' as http;

Future fetchOffers(BuildContext context) async {
  final offerings = await PurchaseApi.fetchOffers();

  if (offerings.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("No offerings found"),
      ),
    );
  } else {
    final packages = offerings
        .map((offer) => offer.availablePackages)
        .expand((pair) => pair)
        .toList();

    showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return Container(
              child: PaywallWidget(
            packages: packages,
            title: "Buy Message",
            description: "Write your love messgage to the blockchain",
            onClickedPackage: (package) async {
              await PurchaseApi.purchasePackage(package);
              globals.recentTx = await sendToScript(
                  globals.message, globals.name1, globals.name2);
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => Thanks()),
                  (Route<dynamic> route) => false);
            },
          ));
        });

    final offer = offerings.first;
    print("Offer: $offer");
  }
}

Future<String> sendToScript(nachricht, name1, name2) async {
  try {
    Map form = {"nachricht": nachricht, "name1": name1, "name2": name2};

    var send = await http.post(
        Uri.parse(
            'http://flaskserver-env.eba-xkfx7gup.eu-central-1.elasticbeanstalk.com/'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(form));

    final txId = (json.decode(send.body)).substring(9, 75);

    return txId;
  } on Exception catch (e) {
    return "shit";
  }
}
