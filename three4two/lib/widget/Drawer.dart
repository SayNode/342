import 'package:flutter/material.dart';
import 'package:three4two/FAQ.dart';
import 'package:three4two/Home.dart';
import 'package:three4two/about.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyDrawer extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 20);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        child: ListView(
          padding: padding,
          children: [
            Container(
              height: 250,
              child: DrawerHeader(
                decoration: BoxDecoration(color: Colors.grey[50]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      "assets/images/Logo.png",
                      height: 75,
                      width: 75,
                    ),
                    const SizedBox(width: 50),
                    Flexible(
                      child: Text(
                        AppLocalizations.of(context)!.presented,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Divider(
              height: 40,
              thickness: 2,
              indent: 5,
              endIndent: 0,
              color: Colors.pink,
            ),
            buildMenuItem(
              text: "Home",
              icon: Icons.home,
              onClicked: () => selectItem(context, 0),
            ),
            buildMenuItem(
              text: AppLocalizations.of(context)!.about,
              icon: Icons.people,
              onClicked: () => selectItem(context, 1),
            ),
            buildMenuItem(
              text: "FAQ",
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
  final color = Colors.pink;

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

  switch (index) {
    case 0:
      Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation1, animation2) => Home(),
            transitionDuration: Duration.zero,
          ));
      break;
    case 1:
      Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation1, animation2) => About(),
            transitionDuration: Duration.zero,
          ));
      break;
    case 2:
      Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation1, animation2) => FAQ(),
            transitionDuration: Duration.zero,
          ));
      break;
  }
}
