import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/constants/text_styles.dart';
import '../../../../core/widgets/hover_widget.dart';
import '../../domain/models/section_item_model.dart';
import '../controllers/providers/menu_item_expanded_provider.dart';
import '../controllers/providers/selected_menu_item_provider.dart';

class SectionItemTile extends ConsumerWidget {
  const SectionItemTile(this.index, this.item, {super.key});

  final int index;
  final SectionItemModel item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndexes = ref.watch(selectedMenuItemProvider);
    final expandedIndex = ref.watch(menuItemExpandedProvider);
    final isExpanded = expandedIndex == index;
    final isSelected = selectedIndexes.item == index || isExpanded;
    final hasChildren = item.hasChildren;
    return GestureDetector(
      onTap: () {
        if (hasChildren) {
          if (isExpanded) {
            _changeExpandedMenuItem(ref, null);
          } else {
            _changeExpandedMenuItem(ref, index);
          }
        } else {
          _changeSelectedMenuItem(ref, index);
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: AppDimensions.padding8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HoverWidget(
              builder: (color, _) {
                final focusColor = isSelected ? AppColors.hoverColor : color;
                return Row(
                  children: [
                    Icon(item.icon, color: focusColor, size: 20),
                    const SizedBox(width: AppDimensions.padding10),
                    Expanded(
                      child: Text(
                        item.title,
                        style: TextStyles.mediumMedium.copyWith(
                          color: focusColor,
                        ),
                      ),
                    ),
                    if (hasChildren)
                      AnimatedRotation(
                        turns: isExpanded ? 0.25 : 0,
                        duration: AppConstants.animationDuration,
                        child: Icon(
                          Icons.keyboard_arrow_right_rounded,
                          color: focusColor,
                          size: 20,
                        ),
                      )
                    else
                      item.trailing,
                  ],
                );
              },
            ),
            AnimatedSwitcher(
              duration: AppConstants.animationDuration,
              transitionBuilder: (child, animation) =>
                  SizeTransition(sizeFactor: animation, child: child),
              child: isExpanded
                  ? Padding(
                      padding: const EdgeInsetsDirectional.only(
                        start: AppDimensions.padding30,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: List.generate(
                          item.children!.length,
                          (childIndex) => Padding(
                            padding: const EdgeInsets.only(
                              top: AppDimensions.padding8,
                            ),
                            child: GestureDetector(
                              onTap: () {
                                _changeSelectedMenuItem(ref, index, childIndex);
                              },
                              child: HoverWidget(
                                builder: (color, hovered) => AnimatedPadding(
                                  padding: EdgeInsetsDirectional.only(
                                    start: hovered ? 8 : 0,
                                  ),
                                  duration: AppConstants.animationDuration,
                                  child: Text(
                                    item.children![childIndex],
                                    style: TextStyles.mediumMedium.copyWith(
                                      color: selectedIndexes.child != childIndex ? color : AppColors.hoverColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
            )
          ],
        ),
      ),
    );
  }

  void _changeExpandedMenuItem(WidgetRef ref, int? index) {
    ref.read(menuItemExpandedProvider.notifier).state = index;
  }

  void _changeSelectedMenuItem(WidgetRef ref, int item, [int? child]) {
    ref.read(selectedMenuItemProvider.notifier).state =
        (item: item, child: child);
  }
}
