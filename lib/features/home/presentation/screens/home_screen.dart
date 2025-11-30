import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saveday/core/constants/app_icons.dart';
import 'package:saveday/core/theme/app_colors.dart';
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
            SliverToBoxAdapter(child: Divider()),
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
      leading: const Icon(AppIcons.bookmark, color: AppColors.black500),
      actions: [const Icon(AppIcons.user, color: AppColors.grey500)],
      actionsPadding: const EdgeInsetsGeometry.only(right: 15),
    );
  }

  Widget _buildFilter() {
    return Positioned(
      bottom: 10,
      right: 10,
      child: IconButton.outlined(
        onPressed: () {},
        icon: const Icon(AppIcons.filter),
        style: IconButton.styleFrom(
          side: BorderSide(color: AppColors.grey400, width: 1.5),
        ),
      ),
    );
  }
}
