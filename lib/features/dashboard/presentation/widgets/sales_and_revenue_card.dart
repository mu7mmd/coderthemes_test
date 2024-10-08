import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimensions.dart';
import 'chart_statistics_widget.dart';
import 'dashboard_section_card.dart';
import 'sales_and_revenue_chart.dart';

class SalesAndRevenueCard extends StatelessWidget {
  const SalesAndRevenueCard({super.key});

  @override
  Widget build(BuildContext context) {
    return DashboardSectionCard(
      'Revenue',
      child: Column(
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              color: AppColors.lightGrey,
              border: Border.symmetric(
                horizontal: BorderSide(color: Colors.grey.shade200),
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(
                vertical: AppDimensions.padding16,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ChartStatisticsWidget(
                    title: 'Current Week',
                    value: '\$1,705.54',
                  ),
                  ChartStatisticsWidget(
                    title: 'Previous Week',
                    value: '\$6,523.25',
                    isUp: true,
                  ),
                  ChartStatisticsWidget(
                    title: 'Conversation',
                    value: '8.27%',
                  ),
                  ChartStatisticsWidget(
                    title: 'Customers',
                    value: '69K',
                    isUp: false,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: AppDimensions.padding16),
          const SalesAndRevenueChart(),
        ],
      ),
    );
  }
}
