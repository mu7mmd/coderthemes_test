import 'package:flutter/material.dart';

import '../../../../core/constants/app_dimensions.dart';
import 'city_total_sales.dart';
import 'dashboard_section_card.dart';
import 'percentage_circle_widget.dart';

class TotalSalesCard extends StatelessWidget {
  const TotalSalesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const DashboardSectionCard(
      'Total Sales',
      child: Expanded(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppDimensions.padding16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(height: AppDimensions.padding16),
              Expanded(
                flex: 3,
                child: PercentageCircleWidget(
                  percentage: 67,
                  label: 'Returning Customer',
                ),
              ),
              Spacer(),
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CityTotalSales(
                      city: 'Brooklyn, New York',
                      value: 72,
                    ),
                    CityTotalSales(
                      city: 'The Castro, San Francisco',
                      value: 39,
                    ),
                    CityTotalSales(
                      city: 'Kovan, Singapore',
                      value: 61,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
