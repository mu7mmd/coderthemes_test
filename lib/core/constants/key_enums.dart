enum ScreenType {
  smallMobile(575),
  largeMobile(765),
  smallTablet(995),
  largeTablet(1140),
  smallDesktop(1402),
  largeDesktop(null);

  const ScreenType(this.breakPoint);

  final double? breakPoint;
}
