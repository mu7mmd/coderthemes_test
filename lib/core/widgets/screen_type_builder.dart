import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../constants/key_enums.dart';
import '../providers/screen_type_provider.dart';

class ScreenTypeBuilder extends ConsumerWidget {
  const ScreenTypeBuilder( {super.key, required this.builder});

  final Widget Function(ScreenSizeType) builder;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenType = ref.watch(screenTypeProvider);
    return builder(screenType);
  }
}
