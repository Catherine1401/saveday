import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saveday/core/constants/app_icons.dart';
import 'package:saveday/core/theme/app_colors.dart';
import 'package:saveday/core/widgets/screen_management.dart';

class BottomNav extends ConsumerWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(bottomNavProvider);
    return NavigationBar(
      backgroundColor: AppColors.white500,
      selectedIndex: currentIndex,
      indicatorColor: AppColors.grey300,
      labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
      onDestinationSelected: (int index) {
        ref.read(bottomNavProvider.notifier).changeTab(index);
      },
      destinations: [
        const NavigationDestination(
          icon: Icon(AppIcons.home, color: AppColors.grey500),
          selectedIcon: Icon(AppIcons.home, color: AppColors.black500),
          label: 'Home',
        ),
        const NavigationDestination(
          icon: Icon(AppIcons.archive, color: AppColors.grey500),
          selectedIcon: Icon(AppIcons.archive, color: AppColors.black500),
          label: 'Home',
        ),
        const NavigationDestination(
          icon: Icon(AppIcons.ai, color: AppColors.grey500),
          selectedIcon: Icon(AppIcons.ai, color: AppColors.black500),
          label: 'Home',
        ),
        const NavigationDestination(
          icon: Icon(AppIcons.search, color: AppColors.grey500),
          selectedIcon: Icon(AppIcons.search, color: AppColors.black500),
          label: 'Home',
        ),
        const NavigationDestination(
          icon: Icon(AppIcons.plus, color: AppColors.grey500),
          selectedIcon: Icon(AppIcons.plus, color: AppColors.black500),
          label: 'Home',
        ),
      ],
    );
  }
}
