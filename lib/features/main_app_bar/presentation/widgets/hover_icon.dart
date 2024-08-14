import 'package:flutter/widgets.dart';

import '../../../../core/widgets/hover_widget.dart';

class HoverIcon extends StatelessWidget {
  const HoverIcon(this.icon, {super.key, this.onTap});

  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: HoverWidget(
        builder: (color, _) => Icon(
          icon,
          color: color,
        ),
      ),
    );
  }
}
