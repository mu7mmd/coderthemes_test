import 'package:flutter/material.dart';

import '../../../../core/constants/app_dimensions.dart';

class DashboardCard extends StatelessWidget {
  const DashboardCard({super.key, required this.child});
  
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(0),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(AppDimensions.padding16),
        child: child ,
      ),
    );
  }
}
