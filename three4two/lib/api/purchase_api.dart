import 'dart:io';

import 'package:purchases_flutter/purchases_flutter.dart';

String _apiKey = "";

class PurchaseApi {
  static Future init() async {
    await Purchases.setDebugLogsEnabled(true);
    if (Platform.isAndroid) {
      await Purchases.setup("goog_UYKeLtkxkTOeYFYpXIbQodzNXJt");
    } else if (Platform.isIOS) {
      await Purchases.setup("appl_eGHnRnNehLMIkPZUbqAedqgjBND");
    }
  }

  static Future<List<Offering>> fetchOffers() async {
    try {
      final offerings = await Purchases.getOfferings();
      final current = offerings.current;
      return current == null ? [] : [current];
    } on Exception catch (e) {
      return [];
    }
  }

  static Future<bool> purchasePackage(Package package) async {
    try {
      await Purchases.purchasePackage(package);

      return true;
    } on Exception catch (e) {
      return false;
    }
  }
}
