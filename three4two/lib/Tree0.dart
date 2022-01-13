import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:three4two/TreeOnClick.dart';
import "package:hex/hex.dart";
import 'package:three4two/globals.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

List<String> himmel = [
  "assets/images/himmel1.png",
  "assets/images/himmel2.png",
  "assets/images/himmel3.png",
  "assets/images/himmel4.png",
  "assets/images/himmel5.png",
  "assets/images/himmel6.png",
  "assets/images/himmel7.png",
];

List<String> bothNames = [];
List<String> fullMessage = [];

class Tree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    precacheImage(AssetImage("assets/images/himmel1.png"), context);
    precacheImage(AssetImage("assets/images/himmel2.png"), context);
    precacheImage(AssetImage("assets/images/himmel3.png"), context);
    precacheImage(AssetImage("assets/images/himmel4.png"), context);
    precacheImage(AssetImage("assets/images/himmel5.png"), context);
    precacheImage(AssetImage("assets/images/himmel6.png"), context);
    precacheImage(AssetImage("assets/images/himmel7.png"), context);
    precacheImage(AssetImage("assets/images/Baumstamm.png"), context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.pink, size: 30),
      ),
      body: FutureBuilder(
        future: getNames(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: SpinKitPumpingHeart(
              color: Colors.white,
              size: 100.0,
            ));
          } else {
            if (snapshot.hasError)
              return Center(child: Text('Error: ${snapshot.error}'));
            else
              return Center(
                child: ListView.builder(
                  cacheExtent: 1000,
                  itemBuilder: (BuildContext ctx, int index) {
                    return GestureDetector(
                      child: Stack(
                        alignment: Alignment.center,
                        clipBehavior: Clip.none,
                        children: <Widget>[
                          Positioned.fill(
                            child: Container(
                                child: Image.asset(
                              himmel[Random().nextInt(7)],
                              fit: BoxFit.fitHeight,
                            )),
                          ),
                          FractionallySizedBox(
                            alignment: Alignment.center,
                            widthFactor: 0.7,
                            child: Image.asset("assets/images/Baumstamm.png"),
                          ),
                          FractionallySizedBox(
                            widthFactor: 0.7,
                            child: Transform.rotate(
                              angle: 0.5 - Random().nextDouble(),
                              child: Container(
                                alignment: Alignment(
                                    1 - 2 * Random().nextDouble(),
                                    1 - 2 * Random().nextDouble()),
                                padding: EdgeInsets.all(20),
                                child: Text(
                                  bothNames[index],
                                  style: TextStyle(
                                      color: Color(0xffDFD7C8).withOpacity(0.8),
                                      fontSize:
                                          30 * (Random().nextDouble() + 0.8),
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "CARVEDWOOD"),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (context, animation1, animation2) =>
                                TreeOnClick(
                              names: bothNames[index],
                              message: fullMessage[index],
                            ),
                            transitionDuration: Duration.zero,
                          ),
                        );
                      },
                    );
                  },
                  itemCount: bothNames.length,
                ),
              );
          }
        },
      ),
    );
  }
}

Future getNames() async {
  bothNames.clear();
  fullMessage.clear();

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
      } on Exception catch (e) {}
    }
    return;
  } on Exception catch (e) {
    return;
  }
}
