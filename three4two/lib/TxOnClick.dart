import 'package:flutter/material.dart';

class TxOnClick extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    precacheImage(AssetImage("assets/UI/UIBG.png"), context);
    return Scaffold(
        body: Container(
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                child: Image(
                  image: AssetImage("assets/UI/UIBG.png"),
                ),
              ),
              Positioned(
                top: (MediaQuery.of(context).size.width) / 4,
                child: Container(
                  padding:
                      EdgeInsets.only(top: 5, bottom: 5, left: 15, right: 15),
                  decoration: BoxDecoration(
                      color: Colors.pink,
                      border: Border.all(color: Colors.white, width: 5),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Text(
                    "Hier stehen die namen",
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.all(30),
            child: Text(
              "Hier steht der Text",
              style: TextStyle(fontSize: 18, color: Colors.grey.shade600),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            margin: EdgeInsets.all(30),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                    primary: Colors.pink),
                child: Text(
                  'go back',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  Navigator.pop(context);
                }),
          )
        ],
      ),
    ));
  }
}
