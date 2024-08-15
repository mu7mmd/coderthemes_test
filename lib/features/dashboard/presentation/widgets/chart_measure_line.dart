import 'package:flutter/material.dart';

import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/constants/text_styles.dart';
import '../models/sales_data.dart';

class ChartMeasureLine extends StatelessWidget {
  const ChartMeasureLine(this.data, {super.key});

  final SalesData data;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('${data.netRevenue}', style: TextStyles.smallRegular),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppDimensions.padding16,
            ),
            child: Divider(color: Colors.grey.withOpacity(.1)),
          ),
        ),
        Text('${data.salesNumber}', style: TextStyles.smallRegular),
      ],
    );
  }
}
