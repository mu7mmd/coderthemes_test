import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/text_styles.dart';
import 'highlight_card.dart';

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
    return HighlightCard(
      color: color,
      child: Text(
        ' $text ',
        style: TextStyles.smallBold.copyWith(color: Colors.white),
      ),
    );
  }
}
