import 'package:app_provee/app/data/models/product_model.dart';

import '../provider/buy_provider.dart';

class BuyRepository {
  final BuyProvider apiBuy = BuyProvider();
  Future<String> setBuy(
      ProductModel product, int quantity, String usuario, String token) async {
    return apiBuy.setBuy(product, quantity, usuario, token);
  }

  Future<String> saveBuyApp(String id, String token, String apps,
      String dateOperation, String numberOperation, String image) async {
    return apiBuy.saveBuyApp(
        id, token, apps, dateOperation, numberOperation, image);
  }

  Future<String> saveBuyBank(String id, String token, String bank,
      String dateOperation, String numberOperation, String image) async {
    return apiBuy.saveBuyBank(
        id, token, bank, dateOperation, numberOperation, image);
  }
}
