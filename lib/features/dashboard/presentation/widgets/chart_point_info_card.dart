import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/constants/text_styles.dart';
import '../../domain/models/chart_point_model.dart';
import 'point_type_widget.dart';

class ChartPointInfoCard extends StatelessWidget {
  const ChartPointInfoCard(this.point, {super.key});

  final ChartPointModel point;

  @override
  Widget build(BuildContext context) {
    return OverflowBox(
      maxWidth: 120,
      child: DecoratedBox(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(4),
                ),
                border: Border(
                  top: BorderSide(
                    color: Colors.grey.shade300,
                  ),
                  left: BorderSide(
                    color: Colors.grey.shade300,
                  ),
                  right: BorderSide(
                    color: Colors.grey.shade300,
                  ),
                ),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: AppDimensions.padding8,
                vertical: AppDimensions.padding4,
              ),
              child: Text(
                point.date,
                style: TextStyles.smallBold,
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(
                AppDimensions.padding8,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(4),
                ),
                border: Border.all(
                  color: Colors.grey.shade300,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PointTypeWidget(
                    color: AppColors.primary,
                    type: 'Revenue: ${point.revenue}',
                    style: TextStyles.smallBold,
                  ),
                  const SizedBox(
                    height: AppDimensions.padding8,
                  ),
                  PointTypeWidget(
                    color: AppColors.secondary,
                    type: 'Sales: ${point.sales}',
                    style: TextStyles.smallBold,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
