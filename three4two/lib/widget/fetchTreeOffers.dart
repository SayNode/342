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
import "package:hex/hex.dart";

import 'dart:convert';
import 'package:http/http.dart' as http;

Future fetchTreeOffers(BuildContext context) async {
  Offerings offerings = await Purchases.getOfferings();
  var packages;
  packages = offerings.getOffering("tree")?.availablePackages;

  bool success = false;
  showModalBottomSheet<void>(
    context: context,
    builder: (BuildContext context) {
      return Container(
        child: PaywallWidget(
          packages: packages,
          title: "Plant a tree",
          description: "Plant your own tree on the blockchain",
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
                  content: Text("Planting your tree..."),
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
  await plantTree(globals.newTreeName);
  var baum = await getLatestTree();
  globals.recentTx =
      await sendToScript(globals.message, globals.name1, globals.name2, baum);
  writeJson(globals.txId.toString(), globals.recentTx);
  globals.txId++;
  Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => Thanks()),
      (Route<dynamic> route) => false);
}

Future<String> plantTree(treename) async {
  await Future.delayed(Duration(seconds: 2));
  try {
    Map form = {'treename': treename};
    var send = await http.post(Uri.parse("http://10.0.2.2:5000/plantTree/"),
        headers: {'Content-Type': 'application/json'}, body: json.encode(form));

    print(send.body);

    final txId = (json.decode(send.body)).substring(8, 74);

    return txId;
  } on Exception catch (e) {
    return e.toString() + "oops";
  }
}

Future<String> sendToScript(nachricht, name1, name2, baum) async {
  await Future.delayed(Duration(seconds: 2));
  try {
    Map form = {
      'nachricht': nachricht,
      'name1': name1,
      'name2': name2,
      'tree': baum
    };
    print(form);
    var send = await http.post(Uri.parse('http://10.0.2.2:5000/'),
        headers: {'Content-Type': 'application/json'}, body: json.encode(form));

    print(send.body);

    final txId = (json.decode(send.body)).substring(8, 74);

    return txId;
  } on Exception catch (e) {
    return e.toString() + "oops";
  }
}

Future<String> getLatestTree() async {
  var bestBlock =
      await http.get(Uri.parse('http://3.71.71.72:8669/blocks/best'));
  var bestBlockList = json.decode(bestBlock.body);
  int best = (bestBlockList['number']);
  try {
    Map form = {
      "range": {"unit": "block", "from": 0, "to": best},
      "options": {"offset": 0, "limit": 300},
      "criteriaSet": [
        {
          "address": "0xca4B53CF539e30d61D7111cf784BFFA3587C4FE0",
          "topic0":
              "0xeb3a151fbf02ed5c90d14b23ba486256b168f6ab2364c5b47319046b11547836"
        }
      ],
      "order": "asc"
    };
    var sendToNode = await http.post(
        Uri.parse('http://3.71.71.72:8669/logs/event'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(form));

    List<dynamic> nodeResponse = json.decode(sendToNode.body);
    String treeAddress = nodeResponse.last['topics'][2];

    treeAddress = "0x" + treeAddress.substring(26, treeAddress.length);

    return treeAddress;
  } on Exception catch (e) {
    return "fail";
  }
}