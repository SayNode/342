import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
                      AppLocalizations.of(context)!.faq_one,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      AppLocalizations.of(context)!.faq_oneA,
                      style:
                          TextStyle(fontSize: 18, color: Colors.grey.shade600),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(height: 20),
                    Text(
                      AppLocalizations.of(context)!.faq_two,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      AppLocalizations.of(context)!.faq_twoA,
                      style:
                          TextStyle(fontSize: 18, color: Colors.grey.shade600),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(height: 20),
                    Text(
                      AppLocalizations.of(context)!.faq_three,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      AppLocalizations.of(context)!.faq_threeA,
                      style:
                          TextStyle(fontSize: 18, color: Colors.grey.shade600),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(height: 20),
                    Text(
                      AppLocalizations.of(context)!.faq_four,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      AppLocalizations.of(context)!.faq_fourA,
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
                      AppLocalizations.of(context)!.back,
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
