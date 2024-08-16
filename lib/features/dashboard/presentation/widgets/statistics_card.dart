import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/constants/text_styles.dart';
import '../../../../core/widgets/highlight_card.dart';
import '../../domain/models/statistic_model.dart';

class StatisticsCard extends ConsumerStatefulWidget {
  const StatisticsCard(this.static, {super.key});

  final StatisticModel static;

  @override
  ConsumerState<StatisticsCard> createState() => _StatisticsCardState();
}

class _StatisticsCardState extends ConsumerState<StatisticsCard> {
  final _isHoveredProvider = StateProvider<bool>((ref) => false);

  late final StatisticModel _static = widget.static;
  late final bool _isUp = _static.isUp;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => ref.read(_isHoveredProvider.notifier).state = true,
      onExit: (_) => ref.read(_isHoveredProvider.notifier).state = false,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(AppDimensions.padding24),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(_static.title, style: TextStyles.mediumBold),
                    Text(_static.value, style: TextStyles.headline3Bold),
                    Row(
                      children: [
                        HighlightCard(
                          color: _isUp ? AppColors.secondary : Colors.red,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const SizedBox(width: AppDimensions.padding4),
                              Icon(
                                _isUp
                                    ? Icons.arrow_upward_rounded
                                    : Icons.arrow_downward_rounded,
                                size: 12,
                                color: Colors.white,
                              ),
                              Text(
                                ' ${_static.different}  ',
                                style: TextStyles.smallBold.copyWith(
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(width: AppDimensions.padding8),
                        Expanded(
                          child: Text(
                            _static.since,
                            style: TextStyles.mediumRegular,
                            overflow: TextOverflow.ellipsis,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Consumer(builder: (_, ref, __) {
                    final isHovered = ref.watch(_isHoveredProvider);
                    return AnimatedRotation(
                      turns: isHovered ? 0 : 0.125,
                      duration: const Duration(milliseconds: 100),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: _static.color,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                        child: const SizedBox(height: 45, width: 45),
                      ),
                    );
                  }),
                  Icon(
                    _static.icon,
                    color: Colors.white,
                    size: 30,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
