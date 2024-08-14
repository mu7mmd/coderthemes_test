import 'package:flutter/material.dart';

import '../constants/app_assets.dart';

class UserTile extends StatelessWidget {
  const UserTile({super.key, this.selected = false, this.trailing});

  final bool selected;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: ListTile(
        onTap: () {},
        selected: true,
        selectedColor: Colors.white,
        leading: const CircleAvatar(
          backgroundImage: AssetImage(AppAssets.avatar),
        ),
        title: const Text('Doris Larson'),
        subtitle: const Text('Founder'),
        trailing: trailing,
      ),
    );
  }
}
