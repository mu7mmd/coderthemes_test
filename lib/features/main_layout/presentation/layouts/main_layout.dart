import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/extensions/box_constraint_extension.dart';
import '../../../../core/constants/key_enums.dart';
import '../../../../core/providers/screen_type_provider.dart';
import '../../../dashboard/presentation/views/dashboard_view.dart';
import '../../../main_app_bar/presentation/widgets/main_app_bar.dart';
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
    return const Scaffold(
      drawer: ExpandedDrawer(),
      body: Stack(
        alignment: AlignmentDirectional.centerStart,
        children: [
          Row(
            children: [
              ResponsiveDrawer(),
              Expanded(
                child: Column(
                  children: [
                    MainAppBar(),
                    Expanded(child: DashboardView()),
                  ],
                ),
              )
            ],
          ),
          CollapsedDrawerHover()
        ],
      ),
    );
  }
}
