import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Help extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                    padding:
                        EdgeInsets.only(top: 5, bottom: 5, left: 15, right: 15),
                    decoration: BoxDecoration(
                        color: Colors.pink,
                        border: Border.all(color: Colors.white, width: 5),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Text(
                      AppLocalizations.of(context)!.help,
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(30),
              child: Text(
                AppLocalizations.of(context)!.writeUsText,
                style: TextStyle(fontSize: 18, color: Colors.grey.shade600),
                textAlign: TextAlign.center,
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.all(30),
              title: Row(
                children: <Widget>[
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size.fromHeight(40),
                          primary: Colors.pink),
                      child: Text(
                        AppLocalizations.of(context)!.writeUs,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      onPressed: () async {
                        final Uri _emailLaunchUri = Uri(
                            scheme: 'mailto',
                            path: '342@saynode.ch',
                            queryParameters: {'subject': 'Tree for two'});

                        launch(_emailLaunchUri.toString());
                      },
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size.fromHeight(40),
                            primary: Colors.pink),
                        child: Text(
                          AppLocalizations.of(context)!.back,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
