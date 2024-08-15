import 'package:flutter/rendering.dart' show BoxConstraints;

import '../constants/key_enums.dart';

extension ConstraintsExtension on BoxConstraints {
  ScreenSizeType get screenType {
    if (maxWidth < ScreenSizeType.mobile.breakPoint!) {
      return ScreenSizeType.mobile;
    } else if (maxWidth < ScreenSizeType.smallTablet.breakPoint!) {
      return ScreenSizeType.smallTablet;
    } else if (maxWidth < ScreenSizeType.largeTablet.breakPoint!) {
      return ScreenSizeType.largeTablet;
    } else {
      return ScreenSizeType.desktop;
    }
  }
}
