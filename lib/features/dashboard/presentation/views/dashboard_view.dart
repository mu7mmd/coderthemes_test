import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/constants/text_styles.dart';
import '../models/statistic_model.dart';
import '../widgets/sales_and_revenue_card.dart';
import '../widgets/statistics_card.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  static List<StatisticModel> statisticsCards = const [
    StatisticModel(
      title: 'CUSTOMERS',
      value: '54,214',
      icon: Icons.person_outline_rounded,
      color: AppColors.secondary,
      different: '2,541',
      isUp: true,
      since: 'Since last month',
    ),
    StatisticModel(
      title: 'ORDERS',
      value: '54,214',
      icon: Icons.shopping_basket_outlined,
      color: Colors.blue,
      different: '2,51%',
      isUp: false,
      since: 'Since last month',
    ),
    StatisticModel(
      title: 'REVENUE',
      value: '54,214',
      icon: Icons.monetization_on_outlined,
      color: Colors.red,
      different: '7.00%',
      isUp: false,
      since: 'Since last month',
    ),
    StatisticModel(
      title: 'GROWTH',
      value: '+ 20.6%',
      icon: Icons.circle_outlined,
      color: AppColors.primary,
      different: '4.87%',
      isUp: true,
      since: 'Since last month',
    ),
    StatisticModel(
      title: 'CONVERSATION',
      value: '54,214',
      icon: Icons.monitor_heart_outlined,
      color: Colors.orange,
      different: '2,541',
      isUp: false,
      since: 'Since last month',
    ),
    StatisticModel(
      title: 'BALANCE',
      value: '\$154.5K',
      icon: Icons.account_balance_wallet_outlined,
      color: Colors.blueGrey,
      different: '2,51%',
      isUp: true,
      since: 'Since last month',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppDimensions.screenPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const MouseRegion(
                cursor: SystemMouseCursors.text,
                child: Text(
                  'Dashboard',
                  style: TextStyles.xLargeBold,
                ),
              ),
              const Row(
                children: [],
              )
            ],
          ),
          const SizedBox(height: AppDimensions.padding16),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 500,
              mainAxisExtent: 170,
            ),
            itemCount: statisticsCards.length,
            itemBuilder: (_, index) => StatisticsCard(statisticsCards[index]),
          ),
          const SalesAndRevenueCard(),

        ],
      ),
    );
  }
}
