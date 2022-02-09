import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:three4two/Tree0.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:three4two/Utils/globals.dart' as globals;
import 'package:three4two/widget/getTrees.dart';
import 'package:three4two/widget/loading.dart';

class imageCarousel extends StatefulWidget {
  const imageCarousel({Key? key}) : super(key: key);

  @override
  State<imageCarousel> createState() => _imageCarousel();
}

List<String> treeURL = [];

class _imageCarousel extends State<imageCarousel> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: generateTreeURL(),
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text(
              'Error: ${snapshot.error}',
              style: TextStyle(color: Colors.white),
            ),
          );
        } else if (snapshot.hasData) {
          return Container(
            height: MediaQuery.of(context).size.height / 2,
            child: CarouselSlider(
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height / 2,
                enlargeCenterPage: true,
                enableInfiniteScroll: false,
                onPageChanged: (index, reason) {
                  globals.carouselIndex = index;
                },
              ),
              items: treeURL.map(
                (i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: Colors.red[50],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0))),
                          child: GestureDetector(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 10,
                                  child: Container(
                                    child: Image.network(
                                      i,
                                      loadingBuilder:
                                          (context, child, loadingProgress) {
                                        if (loadingProgress == null)
                                          return child;
                                        return loading();
                                      },
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                ),
                                Expanded(
                                    flex: 1,
                                    child: Text(
                                        globals.treeNames[treeURL.indexOf(i)]))
                              ],
                            ),
                            onTap: () {
                              Navigator.push<Widget>(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Tree(
                                      treeID:
                                          globals.trees[treeURL.indexOf(i)]),
                                ),
                              );
                            },
                          ));
                    },
                  );
                },
              ).toList(),
            ),
          );
        } else {
          return Center(
              child: SpinKitPumpingHeart(
            color: Colors.white,
            size: 100.0,
          ));
        }
      },
    );
  }
}

Future<List<String>> generateTreeURL() async {
  await getTrees();
  Future.delayed(Duration(seconds: 10));
  treeURL.clear();
  for (var x = 0; x < globals.trees.length; x++) {
    treeURL.add(
      globals.serverURL +
          "tree/" +
          globals.trees[x] +
          "?v=${DateTime.now().millisecondsSinceEpoch}",
    );
  }

  return treeURL;
}
