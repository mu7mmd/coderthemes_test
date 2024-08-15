import 'package:flutter/widgets.dart';

import '../../../../core/constants/text_styles.dart';

class LanguageTile extends StatelessWidget {
  const LanguageTile({
    super.key,
    required this.icon,
    required this.name,
    this.space = 8,
    required this.color,
  });

  final String icon;
  final String name;
  final double space;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(icon, width: 18),
        SizedBox(width: space),
        Text(name, style: TextStyles.mediumMedium.copyWith(color: color))
      ],
    );
  }
}
