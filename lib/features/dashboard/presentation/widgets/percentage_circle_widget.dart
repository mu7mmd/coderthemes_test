import 'dart:math' show pi;

import 'package:flutter/widgets.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/text_styles.dart';

class PercentageCircleWidget extends StatelessWidget {
  const PercentageCircleWidget({
    super.key,
    required this.percentage,
    required this.label,
    this.duration = const Duration(seconds: 1),
  });

  final double percentage;
  final String label;
  final Duration duration;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        TweenAnimationBuilder<double>(
          tween: Tween<double>(begin: 0, end: percentage),
          duration: duration,
          builder: (context, value, child) {
            return CustomPaint(
              size: const Size(200, 200),
              painter: _ArcPainter(value),
            );
          },
        ),
        Positioned(
          bottom: 0,
          child: Column(
            children: [
              TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: 0, end: percentage),
                duration: duration,
                builder: (context, value, child) {
                  return Text(
                    '${value.toInt()}%',
                    style: TextStyles.headline3Bold,
                  );
                },
              ),
              Text(
                label,
                style: TextStyles.smallBold.copyWith(
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ArcPainter extends CustomPainter {
  const _ArcPainter(this.percentage);

  final double percentage;

  @override
  void paint(Canvas canvas, Size size) {
    const double startAngle = -pi * 1.25;
    const double fullSweepAngle = pi * 1.5;
    final double sweepAngle = (fullSweepAngle * percentage) / 100;
    const double segmentAngle = pi / 100;

    Paint backgroundPaint = Paint()
      ..color = AppColors.lightGrey
      ..style = PaintingStyle.stroke
      ..strokeWidth = 40;

    Paint foregroundPaint = Paint()
      ..color = AppColors.primary
      ..style = PaintingStyle.stroke
      ..strokeWidth = 40;

    canvas.drawArc(
      Rect.fromCircle(
        center: size.center(Offset.zero),
        radius: size.width / 2,
      ),
      startAngle,
      fullSweepAngle,
      false,
      backgroundPaint,
    );

    for (double angle = startAngle;
        angle < startAngle + sweepAngle;
        angle += segmentAngle * 2) {
      canvas.drawArc(
        Rect.fromCircle(
          center: size.center(Offset.zero),
          radius: size.width / 2,
        ),
        angle,
        segmentAngle,
        false,
        foregroundPaint,
      );
    }
  }

  @override
  bool shouldRepaint(_) => true;
}
