import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../controllers/providers/selected_menu_item_provider.dart';
import '../../data/drawer_items.dart';
import 'drawer_layout.dart';

class CollapsedDrawer extends StatelessWidget {
  const CollapsedDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return DrawerLayout(
      width: AppDimensions.appBarSize,
      logo: Image.asset(AppAssets.logoSmall, height: 30),
      children: [
        for (final section in drawerItems)
          for (int j = 0; j < section.items.length; j++) ...[
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: AppDimensions.padding12,
              ),
              child: Consumer(
                builder: (_, WidgetRef ref, __) {
                  final item = section.items[j];
                  final selectedIndex = ref.watch(selectedMenuItemProvider);
                  return Icon(
                    item.icon,
                    size: 20,
                    color: selectedIndex == j
                        ? AppColors.primary
                        : AppColors.content,
                  );
                },
              ),
            ),
          ]
      ],
    );
  }
}
