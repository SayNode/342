import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:three4two/TreeOnClick.dart';
import "package:hex/hex.dart";
import 'package:three4two/Utils/globals.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:three4two/Write.dart';
import 'package:transparent_image/transparent_image.dart';

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
    return Scaffold(
      backgroundColor: Color(0xff6ca8ef),
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
            if (snapshot.hasError) {
              return Center(
                child: Text(
                  'Error: ${snapshot.error}',
                  style: TextStyle(color: Colors.white),
                ),
              );
            } else if (snapshot.data == null && bothNames.length == 0) {
              return Center(
                child: Container(
                  margin: EdgeInsets.all(30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'There are no messages on this tree',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                        textAlign: TextAlign.center,
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 20),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              minimumSize: const Size.fromHeight(50),
                              primary: Colors.white),
                          child: Text(
                            'Write the first message',
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          onPressed: () async {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder:
                                    (context, animation1, animation2) =>
                                        Write(),
                                transitionDuration: Duration.zero,
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              );
            } else
              return Center(
                child: ListView.builder(
                  cacheExtent: 10,
                  itemBuilder: (BuildContext ctx, int index) {
                    return GestureDetector(
                      child: Stack(
                        alignment: Alignment.center,
                        clipBehavior: Clip.none,
                        children: <Widget>[
                          FadeInImage(
                            placeholder:
                                AssetImage("assets/images/himmel1.png"),
                            image: AssetImage(
                              himmel[Random().nextInt(7)],
                            ),
                            fadeInDuration: Duration(seconds: 1),
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
                                          30 * (Random().nextDouble() + 0.5),
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
  var bestBlock =
      await http.get(Uri.parse('http://3.124.193.149:8669/blocks/best'));
  var bestBlockList = json.decode(bestBlock.body);
  int best = (bestBlockList['number']);
  try {
    Map form = {
      "range": {"unit": "block", "from": 0, "to": best},
      "options": {"offset": 0, "limit": 100},
      "criteriaSet": [
        {"address": "0x8F0DBffc066f9DEd3cDc5f283CA51f02237E7eD8"}
      ],
      "order": "asc"
    };
    var sendToNode = await http.post(
        Uri.parse('http://3.124.193.149:8669/logs/event'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(form));

    List<dynamic> nodeResponse = json.decode(sendToNode.body);

    var numberOfEvents = nodeResponse.length;

    for (int i = 1; i < numberOfEvents; i++) {
      try {
        String data = nodeResponse[i]["data"];

        var length = data.length;
        if (length > 700) {
          String name1 = utf8.decode(HEX.decode(data.substring(450, 514)));
          String name2 = utf8.decode(HEX.decode(data.substring(578, 642)));
          String message = utf8.decode(HEX.decode(data.substring(705, length)));
          String names = name1 + " + " + name2;

          bothNames.add(names);
          fullMessage.add(message);
        }
      } on Exception catch (e) {
        print(e);
      }
    }
    return;
  } on Exception catch (e) {
    return;
  }
}
