import 'package:flutter/material.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/widgets/hover_widget.dart';
import '../../../../core/widgets/user_tile.dart';
import 'hover_icon.dart';
import 'hover_popup_menu_icon.dart';
import 'language_popup_item.dart';
import 'language_tile.dart';
import 'notification_app_bar_icon.dart';
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
            blurRadius: 3,
            offset: const Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: SizedBox(
        height: AppDimensions.appBarHeight,
        child: Row(
          children: [
            const SizedBox(width: AppDimensions.padding24),
            GestureDetector(
              onTap: () {},
              child: const Icon(Icons.menu),
            ),
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
                    childBuilder: (color) => Row(
                      children: [
                        LanguageTile(
                          name: 'English',
                          icon: AppAssets.us,
                          space: 4,
                          color: color,
                        ),
                        Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: color,
                          size: 16,
                        ),
                      ],
                    ),
                    items: const [
                      LanguagePopupItem(AppAssets.italy, 'Italy'),
                      LanguagePopupItem(AppAssets.germany, 'Germany'),
                    ],
                  ),
                  const SizedBox(width: AppDimensions.padding16),
                  const NotificationAppBarIcon(),
                  const SizedBox(width: AppDimensions.padding16),
                  const HoverIcon(Icons.category_rounded),
                  const SizedBox(width: AppDimensions.padding16),
                  const HoverIcon(Icons.settings_rounded),
                  const SizedBox(width: AppDimensions.padding16),
                  const HoverIcon(Icons.dark_mode_sharp),
                  const SizedBox(width: AppDimensions.padding16),
                  const HoverIcon(Icons.filter_center_focus_rounded),
                  const SizedBox(width: AppDimensions.padding16),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: AppColors.lightGrey,
                      border: Border.symmetric(
                        vertical: BorderSide(color: Colors.grey.shade200),
                      ),
                    ),
                    child: SizedBox(
                      width: 160,
                      child: HoverWidget(builder: (color, _) {
                        return UserTile(
                          avatarRadius: 17,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: AppDimensions.padding8,
                          ),
                          foregroundColor: color,
                        );
                      }),
                    ),
                  ),
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
