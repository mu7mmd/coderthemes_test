import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/key_enums.dart';
import '../../../../core/extensions/constraints_extension.dart';
import '../../../../core/providers/screen_type_provider.dart';
import '../../../../core/widgets/screen_type_builder.dart';
import '../../../main_app_bar/presentation/widgets/main_app_bar.dart';
import '../../../main_drawer/presentation/widgets/main_drawer.dart';

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

  // Must be future to not update when rebuilding
  Future<void> _changeScreenType(
    WidgetRef ref,
    ScreenSizeType screenType,
  ) async {
    final type = ref.read(screenTypeProvider);
    if (type != screenType) {
      ref.read(screenTypeProvider.notifier).state = screenType;
    }
  }
}

class _MainBody extends StatelessWidget {
  const _MainBody();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MainDrawer(),
      body: Row(
        children: [
          ScreenTypeBuilder(
            builder: (screenType) {
              return AnimatedSize(
                duration: AppConstants.animationDuration,
                child: screenType != ScreenSizeType.mobile
                    ? const MainDrawer()
                    : const SizedBox.shrink(),
              );
            },
          ),
          Expanded(
            child: Column(
              children: [
                MainAppBar(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
