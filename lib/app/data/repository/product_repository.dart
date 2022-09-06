import '../models/product_model.dart';
import '../provider/product_provider.dart';

class ProductRepository {
  final ProductProvider apiProduct = ProductProvider();
  Future<List<ProductModel>> getProducts(
      String token, String category, String product, String city) async {
    return apiProduct.getProducts(token, category, product, city);
  }
}
