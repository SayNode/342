import 'package:flutter/material.dart';
import 'package:three4two/Tree0.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:three4two/Utils/globals.dart' as globals;

class imageCarousel extends StatefulWidget {
  const imageCarousel({Key? key}) : super(key: key);

  @override
  State<imageCarousel> createState() => _imageCarousel();
}

int idx = 0;

class _imageCarousel extends State<imageCarousel> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 400.0,
        child: CarouselSlider(
          options: CarouselOptions(
            height: 300,
            enlargeCenterPage: true,
            enableInfiniteScroll: false,
            onPageChanged: (index, reason) {
              setState(
                () {
                  globals.carouselIndex = index; //<-- Page index
                },
              );
            },
          ),
          items: treeURL.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.red[50],
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    child: GestureDetector(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 10,
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Image.network(
                                  i,
                                ),
                              ),
                            ),
                            Expanded(flex: 1, child: Text("TreeName"))
                          ],
                        ),
                        onTap: () {
                          setState(() {});
                          Navigator.push<Widget>(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Tree(
                                  treeID: globals.trees[treeURL.indexOf(i)]),
                            ),
                          );
                        }));
              },
            );
          }).toList(),
        ));
  }
}

List treeURL = [
  globals.serverURL + "tree/" + globals.trees[0],
  globals.serverURL + "tree/" + globals.trees[1],
  globals.serverURL + "tree/" + globals.trees[2],
  globals.serverURL + "tree/" + globals.trees[3],
  globals.serverURL + "tree/" + globals.trees[4],
  globals.serverURL + "tree/" + globals.trees[5],
];
