import 'package:flutter/material.dart';

import 'core/constants/app_colors.dart';
import 'features/main_layout/presentation/layouts/main_layout.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Coderthemes',
      theme: ThemeData.light().copyWith(
        primaryColor: AppColors.primary,
        scaffoldBackgroundColor: AppColors.background,
        cardTheme: ThemeData.light().cardTheme.copyWith(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(4)),
              ),
              color: Colors.white,
            ),
      ),
      home: const MainLayout(),
    );
  }
}
