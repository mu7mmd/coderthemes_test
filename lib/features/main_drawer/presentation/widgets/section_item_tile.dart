import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/constants/text_styles.dart';
import '../../../../core/widgets/hover_widget.dart';
import '../controllers/providers/menu_item_expanded_provider.dart';
import '../controllers/providers/selected_menu_item_provider.dart';
import '../../domain/models/section_item_model.dart';

class SectionItemTile extends ConsumerStatefulWidget {
  const SectionItemTile(this.index, this.item, {super.key});

  final int index;
  final SectionItemModel item;

  @override
  ConsumerState<SectionItemTile> createState() => _SectionItemTileState();
}

class _SectionItemTileState extends ConsumerState<SectionItemTile> {
  final _controller = ExpansionTileController();

  late final _index = widget.index;
  late final _item = widget.item;
  late final _hasChildren = _item.hasChildren;

  @override
  Widget build(BuildContext context) {
    _listenExpandItemState();
    final selectedIndex = ref.watch(selectedMenuItemProvider);
    final expandedIndex = ref.watch(menuItemExpandedProvider);
    final isExpanded = expandedIndex == _index;
    final isSelected = selectedIndex == _index || isExpanded;
    return HoverWidget(
      builder: (color, _) {
        final focusColor = isSelected ? AppColors.hoverColor : color;
        return ExpansionTile(
          controller: _controller,
          textColor: AppColors.hoverColor,
          iconColor: AppColors.hoverColor,
          tilePadding: const EdgeInsets.all(0),
          leading: Icon(_item.icon, color: focusColor, size: 20),
          title: Text(
            _item.title,
            style: TextStyles.mediumMedium.copyWith(
              color: focusColor,
            ),
          ),
          trailing: _hasChildren
              ? AnimatedRotation(
                  turns: isExpanded ? 0.25 : 0,
                  duration: AppConstants.animationDuration,
                  child: Icon(
                    Icons.keyboard_arrow_right_rounded,
                    color: focusColor,
                    size: 20,
                  ),
                )
              : _item.trailing,
          shape: InputBorder.none,
          collapsedShape: InputBorder.none,
          visualDensity: const VisualDensity(
            vertical: VisualDensity.minimumDensity,
          ),
          onExpansionChanged: (expanded) {
            if (_hasChildren) {
              if (expanded) {
                ref.read(menuItemExpandedProvider.notifier).state = _index;
              } else {
                Future.delayed(Duration.zero, () {
                  if (isExpanded) {
                    ref.read(menuItemExpandedProvider.notifier).state = null;
                  }
                });
              }
            } else {
              ref.read(selectedMenuItemProvider.notifier).state = _index;
            }
          },
          expandedAlignment: Alignment.centerLeft,
          children: [
            if (_hasChildren)
              Padding(
                padding: const EdgeInsetsDirectional.only(
                  start: AppDimensions.padding40,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: _item.children!
                      .map(
                        (child) => Padding(
                          padding: const EdgeInsets.only(
                            bottom: AppDimensions.padding8,
                          ),
                          child: HoverWidget(
                            builder: (color, hovered) => AnimatedPadding(
                              padding: EdgeInsetsDirectional.only(
                                start: hovered ? 8 : 0,
                              ),
                              duration: AppConstants.animationDuration,
                              child: Text(
                                child,
                                style: TextStyles.mediumMedium.copyWith(
                                  color: color,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              )
          ],
        );
      },
    );
  }

  void _listenExpandItemState() {
    ref.listen(menuItemExpandedProvider, (previous, current) {
      if (current != _index && _controller.isExpanded) {
        _controller.collapse();
      }
    });
  }
}
