import 'package:flutter/widgets.dart' show IconData, SizedBox, Widget;

final class SectionItemModel {
  const SectionItemModel({
    required this.icon,
    required this.title,
    this.children,
    this.trailing = const SizedBox.shrink(),
  });

  final IconData icon;
  final String title;
  final List<String>? children;
  final Widget trailing;

  bool get hasChildren => children != null;
}
