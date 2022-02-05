import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:three4two/TreeOnClick.dart';
import 'package:three4two/Utils/store.dart';
import 'package:three4two/widget/loading.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:three4two/TxOnClick.dart';
import 'Utils/globals.dart' as globals;
import 'dart:convert';
import 'package:http/http.dart' as http;
import "package:hex/hex.dart";

class OwnTx extends StatefulWidget {
  const OwnTx({Key? key}) : super(key: key);

  @override
  State<OwnTx> createState() => _OwnTx();
}

List<String> txID = [];
String names = "";
String message = "";

class _OwnTx extends State<OwnTx> {
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
                        onTap: () async {
                          Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder:
                                    (context, animation1, animation2) =>
                                        loading(),
                                transitionDuration: Duration.zero,
                              ));
                          await getMessagefromTransaction(txID[index]);
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (context, animation1, animation2) =>
                                  TxOnClick(
                                      names: names,
                                      message: message,
                                      txID: txID[index]),
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

Future getMessagefromTransaction(_id) async {
  try {
    var txData =
        await http.get(Uri.parse(globals.nodeURL + 'transactions/' + _id));
    var data = json.decode(txData.body)["clauses"][0]["data"];

    var length = data.length;
    print(data);
    if (length > 330) {
      String name1 = utf8.decode(HEX.decode(data.substring(266, 330)));
      String name2 = utf8.decode(HEX.decode(data.substring(394, 458)));
      message = ascii.decode(HEX.decode(data.substring(522, length)));
      names = name1 + " + " + name2;
      print(names);
      print(message);
    }
  } on Exception catch (e) {
    names = "Error";
    message = "There was an error";
  }
}
