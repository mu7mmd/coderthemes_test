import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/constants/text_styles.dart';
import '../../../../core/extensions/box_constraint_extension.dart';
import '../../../../core/constants/key_enums.dart';
import '../../../../core/providers/screen_type_provider.dart';
import '../../../dashboard/presentation/views/dashboard_view.dart';
import '../../../main_app_bar/presentation/views/main_app_bar.dart';
import '../../../main_drawer/data/drawer_items.dart';
import '../../../main_drawer/presentation/controllers/providers/selected_menu_item_provider.dart';
import '../../../main_drawer/presentation/widgets/collapsed_drawer_hover.dart';
import '../../../main_drawer/presentation/widgets/expanded_drawer.dart';
import '../../../main_drawer/presentation/widgets/responsive_drawer.dart';

class MainLayout extends ConsumerWidget {
  const MainLayout({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LayoutBuilder(
      builder: (_, constraints) {
        _changeScreenType(ref, constraints.screenType);
        return const _MainBody();
      },
    );
  }

  void _changeScreenType(
    WidgetRef ref,
    ScreenType screenType,
  ) {
    final type = ref.read(screenTypeProvider);
    if (type != screenType) {
      // Must be future to not update when rebuilding

      Future.delayed(Duration.zero, () {
        ref.read(screenTypeProvider.notifier).state = screenType;
      });
    }
  }
}

class _MainBody extends StatelessWidget {
  const _MainBody();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const ExpandedDrawer(),
      body: Stack(
        alignment: AlignmentDirectional.centerStart,
        children: [
          Row(
            children: [
              const ResponsiveDrawer(),
              Expanded(
                child: Column(
                  children: [
                    const MainAppBar(),
                    Expanded(
                      child: Consumer(
                        builder: (_, ref, __) {
                          final index = ref.watch(selectedMenuItemProvider);
                          if (index == 0) {
                            return const DashboardView();
                          } else {
                            return Center(
                              child: Text(
                                // Default first cause we using only on section
                                // if having more the selected page index method 
                                // will change
                                drawerItems.first.items[index].title,
                                style: TextStyles.headline3Bold,
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          const CollapsedDrawerHover()
        ],
      ),
    );
  }
}
