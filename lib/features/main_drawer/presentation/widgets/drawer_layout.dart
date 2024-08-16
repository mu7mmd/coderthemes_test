import 'package:flutter/material.dart';

import '../../../../core/constants/app_dimensions.dart';

class DrawerLayout extends StatelessWidget {
  const DrawerLayout({
    super.key,
    this.width = 240,
    required this.logo,
    required this.children,
  });

  final double width;
  final Widget logo;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      shadowColor: Colors.black,
      shape: InputBorder.none,
      width: width,
      child: Column(
        children: [
          Container(
            height: AppDimensions.appBarSize,
            color: Colors.white,
            alignment: Alignment.center,
            child: logo,
          ),
          Expanded(
            child: ListView(
              children: children,
            ),
          )
        ],
      ),
    );
  }
}
