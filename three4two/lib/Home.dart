import 'package:flutter/material.dart';
import 'package:three4two/Drawer.dart';
import 'package:three4two/Carousell.dart';
import 'package:three4two/Write.dart';
import 'package:three4two/Search.dart';

class Home extends StatelessWidget {
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
              child: imageCarousel(),
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return Write();
                          },
                        ),
                      );
                    }),
                ElevatedButton(
                  child: Icon(
                    Icons.search,
                    size: 24.0,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return Search();
                        },
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
                    Navigator.pop(context);
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
