import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/extensions/screen_type_extension.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/constants/text_styles.dart';
import '../../../../core/providers/screen_type_provider.dart';
import '../../../../core/utils/custom_shadow.dart';
import '../../../../core/widgets/hover_widget.dart';
import '../controllers/notifiers/drawer_notifier.dart';
import '../controllers/providers/selected_menu_item_provider.dart';
import '../../data/drawer_items.dart';

class CollapsedDrawerHover extends ConsumerWidget {
  const CollapsedDrawerHover({super.key});

  static const double _width = 240;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final collapsed = !ref.watch(drawerNotifierProvider);
    final isNotMobile = !ref.watch(screenTypeProvider).isMobile;
    if (isNotMobile && collapsed) {
      return Column(
        children: [
          const SizedBox(height: AppDimensions.appBarSize),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  for (final section in drawerItems)
                    ...List.generate(section.items.length, (itemIndex) {
                      final item = section.items[itemIndex];
                      return GestureDetector(
                        onTap: () {
                          if (!item.hasChildren) {
                            _changeSelectedItem(ref, itemIndex);
                          }
                        },
                        child: HoverWidget(
                          builder: (_, isHovered) {
                            if (isHovered) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Container(
                                    height: 44,
                                    width: _width,
                                    color:
                                        const Color.fromARGB(255, 23, 23, 28),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: AppDimensions.padding24,
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(
                                          item.icon,
                                          size: 20,
                                          color: Colors.white,
                                        ),
                                        const SizedBox(
                                            width: AppDimensions.padding24),
                                        Expanded(
                                          child: Text(
                                            item.title,
                                            style:
                                                TextStyles.mediumBold.copyWith(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        if (item.hasChildren)
                                          const Icon(
                                            Icons.keyboard_arrow_down_rounded,
                                            color: Colors.white,
                                            size: 20,
                                          )
                                        else
                                          item.trailing
                                      ],
                                    ),
                                  ),
                                  if (item.hasChildren)
                                    Container(
                                      width: _width - AppDimensions.appBarSize,
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: AppDimensions.padding8,
                                      ),
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: [CustomShadow()],
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: List.generate(
                                            item.children!.length,
                                            (childIndex) => _MenuItemChild(
                                                  itemIndex,
                                                  childIndex,
                                                  item.children![childIndex],
                                                )),
                                      ),
                                    )
                                ],
                              );
                            }
                            return const SizedBox(
                              height: 44,
                              width: AppDimensions.appBarSize,
                            );
                          },
                        ),
                      );
                    })
                ],
              ),
            ),
          )
        ],
      );
    }
    return const SizedBox.shrink();
  }

  void _changeSelectedItem(WidgetRef ref, int item, [int? child]) {
    ref.read(selectedMenuItemProvider.notifier).state =
        (item: item, child: child);
  }
}

class _MenuItemChild extends ConsumerWidget {
  const _MenuItemChild(this.itemIndex, this.childIndex, this.child);

  final int itemIndex;
  final int childIndex;
  final String child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: AppDimensions.padding8,
      ),
      child: GestureDetector(
        onTap: () {
          ref.read(selectedMenuItemProvider.notifier).state =
              (item: itemIndex, child: childIndex);
        },
        child: HoverWidget(
          builder: (color, _) {
            return Consumer(builder: (_, WidgetRef ref, __) {
              final index = ref.watch(selectedMenuItemProvider).child;
              return Text(
                child,
                style: TextStyles.mediumRegular.copyWith(
                  color: index != childIndex ? color : AppColors.primary,
                ),
              );
            });
          },
        ),
      ),
    );
  }
}
