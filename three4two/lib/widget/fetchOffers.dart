import 'package:flutter/material.dart';
import 'package:three4two/widget/paywall_widget.dart';
import 'package:three4two/api/purchase_api.dart';

Future fetchOffers(BuildContext context) async {
  final offerings = await PurchaseApi.fetchOffers();

  if (offerings.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("No offerings found"),
      ),
    );
  } else {
    final packages = offerings
        .map((offer) => offer.availablePackages)
        .expand((pair) => pair)
        .toList();

    showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return Container(
              child: PaywallWidget(
            packages: packages,
            title: "Buy Message",
            description: "Write your love messgage to the blockchain",
            onClickedPackage: (package) async {
              await PurchaseApi.purchasePackage(package);

              Navigator.pop(context);
            },
          ));
        });

    final offer = offerings.first;
    print("Offer: $offer");
  }
}
