import 'package:coderthemes_test/core/constants/key_enums.dart';
import 'package:coderthemes_test/core/constants/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/extensions/screen_type_extension.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/widgets/hover_widget.dart';
import '../../../../core/widgets/user_tile.dart';
import '../../../../core/screen_type_builder.dart';
import '../../../../core/utils/custom_shadow.dart';
import '../../../main_drawer/presentation/controllers/notifiers/drawer_notifier.dart';
import '../widgets/hover_icon.dart';
import '../widgets/hover_popup_menu_icon.dart';
import '../widgets/language_popup_item.dart';
import '../widgets/language_tile.dart';
import '../widgets/notification_app_bar_icon.dart';
import '../widgets/search_text_field.dart';

class MainAppBar extends ConsumerWidget {
  const MainAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [CustomShadow(5)],
      ),
      child: SizedBox(
        height: AppDimensions.appBarSize,
        child: Row(
          children: [
            ScreenTypeBuilder(
              builder: (type) {
                if (type.isMobile) {
                  return Padding(
                    padding: const EdgeInsetsDirectional.only(
                      start: AppDimensions.screenPadding,
                    ),
                    child: Image.asset(
                      AppAssets.logoSmall,
                      width: 30,
                    ),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
            const SizedBox(width: AppDimensions.padding24),
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () {
                  ref
                      .read(drawerNotifierProvider.notifier)
                      .openOrClose(context);
                },
                child: const Icon(Icons.menu, size: 30),
              ),
            ),
            const SizedBox(width: AppDimensions.padding24),
            ScreenTypeBuilder(builder: (type) {
              if (type.isMiddlePoint) {
                return const SearchTextField();
              }
              return const SizedBox.shrink();
            }),
            Expanded(
              child: ScreenTypeBuilder(builder: (type) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    if (!type.isMiddlePoint) ...[
                      const HoverIcon(Icons.search_rounded),
                      const SizedBox(width: AppDimensions.padding16),
                    ],
                    HoverPopupMenuIcon(
                      childBuilder: (color) => Row(
                        children: [
                          LanguageTile(
                            name: 'English',
                            icon: AppAssets.us,
                            space: 4,
                            color: color,
                            showName: type.isMiddlePoint,
                            style: TextStyles.mediumBold,
                          ),
                          if (type != ScreenType.smallMobile)
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
                    if (type != ScreenType.smallMobile) ...[
                      const HoverIcon(Icons.category_rounded),
                      const SizedBox(width: AppDimensions.padding16),
                      const HoverIcon(Icons.settings_rounded),
                      const SizedBox(width: AppDimensions.padding16),
                      const HoverIcon(Icons.dark_mode_sharp),
                      const SizedBox(width: AppDimensions.padding16),
                    ],
                    if (!type.isMobile) ...[
                      const HoverIcon(Icons.filter_center_focus_rounded),
                      const SizedBox(width: AppDimensions.padding16),
                    ],
                    DecoratedBox(
                        decoration: BoxDecoration(
                          color: AppColors.lightGrey,
                          border: Border.symmetric(
                            vertical: BorderSide(color: Colors.grey.shade200),
                          ),
                        ),
                        child: ScreenTypeBuilder(
                          builder: (type) {
                            if (type.isMiddlePoint) {
                              return SizedBox(
                                width: 160,
                                child: HoverWidget(
                                  defaultColor: AppColors.black54,
                                  builder: (color, _) {
                                    return UserTile(
                                      avatarRadius: 17,
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                        horizontal: AppDimensions.padding8,
                                      ),
                                      foregroundColor: color,
                                    );
                                  },
                                ),
                              );
                            } else {
                              return const SizedBox(
                                height: double.infinity,
                                width: 55,
                                child: Center(
                                  child: MouseRegion(
                                    cursor: SystemMouseCursors.click,
                                    child: CircleAvatar(
                                      radius: 17,
                                      backgroundImage:
                                          AssetImage(AppAssets.avatar),
                                    ),
                                  ),
                                ),
                              );
                            }
                          },
                        )),
                  ],
                );
              }),
            ),
            const SizedBox(width: AppDimensions.screenPadding),
          ],
        ),
      ),
    );
  }
}
