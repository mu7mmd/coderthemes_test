import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/constants/key_enums.dart';
import '../../../../core/constants/text_styles.dart';
import '../../../../core/screen_type_builder.dart';

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
        child: ScreenTypeBuilder(builder: (type) {
          final TextStyle titleStyle;
          final TextStyle valueStyle;
          if (type != ScreenType.smallMobile) {
            titleStyle = TextStyles.headline3Bold;
            valueStyle = TextStyles.smallRegular;
          } else {
            titleStyle = TextStyles.largeBold;
            valueStyle = TextStyles.xxSmallRegular;
          }
          return Column(
            children: [
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                alignment: WrapAlignment.center,
                children: [
                  Icon(Icons.circle_outlined, size: valueStyle.fontSize),
                  Text(
                    ' $title',
                    style: valueStyle,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
              const SizedBox(height: AppDimensions.padding16),
              Wrap(
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Text(
                    '$value ',
                    style: titleStyle,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (isUp != null)
                    if (isUp!)
                      Icon(
                        Icons.arrow_upward_rounded,
                        color: AppColors.secondary,
                        size: titleStyle.fontSize,
                      )
                    else
                      Icon(
                        Icons.arrow_downward_rounded,
                        color: Colors.red,
                        size: titleStyle.fontSize,
                      )
                ],
              )
            ],
          );
        }),
      ),
    );
  }
}
