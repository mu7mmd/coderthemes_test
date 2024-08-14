import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_dimensions.dart';
import '../constants/text_styles.dart';

class HighlightTextCard extends StatelessWidget {
  const HighlightTextCard(
    this.text, {
    super.key,
    this.color = AppColors.secondary,
  });

  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(
          Radius.circular(AppDimensions.radius2),
        ),
      ),
      child: Text(
        ' $text ',
        style: TextStyles.smallBold.copyWith(color: Colors.white),
      ),
    );
  }
}
