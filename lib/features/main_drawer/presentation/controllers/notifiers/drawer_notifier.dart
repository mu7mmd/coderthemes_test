import 'package:flutter/widgets.dart' show BuildContext;
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../core/extensions/screen_type_extension.dart';
import '../../../../../core/extensions/build_context_extension.dart';
import '../../../../../core/providers/screen_type_provider.dart';

final class DrawerNotifier extends StateNotifier<bool> {
  DrawerNotifier(this._ref, super.state);

  final Ref _ref;

  void openOrClose(BuildContext context) {
    final screenType = _ref.read(screenTypeProvider);
    if (screenType.isMobile) {
      if (context.isDrawerOpen) {
        closeMobileDrawer(context);
      } else {
        context.openDrawer();
        state = true;
      }
    } else {
      state = !state;
    }
  }

  void expandDrawer() {
    if (!state) state = true;
  }

  void collapseDrawer() {
    if (state) state = false;
  }

  void closeMobileDrawer(BuildContext context) {
    context.closeDrawer();
    state = false;
  }
}

final drawerNotifierProvider =
    StateNotifierProvider<DrawerNotifier, bool>((ref) {
  final isDesktop = ref.read(screenTypeProvider).isDesktop;
  return DrawerNotifier(ref, isDesktop);
});
