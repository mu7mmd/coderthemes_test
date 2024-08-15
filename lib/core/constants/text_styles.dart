import 'package:flutter/rendering.dart' show FontWeight, TextStyle;

abstract final class TextStyles {
  static const TextStyle headline3Bold = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle xLargeBold = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle largeBold = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
  );
  static const TextStyle largeRegular = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle mediumRegular = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );
  static const TextStyle mediumMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle mediumBold = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle smallRegular = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );
  static const TextStyle smallBold = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle xSmallRegular = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w400,
  );
  static const TextStyle xSmallBold = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w700,
  );
}
