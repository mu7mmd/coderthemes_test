import 'package:flutter/material.dart' show BoxShadow, Color, Colors, Offset;

final class CustomShadow extends BoxShadow {
  const CustomShadow([this.offsetDx = 1]);

  final double offsetDx;

  @override
  Color get color => Colors.grey.withOpacity(0.3);

  @override
  double get spreadRadius => 0.1;

  @override
  double get blurRadius => 5;

  @override
  Offset get offset => Offset(offsetDx, 1);
}
