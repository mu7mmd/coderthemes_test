import 'package:flutter/material.dart';

import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/constants/text_styles.dart';

class DashboardSectionCard extends StatelessWidget {
  const DashboardSectionCard(
    this.title, {
    super.key,
    required this.child,
  });

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(AppDimensions.padding16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title, style: TextStyles.largeBold),
                const Icon(Icons.more_vert_rounded)
              ],
            ),
          ),
          const SizedBox(height: AppDimensions.padding8),
          child,
          const SizedBox(height: AppDimensions.padding16),
        ],
      ),
    );
  }
}
