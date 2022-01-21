import 'package:flutter/material.dart';
import 'package:three4two/widget/Drawer.dart';
import 'package:three4two/widget/Carousell.dart';
import 'package:three4two/Search.dart';
import 'package:three4two/Write.dart';
import 'package:three4two/OwnTransactions.dart';
import 'package:share/share.dart';
import 'package:three4two/Tree0.dart';

import 'package:carousel_slider/carousel_slider.dart';

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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              child: Container(
                height: 400.0,
                child: imageCarousel(),
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
                    Share.share("www.saynode.ch");
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
