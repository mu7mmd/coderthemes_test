import 'package:flutter/material.dart';

import '../constants/key_enums.dart';

extension BoxConstraintExtension on BoxConstraints {
  ScreenType get screenType {
    if (maxWidth < ScreenType.smallMobile.breakPoint!) {
      return ScreenType.smallMobile;
    } else if (maxWidth < ScreenType.largeMobile.breakPoint!) {
      return ScreenType.largeMobile;
    } else if (maxWidth < ScreenType.smallTablet.breakPoint!) {
      return ScreenType.smallTablet;
    } else if (maxWidth < ScreenType.largeTablet.breakPoint!) {
      return ScreenType.largeTablet;
    } else if (maxWidth < ScreenType.smallDesktop.breakPoint!) {
      return ScreenType.smallDesktop;
    } else {
      return ScreenType.largeDesktop;
    }
  }
}
