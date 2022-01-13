import 'package:flutter/material.dart';
import 'package:three4two/Tree0.dart';
import 'package:three4two/Tree1.dart';
import 'package:three4two/Tree2.dart';
import 'package:carousel_slider/carousel_slider.dart';

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
                        switch (i) {
                          case "assets/images/tree_green.png":
                            Navigator.push<Widget>(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Tree(),
                              ),
                            );
                            break;
                          case "assets/images/tree_orange.png":
                            Navigator.push<Widget>(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Tree1(),
                              ),
                            );
                            break;
                          case "assets/images/tree_yellow.png":
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
