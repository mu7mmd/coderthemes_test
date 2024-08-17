import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/extensions/screen_type_extension.dart';
import '../../../../core/providers/screen_type_provider.dart';
import '../controllers/notifiers/drawer_notifier.dart';
import 'collapsed_drawer.dart';
import 'expanded_drawer.dart';

class ResponsiveDrawer extends ConsumerWidget {
  const ResponsiveDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _listenScreenTypeState(ref);
    final type = ref.watch(screenTypeProvider);
    final isExpanded = ref.watch(drawerNotifierProvider);
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 200),
      transitionBuilder: (child, animation) => SizeTransition(
        axis: Axis.horizontal,
        sizeFactor: animation,
        child: child,
      ),
      child: !type.isMobile
          ? isExpanded
              ? const ExpandedDrawer()
              : const CollapsedDrawer()
          : const SizedBox.shrink(),
    );
  }

  void _listenScreenTypeState(WidgetRef ref) {
    ref.listen(screenTypeProvider, (previous, current) {
      if (previous!.isDesktop && current.isTablet) {
        ref.read(drawerNotifierProvider.notifier).collapseDrawer();
      } else if (!previous.isDesktop && current.isDesktop) {
        ref.read(drawerNotifierProvider.notifier).expandDrawer();
      }
    });
  }
}
