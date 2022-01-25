import 'package:purchases_flutter/purchases_flutter.dart';

String _apiKey = "";

class PurchaseApi {
  static setup(String apiKey) {
    _apiKey = apiKey;
  }

  static Future init() async {
    await Purchases.setDebugLogsEnabled(true);
    await Purchases.setup(_apiKey);
    print(_apiKey);
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
