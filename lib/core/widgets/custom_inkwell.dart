import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_dimensions.dart';

class CustomInkwell extends StatelessWidget {
  const CustomInkwell({super.key, required this.child, required this.onTap});

  final Widget child;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      hoverColor: AppColors.hoverColor.withOpacity(0.1),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: AppDimensions.padding8,
          horizontal: AppDimensions.padding16,
        ),
        child: child,
      ),
    );
  }
}
