import 'package:flutter/material.dart';
import 'package:saveday/core/theme/app_theme.dart';
import 'package:saveday/core/widgets/screen_management.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      home: RootScreen(),
    );
  }
}

