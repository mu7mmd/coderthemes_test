import 'package:hooks_riverpod/hooks_riverpod.dart' show StateProvider;

import '../constants/key_enums.dart';

final screenTypeProvider = StateProvider((_) => ScreenType.smallMobile);
