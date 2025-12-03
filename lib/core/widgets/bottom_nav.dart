import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:saveday/core/constants/app_icons.dart';
import 'package:saveday/core/theme/app_colors.dart';
import 'package:saveday/core/widgets/screen_management.dart';

class BottomNav extends ConsumerWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(bottomNavProvider);
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(width: .5, color: AppColors.black900.withOpacity(.1)),
        ),
      ),
      child: NavigationBar(
        height: 56,
        backgroundColor: AppColors.white800.withOpacity(.9),
        selectedIndex: currentIndex,
        indicatorColor: Colors.transparent,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        onDestinationSelected: (int index) {
          ref.read(bottomNavProvider.notifier).changeTab(index);
        },
        destinations: [
          _buildNavigationDestination(AppIcons.home, 'home'),
          _buildNavigationDestination(AppIcons.collection, 'collection'),
          _buildNavigationDestination(AppIcons.magic, 'magic'),
          _buildNavigationDestination(AppIcons.search, 'search'),
          _buildNavigationDestination(AppIcons.plus, 'plus'),
        ],
      ),
    );
  }

  Widget _buildNavigationDestination(String icon, String label) {
    return NavigationDestination(
      icon: SvgPicture.asset(
        icon,
        colorFilter: ColorFilter.mode(
          AppColors.black900.withOpacity(0.5),
          BlendMode.srcIn,
        ),
      ),
      selectedIcon: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: AppColors.black900.withOpacity(0.05),
          borderRadius: BorderRadius.circular(6),
        ),
        child: SvgPicture.asset(
          icon,
          colorFilter: ColorFilter.mode(
            AppColors.black900.withOpacity(0.8),
            BlendMode.srcIn,
          ),
        ),
      ),
      label: label,
    );
  }
}
