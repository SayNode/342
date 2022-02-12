import 'package:flutter/material.dart';
import 'package:three4two/Home.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:three4two/Thanks.dart';

class Screen0 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Container(
            padding: EdgeInsets.all(30),
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                        top: 20,
                      ),
                      child: Text(
                        AppLocalizations.of(context)!.welcome_one,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10, bottom: 20),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.pink, width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: Image.asset(
                        "assets/images/logo342.png",
                        height: MediaQuery.of(context).size.width / 5,
                      ),
                    ),
                    Container(
                      child: Image.asset("assets/Gifs/Start.gif"),
                    ),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: AppLocalizations.of(context)!.welcome_two,
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey.shade600,
                            ),
                          ),
                          WidgetSpan(
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.pink,
                                  border: Border.all(color: Colors.pink),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(7))),
                              child: Container(
                                padding: EdgeInsets.only(left: 10, right: 8),
                                child: Text(
                                  AppLocalizations.of(context)!.getStarted,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          TextSpan(
                            text: AppLocalizations.of(context)!.welcome_three,
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey.shade600,
                            ),
                          ),
                          WidgetSpan(
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.red.shade100,
                                  border: Border.all(color: Colors.pink),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15))),
                              child: Container(
                                padding: EdgeInsets.only(left: 10, right: 8),
                                child: Icon(
                                  Icons.send,
                                  size: 18,
                                  color: Colors.pink,
                                ),
                              ),
                            ),
                          ),
                          TextSpan(
                            text: " icon",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(top: 50),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(50),
                        primary: Colors.pink),
                    child: Text(
                      AppLocalizations.of(context)!.getStarted,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Home();
                      }));
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
