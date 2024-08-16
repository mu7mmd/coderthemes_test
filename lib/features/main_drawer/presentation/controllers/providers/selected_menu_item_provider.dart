import 'package:hooks_riverpod/hooks_riverpod.dart' show StateProvider;

final selectedMenuItemProvider = StateProvider<int>((ref) => 0);