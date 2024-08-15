import 'package:flutter/widgets.dart' show Color, IconData;

final class NotificationModel {
  const NotificationModel({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.time,
    required this.color,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final String time;
  final Color color;
}
