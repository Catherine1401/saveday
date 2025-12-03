import 'package:flutter/material.dart';
import 'package:saveday/core/theme/app_theme.dart';
import 'package:saveday/core/widgets/screen_management.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ShadApp.custom(
      theme: AppTheme.lightTheme,
      appBuilder: (context) {
        return MaterialApp(
          theme: Theme.of(context),
          debugShowCheckedModeBanner: false,
          home: RootScreen(),
        );
      },
    );
  }
}
