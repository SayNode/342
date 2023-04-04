import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:three4two/Utils/globals.dart' as globals;

class TxOnClick extends StatelessWidget {
  final String names;
  final String message;
  final String txID;
  TxOnClick(
      {Key? key,
      required this.names,
      required this.message,
      required this.txID})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      child: Image(
                        image: AssetImage("assets/UI/UIBG.png"),
                      ),
                    ),
                    Positioned(
                      top: (MediaQuery.of(context).size.width) / 4,
                      child: Container(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        constraints: BoxConstraints(
                            minHeight: 50,
                            maxWidth: MediaQuery.of(context).size.width - 20),
                        decoration: BoxDecoration(
                            color: Colors.pink,
                            border: Border.all(color: Colors.white, width: 5),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Text(
                          names,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(30),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey.shade600,
                      ),
                      children: [
                        TextSpan(
                            text: AppLocalizations.of(context)!.message + "\n",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(
                          text: message,
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(30),
                  child: SelectableText.rich(
                    TextSpan(
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey.shade600,
                      ),
                      children: [
                        TextSpan(
                            text: AppLocalizations.of(context)!.transactionID +
                                "\n",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(
                          text: txID,
                        )
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(30),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              minimumSize: Size.fromHeight(50),
                              primary: Colors.pink),
                          child: Text(
                            AppLocalizations.of(context)!.explorer,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                          onPressed: () async {
                            final url =
                                ("https://explore.vechain.org/transactions/" +
                                    txID);
                            if (await canLaunch(url)) {
                              await launch(url);
                            }
                          },
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                minimumSize: Size.fromHeight(50),
                                primary: Colors.pink),
                            child: Text(
                              AppLocalizations.of(context)!.back,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                              Navigator.pop(context);
                            }),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
