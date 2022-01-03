import 'package:flutter/material.dart';
import 'package:three4two/Help.dart';
import 'package:three4two/Home.dart';
import 'package:three4two/Write.dart';
import 'package:three4two/Search.dart';
import 'package:three4two/Tree.dart';
import 'package:three4two/about.dart';

class MyDrawer extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 20);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Colors.red,
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: padding,
          children: [
            Container(
              height: 150,
              child: DrawerHeader(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      "assets/images/Logo.png",
                      height: 50,
                      width: 50,
                    ),
                    SizedBox(width: 50),
                    const Flexible(
                      child: Text(
                        'presented by SayNode',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            Divider(color: Colors.white),
            const SizedBox(height: 24),
            buildMenuItem(
              text: "Home",
              icon: Icons.home,
              onClicked: () => selectItem(context, 0),
            ),
            buildMenuItem(
              text: "About",
              icon: Icons.people,
              onClicked: () => selectItem(context, 1),
            ),
            buildMenuItem(
              text: "Help",
              icon: Icons.help,
              onClicked: () => selectItem(context, 2),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildMenuItem({
  required String text,
  required IconData icon,
  VoidCallback? onClicked,
}) {
  final color = Colors.white;

  return ListTile(
    leading: Icon(
      icon,
      color: color,
    ),
    title: Text(
      text,
      style: TextStyle(color: color, fontSize: 20),
    ),
    onTap: onClicked,
  );
}

void selectItem(BuildContext context, int index) {
  Navigator.of(context).pop();
  Navigator.of(context).pop();

  switch (index) {
    case 0:
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => Screen1(),
        ),
      );
      break;
    case 1:
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => About(),
        ),
      );
      break;
    case 2:
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => Screen0(),
        ),
      );
      break;
  }
}
