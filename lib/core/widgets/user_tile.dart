import 'package:flutter/material.dart';

import '../constants/app_assets.dart';
import '../constants/text_styles.dart';

class UserTile extends StatelessWidget {
  const UserTile({
    super.key,
    this.avatarRadius = 20,
    this.contentPadding,
    this.selected = false,
    this.trailing,
    this.foregroundColor = Colors.white,
  });

  final double avatarRadius;
  final EdgeInsetsGeometry? contentPadding;
  final bool selected;
  final Widget? trailing;
  final Color foregroundColor;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: ListTile(
        contentPadding: contentPadding,
        onTap: () {},
        selected: true,
        selectedColor: foregroundColor,
        leading:  CircleAvatar(
          radius: avatarRadius,
          backgroundImage: const AssetImage(AppAssets.avatar),
        ),
        title: const Text('Doris Larson', style: TextStyles.mediumBold),
        subtitle: const Text('Founder'),
        trailing: trailing,
      ),
    );
  }
}
