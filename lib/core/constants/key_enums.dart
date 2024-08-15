enum ScreenSizeType {
  mobile(600),
  smallTablet(800),
  largeTablet(1000),
  desktop(null);

  const ScreenSizeType(this.breakPoint);

  final double? breakPoint;
}
