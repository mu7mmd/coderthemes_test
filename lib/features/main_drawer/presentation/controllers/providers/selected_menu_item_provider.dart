import 'package:hooks_riverpod/hooks_riverpod.dart' show StateProvider;

final selectedMenuItemProvider =
    StateProvider<({int item, int? child})>((ref) => (item: 0, child: null));
