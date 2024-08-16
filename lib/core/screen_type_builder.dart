import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'constants/key_enums.dart';
import 'providers/screen_type_provider.dart';

class ScreenTypeBuilder extends ConsumerWidget {
  const ScreenTypeBuilder({super.key, required this.builder});

  final Widget Function(ScreenType) builder;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final type = ref.watch(screenTypeProvider);
    return builder(type);
  }
}
