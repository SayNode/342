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
                          borderRadius: BorderRadius.all(Radius.circular(20))),
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
                      "Why do I have to pay something?",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      "Certain interactions with a blockchain costs money. To store data forever on a blockchain, like storing a message, you have to pay a fee to the nodes running the network. We take care of these fees in order to make the process as easy as possible for you.",
                      style:
                          TextStyle(fontSize: 18, color: Colors.grey.shade600),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Why are the characters of my message limited?",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      "The mire data you want to submit to the blockchain the more gas fees you have to pay. In order to keep the price affordable for anyone we had to limit the character input of the messages.",
                      style:
                          TextStyle(fontSize: 18, color: Colors.grey.shade600),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Can I delete my message?",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      "Once your message is send to the blockchain, it can't be deleted. This is in the very nature of blockchains, which makes them so secure. Your declaration of love will be stored forever.",
                      style:
                          TextStyle(fontSize: 18, color: Colors.grey.shade600),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Why did you choose VeChain as your blockchain?",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      "Why not? VeChain is a very scalable L1 solution with low fees and easily accessible developer toolkits. Because of the fee delegation feature of VeChain we can build blockchain applications with minimal technical user interactions.",
                      style:
                          TextStyle(fontSize: 18, color: Colors.grey.shade600),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(30),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size.fromHeight(40), primary: Colors.pink),
                    child: Text(
                      'back',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
