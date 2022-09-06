import '../models/slider_model.dart';
import '../provider/slider_provider.dart';

class SliderRepository {
  final SliderProvider apiUser = SliderProvider();
  Future<List<SliderModel>> getSliders(String token) async {
    return apiUser.getSliders(token);
  }
}
