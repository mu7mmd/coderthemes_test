import 'package:flutter/material.dart';

import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/constants/text_styles.dart';

class CityTotalSales extends StatelessWidget {
  const CityTotalSales({super.key, required this.city, required this.value});

  final String city;
  final int value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(city, style: TextStyles.mediumBold),
        Row(
          children: [
            Expanded(
              child: LinearProgressIndicator(
                value: double.parse('0.$value'),
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                minHeight: 5,
              ),
            ),
            const SizedBox(width: AppDimensions.padding24),
            Text('${value}k', style: TextStyles.smallBold)
          ],
        ),
      ],
    );
  }
}
