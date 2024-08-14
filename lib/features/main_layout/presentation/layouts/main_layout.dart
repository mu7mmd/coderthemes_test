import 'package:flutter/material.dart';

import '../../../main_app_bar/presentation/widgets/main_app_bar.dart';
import '../../../main_drawer/presentation/widgets/main_drawer.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MainDrawer(),
      body: Row(
        children: [
          MainDrawer(),
          Expanded(
            child: Column(
              children: [
                MainAppBar(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
