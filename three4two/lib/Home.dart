import 'package:flutter/material.dart';
import 'package:three4two/Drawer.dart';
import 'package:three4two/Write.dart';
import 'package:three4two/Search.dart';
import 'package:three4two/Tree0.dart';
import 'package:three4two/Tree1.dart';
import 'package:three4two/Tree2.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dies ist die Home Seite'),
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
                    child: const Icon(
                      Icons.send_sharp,
                      color: Colors.white,
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
                  child: const Icon(
                    Icons.search,
                    color: Colors.white,
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
                  child: const Icon(
                    Icons.share,
                    color: Colors.white,
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

Widget imageCarousel() {
  return Container(
      height: 400.0,
      child: CarouselSlider(
        options: CarouselOptions(
          height: 300,
          enlargeCenterPage: true,
          enableInfiniteScroll: true,
        ),
        items: [
          "assets/images/tree_green.png",
          "assets/images/tree_yellow.png",
          "assets/images/tree_orange.png",
        ].map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.red[50],
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  child: GestureDetector(
                      child: Image.asset(i, fit: BoxFit.fitHeight),
                      onTap: () {
                        print(i);
                        switch (i) {
                          case "assets/images/tree_green.png":
                            print("Green");
                            Navigator.push<Widget>(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Tree(),
                              ),
                            );
                            break;
                          case "assets/images/tree_orange.png":
                            print("Orange");
                            Navigator.push<Widget>(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Tree1(),
                              ),
                            );
                            break;
                          case "assets/images/tree_yellow.png":
                            print("yellow");
                            Navigator.push<Widget>(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Tree2(),
                              ),
                            );
                        }
                      }));
            },
          );
        }).toList(),
      ));
}
