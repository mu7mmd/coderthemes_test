import 'package:flutter/material.dart'
    show BuildContext, MediaQuery, Navigator, Scaffold;

extension ContextExtension on BuildContext {
  double get height => MediaQuery.of(this).size.height;

  double get width => MediaQuery.of(this).size.width;

  void openDrawer() => Scaffold.of(this).openDrawer();

  void closeDrawer() => Scaffold.of(this).closeDrawer();

  void pop() => Navigator.of(this).pop();
}
