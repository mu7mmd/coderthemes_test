import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/extensions/screen_type_extension.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/providers/screen_type_provider.dart';
import '../../../../core/widgets/user_tile.dart';
import '../controllers/notifiers/drawer_notifier.dart';
import '../../data/drawer_items.dart';
import 'drawer_layout.dart';
import 'menu_section_widget.dart';

class ExpandedDrawer extends ConsumerWidget {
  const ExpandedDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isMobile = ref.read(screenTypeProvider).isMobile;
    return DrawerLayout(
      logo: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimensions.padding16,
        ),
        child: Row(
          mainAxisAlignment: isMobile
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.center,
          children: [
            Image.asset(AppAssets.logo, height: 30),
            if (isMobile)
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    ref
                        .read(drawerNotifierProvider.notifier)
                        .closeMobileDrawer(context);
                  },
                  child: const Icon(Icons.close, size: 20),
                ),
              )
          ],
        ),
      ),
      children: [
        const DecoratedBox(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppAssets.triangles),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: AppDimensions.padding16,
            ),
            child: UserTile(
              selected: true,
              trailing: Icon(Icons.arrow_right),
            ),
          ),
        ),
        const SizedBox(height: AppDimensions.padding24),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.padding16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
              drawerItems.length,
              (index) => MenuSectionWidget(drawerItems[index]),
            ),
          ),
        )
      ],
    );
  }
}
