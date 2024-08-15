import 'notification_model.dart';

final class DayNotificationsModel {
  const DayNotificationsModel({required this.day, required this.notifications});

  final String day;
  final List<NotificationModel> notifications;
}
