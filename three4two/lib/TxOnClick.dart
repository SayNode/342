import 'package:flutter/material.dart';

class TxOnClick extends StatelessWidget {
  final String names;
  final String message;
  TxOnClick({Key? key, required this.names, required this.message})
      : super(key: key);

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
                  padding: EdgeInsets.only(left: 10, right: 10),
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width - 20),
                  decoration: BoxDecoration(
                      color: Colors.pink,
                      border: Border.all(color: Colors.white, width: 5),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Text(
                    names,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(right: 30, left: 30),
            child: Text(
              message,
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
                  'back',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                }),
          )
        ],
      ),
    ));
  }
}
