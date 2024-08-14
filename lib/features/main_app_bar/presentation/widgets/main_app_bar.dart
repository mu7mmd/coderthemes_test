import 'package:flutter/material.dart';

import '../../../../core/constants/app_dimensions.dart';
import 'hover_icon.dart';
import 'hover_popup_menu_icon.dart';
import 'search_text_field.dart';

class MainAppBar extends StatelessWidget {
  const MainAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(5, 1), // changes position of shadow
          ),
        ],
      ),
      child: SizedBox(
        height: AppDimensions.appBarHeight,
        child: Row(
          children: [
            const SizedBox(width: AppDimensions.padding24),
            const Icon(Icons.menu),
            const SizedBox(width: AppDimensions.padding24),
            const SizedBox(
              width: 200,
              child: SearchTextField(),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  HoverPopupMenuIcon(
                    Icons.notifications_rounded,
                    popupMenu: Column(
                      children: [
                        ListTile(title: Text('Hfi'), onTap: (){},),
                        ListTile(),
                      ],
                    ),
                  ),
                  const SizedBox(width: AppDimensions.padding16),
                  const HoverIcon(Icons.category_rounded),
                  const SizedBox(width: AppDimensions.padding16),
                  const HoverIcon(Icons.settings_rounded),
                  const SizedBox(width: AppDimensions.padding16),
                  const HoverIcon(Icons.dark_mode_sharp),
                  const SizedBox(width: AppDimensions.padding16),
                  const HoverIcon(Icons.filter_center_focus_rounded),
                ],
              ),
            ),
            const SizedBox(width: AppDimensions.screenPadding),
          ],
        ),
      ),
    );
  }
}
