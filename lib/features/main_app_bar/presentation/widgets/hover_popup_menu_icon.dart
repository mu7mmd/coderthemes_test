import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';

class HoverPopupMenuIcon extends StatefulWidget {
  const HoverPopupMenuIcon(this.icon, {super.key, required this.popupMenu});

  final IconData icon;
  final Widget popupMenu;

  @override
  State<HoverPopupMenuIcon> createState() => _HoverPopupMenuIconState();
}

class _HoverPopupMenuIconState extends State<HoverPopupMenuIcon> {
  Color _color = AppColors.content;

  bool _isOpen = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        if (!_isOpen) _setHover();
      },
      onExit: (_) {
        if (!_isOpen) _setUnHover();
      },
      child: Theme(
        data: Theme.of(context).copyWith(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
        ),
        child: PopupMenuButton(
          color: Colors.white,
          itemBuilder: (_) => [PopupMenuItem(child: widget.popupMenu)],
          onSelected: (_) {},
          onOpened: () => _isOpen = true,
          onCanceled: () {
            _setUnHover();
            _isOpen = false;
          },
          tooltip: '',
          offset: const Offset(0, 49),
          child: Icon(
            widget.icon,
            color: _color,
          ),
        ),
      ),
    );
  }

  void _setHover() => _setColor(AppColors.primary);

  void _setUnHover() => _setColor(AppColors.content);

  void _setColor(Color color) {
    setState(() => _color = color);
  }
}
