import 'package:flutter/material.dart';

import '../../../../core/extensions/context_extension.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/constants/text_styles.dart';
import '../../../../core/widgets/hover_widget.dart';
import '../../domain/models/day_notifications_model.dart';

class DayNotificationsWidget extends StatelessWidget {
  const DayNotificationsWidget(this.dayNotifications, {super.key});

  final DayNotificationsModel dayNotifications;

  @override
  Widget build(BuildContext context) {
    final notifications = dayNotifications.notifications;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.padding10,
          ),
          child: Text(dayNotifications.day, style: TextStyles.smallBold),
        ),
        const SizedBox(height: AppDimensions.padding10),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (_, index) {
            final notification = notifications[index];
            return HoverWidget(
              builder: (color, _) => ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: AppDimensions.padding10,
                ),
                hoverColor: Colors.grey.withOpacity(0.1),
                onTap: context.pop,
                dense: true,
                leading: CircleAvatar(
                  radius: 18,
                  backgroundColor: notification.color,
                  child: Icon(notification.icon, color: Colors.white, size: 16),
                ),
                title: Text(
                  notification.title,
                  style: TextStyles.mediumBold.copyWith(color: color),
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: Text(
                  notification.subtitle,
                  style: TextStyles.smallRegular,
                  overflow: TextOverflow.ellipsis,
                ),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(notification.time),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (_, __) =>
              const SizedBox(height: AppDimensions.padding4),
          itemCount: notifications.length,
        ),
      ],
    );
  }
}
