import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:saveday/core/constants/app_icons.dart';
import 'package:saveday/core/theme/app_colors.dart';
import 'package:saveday/features/home/presentation/screens/filter_screen.dart';
import 'package:saveday/features/home/presentation/widgets/masonry_widget.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomScrollView(
          slivers: [
            // app bar
            _buildAppBar(),
            MasonryWidget(),
            // feed
          ],
        ),
        // filter
        _buildFilter(),
      ],
    );
  }

  Widget _buildAppBar() {
    return SliverAppBar(
      shape: Border(
        bottom: BorderSide(
          width: 0.5,
          color: AppColors.black900.withOpacity(0.1),
        ),
      ),
      backgroundColor: AppColors.white800.withOpacity(0.9),
      shadowColor: AppColors.blue500,
      leading: Center(
        child: SvgPicture.asset(
          AppIcons.save,
          width: 16,
          height: 16,
          colorFilter: ColorFilter.mode(AppColors.black700, BlendMode.srcIn),
        ),
      ),
      actions: [
        Center(
          child: SvgPicture.asset(
            AppIcons.profile,
            height: 24,
            width: 24,
            colorFilter: ColorFilter.mode(
              AppColors.black900.withOpacity(.5),
              BlendMode.srcIn,
            ),
          ),
        ),
      ],
      actionsPadding: const EdgeInsetsGeometry.only(right: 15),
    );
  }

  Widget _buildFilter() {
    return Positioned(
      bottom: 10,
      right: 10,
      child: IconButton.outlined(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            builder: (context) {
              return FilterScreen();
            },
          );
        },
        icon: SvgPicture.asset(AppIcons.filter),
        style: IconButton.styleFrom(
          backgroundColor: AppColors.white500,
          side: BorderSide(color: AppColors.grey400, width: 1.5),
        ),
      ),
    );
  }
}
