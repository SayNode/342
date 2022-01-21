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
          enableInfiniteScroll: false,
        ),
        items: [
          "http://tree2-env.eba-fi58hgdk.eu-central-1.elasticbeanstalk.com//tree",
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
                      child: Image.network(
                          "http://tree2-env.eba-fi58hgdk.eu-central-1.elasticbeanstalk.com//tree",
                          fit: BoxFit.fitHeight),
                      onTap: () {
                        Navigator.push<Widget>(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Tree(),
                          ),
                        );
                      }));
            },
          );
        }).toList(),
      ));
}
