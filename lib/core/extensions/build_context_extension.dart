import 'package:flutter/material.dart' show BuildContext, Scaffold;

extension BuildContextExtension on BuildContext {
  bool get isDrawerOpen => Scaffold.of(this).isDrawerOpen;

  void openDrawer() => Scaffold.of(this).openDrawer();

  void closeDrawer() => Scaffold.of(this).closeDrawer();
}
