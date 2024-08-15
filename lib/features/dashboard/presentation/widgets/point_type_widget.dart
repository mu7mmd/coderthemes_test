import 'package:flutter/material.dart';

import '../../../../core/constants/text_styles.dart';

class PointTypeWidget extends StatelessWidget {
  const PointTypeWidget({
    super.key,
    required this.color,
    required this.type,
    this.style = TextStyles.smallBold,
  });

  final Color color;
  final String type;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.circle, size: style.fontSize, color: color),
        Text(' $type', style: style)
      ],
    );
  }
}
