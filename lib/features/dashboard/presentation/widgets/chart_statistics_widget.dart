import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/constants/text_styles.dart';

class ChartStatisticsWidget extends StatelessWidget {
  const ChartStatisticsWidget({
    super.key,
    required this.title,
    required this.value,
    this.isUp,
  });

  final String title;
  final String value;
  final bool? isUp;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Column(
          children: [
            Wrap(
              children: [
                const Icon(Icons.circle_outlined, size: 14),
                Text(
                  ' $title',
                  style: TextStyles.smallRegular,
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
            const SizedBox(height: AppDimensions.padding16),
            Wrap(
              children: [
                Text(
                  '$value ',
                  style: TextStyles.headline3Bold,
                  overflow: TextOverflow.ellipsis,
                ),
                if (isUp != null)
                  if (isUp!)
                    const Icon(
                      Icons.arrow_upward_rounded,
                      color: AppColors.secondary,
                    )
                  else
                    const Icon(Icons.arrow_downward_rounded, color: Colors.red)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
