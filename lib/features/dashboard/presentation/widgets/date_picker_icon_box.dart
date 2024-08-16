import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';

class DatePickerIconBox extends StatelessWidget {
  const DatePickerIconBox({
    super.key,
    required this.icon,
    required this.borderRadius,
  });

  final IconData icon;
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: borderRadius,
      ),
      child: SizedBox(
        height: 40,
        width: 45,
        child: Icon(
          icon,
          color: Colors.white,
          size: 16,
        ),
      ),
    );
  }
}
