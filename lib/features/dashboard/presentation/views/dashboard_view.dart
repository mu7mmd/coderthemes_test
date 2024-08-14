import 'package:flutter/material.dart';

import '../widgets/statistics_card.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StatisticsCard()

      ],
    );
  }
}
