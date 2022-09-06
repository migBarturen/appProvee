import '../models/category_model.dart';
import '../provider/category_provider.dart';

class CategoryRepository {
  final CategoryProvider apiCategory = CategoryProvider();
  Future<List<CategoryModel>> getCategories(String token) async {
    return apiCategory.getCategories(token);
  }
}
