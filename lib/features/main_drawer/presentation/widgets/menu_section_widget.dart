import 'package:flutter/widgets.dart';

import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/constants/text_styles.dart';
import '../../domain/models/menu_section_model.dart';
import 'section_item_tile.dart';

class MenuSectionWidget extends StatelessWidget {
  const MenuSectionWidget(this.section, {super.key});

  final MenuSectionModel section;

  @override
  Widget build(BuildContext context) {
    final items = section.items;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(section.title, style: TextStyles.smallBold),
        const SizedBox(height: AppDimensions.padding8),
        ...List.generate(
          items.length,
          (index) => SectionItemTile(index, items[index]),
        )
      ],
    );
  }
}
