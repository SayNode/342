import 'package:flutter/material.dart';
import 'package:three4two/NewTree.dart';
import 'package:three4two/widget/Drawer.dart';
import 'package:three4two/widget/Carousell.dart';
import 'package:three4two/Search.dart';
import 'package:three4two/Write.dart';
import 'package:three4two/OwnTransactions.dart';
import 'package:launch_review/launch_review.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.pink, size: 30),
      ),
      drawer: MyDrawer(),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 2,
                    child: imageCarousel(),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 30, right: 30, top: 10),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size.fromHeight(40),
                            primary: Colors.red.shade50),
                        child: Text(
                          AppLocalizations.of(context)!.plantTree,
                          style: TextStyle(
                              color: Colors.pink,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (context, animation1, animation2) =>
                                  newTree(),
                              transitionDuration: Duration.zero,
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ElevatedButton(
                    child: Icon(
                      Icons.send_sharp,
                      size: 24.0,
                    ),
                    onPressed: () {
                      setState(() {});

                      Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (context, animation1, animation2) =>
                                Write(),
                            transitionDuration: Duration.zero,
                          ));
                    }),
                ElevatedButton(
                  child: Icon(
                    Icons.search,
                    size: 24.0,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation1, animation2) =>
                            Search(),
                        transitionDuration: Duration.zero,
                      ),
                    );
                  },
                ),
                ElevatedButton(
                  child: Icon(
                    Icons.list,
                    size: 24.0,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation1, animation2) =>
                            OwnTx(),
                        transitionDuration: Duration.zero,
                      ),
                    );
                  },
                ),
                ElevatedButton(
                  child: Icon(
                    Icons.share,
                    size: 24.0,
                  ),
                  onPressed: () {
                    LaunchReview.launch(
                      androidAppId: "ch.saynode.three42",
                      iOSAppId: "1606557166",
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
