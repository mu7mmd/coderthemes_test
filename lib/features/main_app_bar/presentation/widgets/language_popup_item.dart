import 'package:flutter/widgets.dart';

import '../../../../core/extensions/context_extension.dart';
import '../../../../core/widgets/custom_inkwell.dart';
import '../../../../core/widgets/hover_widget.dart';
import 'language_tile.dart';

class LanguagePopupItem extends StatelessWidget {
  const LanguagePopupItem(this.icon, this.name, {super.key});

  final String icon;
  final String name;

  @override
  Widget build(BuildContext context) {
    return HoverWidget(
      builder: (color, _) => CustomInkwell(
        onTap: context.pop,
        child: LanguageTile(
          name: name,
          icon: icon,
          color: color,
        ),
      ),
    );
  }
}
