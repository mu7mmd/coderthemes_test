import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/constants/key_enums.dart';
import '../../../../core/constants/text_styles.dart';
import '../../../../core/screen_type_builder.dart';
import '../../domain/models/chart_point_model.dart';
import '../../domain/models/sales_data.dart';
import 'chart_measure_line.dart';
import 'chart_point_bar.dart';
import 'point_type_widget.dart';

class SalesAndRevenueChart extends StatelessWidget {
  const SalesAndRevenueChart({super.key});

  static const List<SalesData> _data = [
    SalesData(800, 50),
    SalesData(600, 40),
    SalesData(400, 20),
    SalesData(200, 10),
    SalesData(0, 0),
  ];

  static const List<ChartPointModel> _chartPoints = [
    ChartPointModel(sales: 23, revenue: 440, date: '01 Jan'),
    ChartPointModel(sales: 42, revenue: 505, date: '02 Jan'),
    ChartPointModel(sales: 35, revenue: 414, date: '03 Jan'),
    ChartPointModel(sales: 27, revenue: 671, date: '04 Jan'),
    ChartPointModel(sales: 43, revenue: 227, date: '05 Jan'),
    ChartPointModel(sales: 22, revenue: 413, date: '06 Jan'),
    ChartPointModel(sales: 17, revenue: 201, date: '07 Jan'),
    ChartPointModel(sales: 31, revenue: 352, date: '08 Jan'),
    ChartPointModel(sales: 22, revenue: 752, date: '09 Jan'),
    ChartPointModel(sales: 22, revenue: 320, date: '10 Jan'),
    ChartPointModel(sales: 12, revenue: 350, date: '11 Jan'),
    ChartPointModel(sales: 16, revenue: 246, date: '12 Jan'),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(AppDimensions.padding16),
          child: SizedBox(
            height: AppConstants.chartHeight,
            child: Row(
              children: [
                const RotatedBox(
                  quarterTurns: 3,
                  child: Text('Net Review', style: TextStyles.xSmallBold),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppDimensions.padding16,
                    ),
                    child: MouseRegion(
                      cursor: SystemMouseCursors.precise,
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: AppDimensions.padding40,
                            ),
                            child: SfSparkAreaChart(
                              color: AppColors.primary.withOpacity(0.5),
                              borderColor: AppColors.primary,
                              borderWidth: 2,
                              labelDisplayMode: SparkChartLabelDisplayMode.none,
                              trackball: SparkChartTrackball(
                                labelStyle: TextStyles.mediumRegular.copyWith(
                                  color: Colors.white,
                                ),
                                color: Colors.black12,
                                dashArray: const [3, 3],
                              ),
                              data: _chartPoints.map((p) => p.revenue).toList(),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: AppDimensions.padding20,
                            ),
                            child: Row(
                              children: [
                                for (int i = 0;
                                    i < _chartPoints.length;
                                    i++) ...[
                                  ChartPointBar(_chartPoints[i]),
                                  if (i != _chartPoints.length - 1)
                                    const Spacer()
                                ]
                              ],
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(
                              _data.length,
                              (index) => ChartMeasureLine(_data[index]),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const RotatedBox(
                  quarterTurns: 1,
                  child: Text(
                    'Number of Sales',
                    style: TextStyles.xSmallBold,
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.padding50,
          ),
          child: ScreenTypeBuilder(
            builder: (type) {
              if (type != ScreenType.smallMobile) {
                return Row(
                  children: List.generate(
                    _chartPoints.length,
                    (index) {
                      return Expanded(
                        child: Text(
                          _chartPoints[index].date,
                          style: TextStyles.xSmallRegular,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                        ),
                      );
                    },
                  ),
                );
              } else {
                return Row(
                  children: List.generate(
                    _chartPoints.length,
                    (index) {
                      if (index % 2 == 0) {
                        return Expanded(
                          child: Text(
                            _chartPoints[index].date,
                            style: TextStyles.xSmallRegular,
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                          ),
                        );
                      } else {
                        return const SizedBox.shrink();
                      }
                    },
                  ),
                );
              }
            },
          ),
        ),
        const SizedBox(height: AppDimensions.padding16),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PointTypeWidget(
              color: AppColors.primary,
              type: 'Revenue',
            ),
            SizedBox(width: AppDimensions.padding16),
            PointTypeWidget(
              color: AppColors.secondary,
              type: 'Sales',
            ),
          ],
        ),
      ],
    );
  }
}
