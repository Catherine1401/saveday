import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saveday/core/constants/app_icons.dart';
import 'package:saveday/core/theme/app_colors.dart';
import 'package:saveday/features/home/domain/entities/content_type.dart';
import 'package:saveday/features/home/presentation/providers/filter_controller.dart';
import 'package:saveday/features/home/presentation/providers/home_controller.dart';

class FilterScreen extends ConsumerWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // header
        _buildHeader(ref),
        const Divider(),
        // body
        _buildBody(ref),
        const SizedBox(height: 8),
        // action
        _buildAction(context, ref),
        const SizedBox(height: 32),
      ],
    );
  }

  Widget _buildHeader(WidgetRef ref) {
    final String header = 'Filter';
    final String action = 'Select all';
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(header),
          TextButton(
            onPressed: () {
              ref.read(filterProvider.notifier).selectAll();
            },
            child: Text(action),
          ),
        ],
      ),
    );
  }

  Widget _buildBody(WidgetRef ref) {
    final filterItems = [
      (
        icon: AppIcons.article,
        label: 'Article',
        type: ContentType.article,
        color: AppColors.yellow500,
      ),
      (
        icon: AppIcons.link,
        label: 'Webpage',
        type: ContentType.webpage,
        color: AppColors.green500,
      ),
      (
        icon: AppIcons.image,
        label: 'Image',
        type: ContentType.images,
        color: AppColors.grey400,
      ),
      (
        icon: AppIcons.play,
        label: 'Video',
        type: ContentType.video,
        color: AppColors.yellow500,
      ),
      (
        icon: AppIcons.audio,
        label: 'Audio',
        type: ContentType.audio,
        color: AppColors.pink500,
      ),
      (
        icon: AppIcons.document,
        label: 'Document',
        type: ContentType.document,
        color: AppColors.blue500,
      ),
    ];

    final selectedFilter = ref.watch(filterProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: filterItems.map((item) {
          final isSelected = selectedFilter.contains(item.type);

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              children: [
                _buildFilterIcon(item.icon, item.color),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    item.label,
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
                Checkbox(
                  value: isSelected,
                  onChanged: (_) =>
                      ref.read(filterProvider.notifier).toggle(item.type),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildFilterIcon(IconData icon, Color color) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.all(6),
        color: color,
        child: Icon(icon, size: 20),
      ),
    );
  }

  Widget _buildAction(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          // left
          Expanded(
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
          ),
          const SizedBox(width: 8),
          // right
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.yellow500,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                final filtersToApply = ref.read(filterProvider);
                ref
                    .read(homeControllerProvider.notifier)
                    .filterByTypes(filtersToApply);
                Navigator.pop(context);
              },
              child: const Text('Apply'),
            ),
          ),
        ],
      ),
    );
  }
}
