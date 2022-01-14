import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:three4two/Utils/store.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:three4two/TxOnClick.dart';
import 'globals.dart' as globals;
import 'dart:convert';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _Search();
}

List<String> txID = [];

class _Search extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Your messages'),
        ),
        body: FutureBuilder(
          future: getTxId(),
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
                    itemCount: txID.length,
                    itemBuilder: (BuildContext ctx, int index) {
                      return GestureDetector(
                        child: Container(
                          height: 100,
                          margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: Row(
                            children: [
                              Text(
                                (index + 1).toString(),
                                style: TextStyle(
                                    color: Colors.pink.shade800, fontSize: 50),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Flexible(
                                child: Text(
                                  "Transaction ID:" + "\n" + txID[index],
                                  style: TextStyle(color: Colors.grey.shade600),
                                ),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (context, animation1, animation2) =>
                                  TxOnClick(),
                              transitionDuration: Duration.zero,
                            ),
                          );
                        },
                      );
                    },
                  ),
                );
            }
          },
        ));
  }
}

Future getTxId() async {
  txID.clear();
  txID = await readJson() as List<String>;
}
