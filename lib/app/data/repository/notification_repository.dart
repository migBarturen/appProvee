

import '../models/notification_model.dart';
import '../provider/notification_provider.dart';

class NotificationRepository {
  final NotificationProvider apiNotification = NotificationProvider();
  Future<List<NotificationModel>> getNotifications(String token) async {
    return apiNotification.getNotifications(token);
  }
}
