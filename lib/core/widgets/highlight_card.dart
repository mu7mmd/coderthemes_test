import 'package:flutter/widgets.dart';

import '../constants/app_colors.dart';
import '../constants/app_dimensions.dart';

class HighlightCard extends StatelessWidget {
  const HighlightCard({
    super.key,
    this.color = AppColors.secondary,
    required this.child,
  });

  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(
          Radius.circular(AppDimensions.radius2),
        ),
      ),
      child: child,
    );
  }
}
