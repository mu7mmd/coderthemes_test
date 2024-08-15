import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';

class HoverPopupMenuIcon extends StatefulWidget {
  const HoverPopupMenuIcon({
    super.key,
    this.menuWidth = 150,
    required this.childBuilder,
    required this.items,
  });

  final double menuWidth;
  final Widget Function(Color) childBuilder;
  final List<Widget> items;

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
          hoverColor: Colors.transparent,
        ),
        child: PopupMenuButton(
          color: Colors.white,
          padding: const EdgeInsets.all(0),
          constraints: BoxConstraints(maxWidth: widget.menuWidth),
          itemBuilder: (_) => [
            PopupMenuItem(
              mouseCursor: SystemMouseCursors.basic,
              padding: const EdgeInsets.all(0),
              child: SizedBox(
                width: widget.menuWidth,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: widget.items,
                ),
              ),
            ),
          ],
          onSelected: (_) {},
          onOpened: () => _isOpen = true,
          onCanceled: () {
            _setUnHover();
            _isOpen = false;
          },
          tooltip: '',
          offset: const Offset(0, 49),
          child: widget.childBuilder(_color),
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
