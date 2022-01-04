import 'package:flutter/material.dart';

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
        child: FractionallySizedBox(
          widthFactor: 0.8,
          child: _contentListView(),
        ),
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
  return ListView.builder(
    itemBuilder: (BuildContext ctx, int index) {
      return GestureDetector(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              child: Image.asset("assets/images/Baumstamm.png"),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                names[index],
                style: TextStyle(
                    color: Color(0xffDFD7C8).withOpacity(0.8),
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    fontFamily: "CARVEDWOOD"),
              ),
            )
          ],
        ),
        onTap: () {
          print(index);
        },
      );
    },
    itemCount: names.length,
  );
}
