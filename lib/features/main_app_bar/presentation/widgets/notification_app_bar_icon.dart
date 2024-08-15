import 'package:flutter/material.dart';

import '../../../../core/extensions/context_extension.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/constants/text_styles.dart';
import '../../../../core/widgets/custom_inkwell.dart';
import '../../domain/models/day_notifications_model.dart';
import '../../domain/models/notification_model.dart';
import 'day_notifications_widget.dart';
import 'hover_popup_menu_icon.dart';

class NotificationAppBarIcon extends StatelessWidget {
  const NotificationAppBarIcon({super.key});

  static const _notifications = [
    DayNotificationsModel(
      day: 'Today',
      notifications: [
        NotificationModel(
          icon: Icons.chat_outlined,
          color: AppColors.primary,
          title: 'Datacrop',
          subtitle: 'Notification description will be here',
          time: '1 min ago',
        ),
        NotificationModel(
          icon: Icons.person_add_alt_outlined,
          color: Colors.blue,
          title: 'Admin',
          subtitle: 'Notification description will be here',
          time: '1 hr ago',
        ),
      ],
    ),
    DayNotificationsModel(
      day: 'Yesterday',
      notifications: [
        NotificationModel(
          icon: Icons.person_rounded,
          color: Colors.grey,
          title: 'Cristina Angel',
          subtitle: 'Notification description will be here',
          time: '1 day ago',
        ),
      ],
    ),
    DayNotificationsModel(
      day: '31 Jan 2023',
      notifications: [],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return HoverPopupMenuIcon(
      menuWidth: 300,
      childBuilder: (color) => Badge(
        smallSize: 8,
        largeSize: 8,
        backgroundColor: Colors.red,
        child: Icon(
          Icons.notifications_rounded,
          color: color,
        ),
      ),
      items: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.padding10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Notifications',
                style: TextStyles.largeBold,
              ),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: context.pop,
                  child: Text(
                    'Clear All',
                    style: TextStyles.smallRegular.copyWith(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Divider(color: Colors.grey.withOpacity(.3)),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (_, index) =>
              DayNotificationsWidget(_notifications[index]),
          separatorBuilder: (_, __) =>
              const SizedBox(height: AppDimensions.padding8),
          itemCount: _notifications.length,
        ),
        Divider(color: Colors.grey.withOpacity(.2), height: 0),
        CustomInkwell(
          onTap: context.pop,
          child: Center(
            child: Text(
              'View All',
              style: TextStyles.smallBold.copyWith(
                color: AppColors.primary,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        )
      ],
    );
  }
}
