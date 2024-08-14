import 'package:flutter/widgets.dart';

import '../constants/app_colors.dart';

class HoverWidget extends StatefulWidget {
  const HoverWidget({
    super.key,
    this.hoverColor = AppColors.hoverColor,
    this.defaultColor = AppColors.content,
    required this.builder,
  });

  final Color hoverColor;
  final Color defaultColor;
  final Widget Function(Color, bool) builder;

  @override
  State<HoverWidget> createState() => _HoverWidgetState();
}

class _HoverWidgetState extends State<HoverWidget> {
  late Color _color;
  bool _hovered = false;

  @override
  void initState() {
    _color = widget.defaultColor;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() {
        _color = widget.hoverColor;
        _hovered = true;
      }),
      onExit: (_) => setState(() {
        _color = widget.defaultColor;
        _hovered = false;
      }),
      child: widget.builder(_color, _hovered),
    );
  }
}
