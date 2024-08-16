import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/text_styles.dart';
import '../../../../core/widgets/hover_widget.dart';
import '../../domain/models/chart_point_model.dart';
import 'chart_point_info_card.dart';

class ChartPointBar extends StatefulWidget {
  const ChartPointBar(this.point, {super.key});

  final ChartPointModel point;

  @override
  State<ChartPointBar> createState() => _ChartPointBarState();
}

class _ChartPointBarState extends State<ChartPointBar> {
  double _height = 0;

  late final ChartPointModel point = widget.point;

  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      setState(() {
        _height = ((AppConstants.chartHeight / 50) * point.sales) + 25;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: SizedBox(
          width: 24,
          child: HoverWidget(
            cursor: SystemMouseCursors.precise,
            builder: (_, isHovered) {
              return Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  AnimatedContainer(
                    height: _height,
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    duration: const Duration(milliseconds: 600),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.secondary),
                      color: isHovered
                          ? Colors.cyanAccent.withOpacity(.3)
                          : AppColors.secondary.withOpacity(.5),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: _height - 20,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: AppColors.secondary,
                        border: Border.all(color: Colors.white),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(2)),
                      ),
                      child: Center(
                        child: Text(
                          '${point.sales}',
                          style: TextStyles.smallBold
                              .copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 200),
                    transitionBuilder: (child, animation) =>
                        FadeTransition(opacity: animation, child: child),
                    child: isHovered
                        ? ChartPointInfoCard(point)
                        : const SizedBox.shrink(),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
