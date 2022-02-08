import 'package:flutter/material.dart';
import 'package:three4two/Home.dart';
import 'package:three4two/Thanks.dart';
import 'package:three4two/Error.dart';
import 'package:three4two/widget/loading.dart';
import 'package:three4two/widget/paywall_widget.dart';
import 'package:three4two/Utils/globals.dart' as globals;
import 'package:three4two/Utils/store.dart';
import 'package:three4two/api/purchase_api.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:audioplayers/audioplayers.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

Future fetchOffers(BuildContext context) async {
  Offerings offerings = await Purchases.getOfferings();
  var packages;
  packages = offerings.getOffering("messages")?.availablePackages;
  bool success = false;
  showModalBottomSheet<void>(
    context: context,
    builder: (BuildContext context) {
      return Container(
        child: PaywallWidget(
          packages: packages,
          title: "Buy Message",
          description: "Write your love messgage to the blockchain",
          onClickedPackage: (package) async {
            Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation1, animation2) => loading(),
                  transitionDuration: Duration.zero,
                ));
            success = await PurchaseApi.purchasePackage(package);
            if (success == true) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Writing your message to the blockchain"),
                ),
              );
              await purchase(context);
            } else {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (context) => ErrorWithTransaction()),
                  (Route<dynamic> route) => false);
            }
          },
        ),
      );
    },
  );
  ;
}

Future purchase(context) async {
  globals.recentTx =
      await sendToScript(globals.message, globals.name1, globals.name2);
  writeJson(globals.txId.toString(), globals.recentTx);
  globals.txId++;
  playLocal();
  Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => Thanks()),
      (Route<dynamic> route) => false);
}

Future<String> sendToScript(nachricht, name1, name2) async {
  await Future.delayed(Duration(seconds: 2));
  try {
    Map form = {
      'nachricht': nachricht,
      'name1': name1,
      'name2': name2,
      "tree": globals.trees[globals.carouselIndex]
    };
    print(form);
    var send = await http.post(Uri.parse(globals.serverURL),
        headers: {'Content-Type': 'application/json'}, body: json.encode(form));

    print(send.body);

    final txId = (json.decode(send.body)).substring(8, 74);

    return txId;
  } on Exception catch (e) {
    return e.toString() + "oops";
  }
}

playLocal() async {
  final player = AudioCache();
  player.play('sounds/write1.mp3');
}
