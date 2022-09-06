import '../models/weekly_draw_model.dart';
import '../provider/weekly_draw_provider.dart';

class WeeklyDrawRepository {
  final WeeklyDrawProvider apiWeekly = WeeklyDrawProvider();

  Future<List<WeeklyDrawModel>> getAllWeekleDraw(String token) async {
    return apiWeekly.getAllWeeklyDraw(token);
  }

  Future<int> getWeekleDraw(String token, String id) async {
    return apiWeekly.getWeeklyDraw(token, id);
  }
}
