import 'package:flutter/material.dart';
import 'package:three4two/Tree0.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:three4two/Utils/globals.dart' as globals;

class imageCarousel extends StatefulWidget {
  const imageCarousel({Key? key}) : super(key: key);

  @override
  State<imageCarousel> createState() => _imageCarousel();
}

class _imageCarousel extends State<imageCarousel> {
  @override
  Widget build(BuildContext context) {
    PaintingBinding.instance!.imageCache?.clear();
    return Container(
        height: 400.0,
        child: CarouselSlider(
          options: CarouselOptions(
            height: 300,
            enlargeCenterPage: true,
            enableInfiniteScroll: false,
          ),
          items: [
            globals.serverURL + "/tree",
            globals.serverURL + "/tree",
            globals.serverURL + "/tree",
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
                        child: Image.network(i, fit: BoxFit.fitHeight),
                        onTap: () {
                          setState(() {});
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
}
