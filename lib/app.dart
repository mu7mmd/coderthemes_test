import 'package:flutter/material.dart';

import 'config/app_theme.dart';
import 'features/main_layout/presentation/layouts/main_layout.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Coder Themes',
      theme: AppTheme.light,
      home: const MainLayout(),
    );
  }
}
