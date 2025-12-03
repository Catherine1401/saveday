import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saveday/core/constants/app_icons.dart';
import 'package:saveday/core/theme/app_colors.dart';
import 'package:saveday/features/home/presentation/providers/filter_controller.dart';
import 'package:saveday/features/home/presentation/widgets/masonry_widget.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
        _buildFilter(context, ref),
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
              AppColors.black900.withValues(alpha: .5),
              BlendMode.srcIn,
            ),
          ),
        ),
      ],
      actionsPadding: const EdgeInsetsGeometry.only(right: 15),
    );
  }

  Widget _buildFilter(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(filterProvider);
    final filterCount = filter.length;
    return Positioned(
      bottom: 9,
      right: 9,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          ShadButton.outline(
            backgroundColor: AppColors.white800,
            decoration: ShadDecoration(
              shape: BoxShape.circle,
              shadows: [
                BoxShadow(
                  offset: Offset(0, 14),
                  blurRadius: 20,
                  spreadRadius: -10,
                  color: AppColors.black900.withOpacity(.15),
                ),
                BoxShadow(
                  color: AppColors.black900.withOpacity(.2),
                  offset: Offset(0, 4),
                  blurRadius: 2,
                  spreadRadius: -3,
                ),
              ],
              border: ShadBorder.all(
                width: 1,
                color: AppColors.black900.withOpacity(.4),
              ),
            ),
            child: SvgPicture.asset(AppIcons.filter, width: 28, height: 28),
            onPressed: () async => await ref
                .read(filterProvider.notifier)
                .showBlurredModel(context),
          ),
          if (filterCount > 0)
            Positioned(
              top: -4,
              right: 8,
              child: Container(
                width: 20,
                height: 20,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.black600,
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.white800.withOpacity(.3)),
                ),
                child: Text(
                  '$filterCount',
                  style: ShadTheme.of(context).textTheme.h4.copyWith(
                    color: AppColors.white800,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
