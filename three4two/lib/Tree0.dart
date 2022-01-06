import 'package:flutter/material.dart';
import 'dart:math';
import 'package:three4two/TreeOnClick.dart';

class Tree extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Tree();
}

class _Tree extends State<Tree> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hier kommt Baum 10"),
      ),
      body: Center(
        child: _contentListView(),
      ),
    );
  }
}

Widget _contentListView() {
  List<String> names = [
    "Werner + Laura",
    "Renato + Sandra",
    "Rubli + Marisa",
    "Werner + Laura",
    "Renato + Sandra",
    "Rubli + Marisa",
    "Werner + Laura",
    "Renato + Sandra",
    "Rubli + Marisa",
    "Werner + Laura",
    "Renato + Sandra",
    "Rubli + Marisa"
  ];

  List<String> himmel = [
    "assets/images/himmel1.png",
    "assets/images/himmel2.png",
    "assets/images/himmel3.png",
    "assets/images/himmel4.png",
    "assets/images/himmel5.png",
    "assets/images/himmel6.png",
    "assets/images/himmel7.png",
  ];
  return ListView.builder(
    itemBuilder: (BuildContext ctx, int index) {
      return GestureDetector(
        child: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: <Widget>[
            Positioned.fill(
              child: Container(
                  child: Image.asset(
                himmel[Random().nextInt(7)],
                fit: BoxFit.fitHeight,
              )),
            ),
            FractionallySizedBox(
              alignment: Alignment.center,
              widthFactor: 0.7,
              child: Image.asset("assets/images/Baumstamm.png"),
            ),
            FractionallySizedBox(
              widthFactor: 0.7,
              child: Transform.rotate(
                angle: 0.5 - Random().nextDouble(),
                child: Container(
                  alignment: Alignment(1 - 2 * Random().nextDouble(),
                      1 - 2 * Random().nextDouble()),
                  padding: EdgeInsets.all(20),
                  child: Text(
                    names[index],
                    style: TextStyle(
                        color: Color(0xffDFD7C8).withOpacity(0.8),
                        fontSize: 30 * (Random().nextDouble() + 0.8),
                        fontWeight: FontWeight.bold,
                        fontFamily: "CARVEDWOOD"),
                  ),
                ),
              ),
            ),
          ],
        ),
        onTap: () {
          print(index);
          Navigator.push(
            ctx,
            MaterialPageRoute(
              builder: (context) {
                return TreeOnClick(text: names[index]);
              },
            ),
          );
        },
      );
    },
    itemCount: names.length,
  );
}
