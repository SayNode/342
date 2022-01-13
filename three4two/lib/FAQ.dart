import 'package:flutter/material.dart';

class FAQ extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        clipBehavior: Clip.hardEdge,
        child: Container(
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
                        padding: EdgeInsets.only(
                            top: 5, bottom: 5, left: 15, right: 15),
                        decoration: BoxDecoration(
                            color: Colors.pink,
                            border: Border.all(color: Colors.white, width: 5),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Text(
                          "FAQ",
                          style: TextStyle(fontSize: 30, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Why does it cost something?",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        "Certain interactions with a blockchain costs money. If you want to run a website, you pay the hosting company a rent. By storing data on a blockchain, like storing a message, you pay a small fee to the network. The fees are payed through our own crypto wallet to ensure a easy acces for you. To cover all our expences we charge a small amout of money.  ",
                        style: TextStyle(
                            fontSize: 18, color: Colors.grey.shade600),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 20),
                      Text(
                        "How can I delete my message?",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        "Once your message is send to the blockchain, it can't be deleted. This is in the very nature of blockchains, which makes them so secure by the way, that you can't change data on it",
                        style: TextStyle(
                            fontSize: 18, color: Colors.grey.shade600),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Why Vechain",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        "Why not?",
                        style: TextStyle(
                            fontSize: 18, color: Colors.grey.shade600),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
