import '../constants/key_enums.dart';

extension ScreenTypeExtension on ScreenType {
  bool get isMobile =>
      this == ScreenType.smallMobile || this == ScreenType.largeMobile;

  bool get isTablet =>
      this == ScreenType.smallTablet || this == ScreenType.largeTablet;

  bool get isDesktop =>
      this == ScreenType.smallDesktop || this == ScreenType.largeDesktop;

  bool get isMiddlePoint => isDesktop || this == ScreenType.largeTablet;
}
