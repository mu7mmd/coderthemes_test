import 'package:flutter/widgets.dart' show Color, IconData;

final class StatisticModel {
  const StatisticModel({
    required this.title,
    required this.value,
    required this.color,
    required this.icon,
    required this.different,
    required this.isUp,
    required this.since,
  });

  final String title;
  final String value;
  final Color color;
  final IconData icon;
  final String different;
  final bool isUp;
  final String since;
}
