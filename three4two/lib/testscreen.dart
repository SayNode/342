import 'package:flutter/material.dart';

class ImageScreen extends StatelessWidget {
  final String url;
  ImageScreen(this.url);

  @override
  Widget build(BuildContext context) {
    print(url);
    switch (url) {
      case "assets/images/tree_green.png":
        print("Green");

        break;
      case "assets/images/tree_orange.png":
        print("Orange");
        break;
      case "assets/images/tree_orange.png":
        print("yellow");
        break;
    }
    return Scaffold(
        appBar: AppBar(
          title: Text('ImageScreen'),
        ),
        body: Image.asset(url, width: double.infinity));
  }
}
