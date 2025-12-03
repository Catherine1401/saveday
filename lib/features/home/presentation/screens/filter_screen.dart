import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saveday/core/constants/app_icons.dart';
import 'package:saveday/core/theme/app_colors.dart';
import 'package:saveday/features/home/domain/entities/content_type.dart';
import 'package:saveday/features/home/presentation/providers/filter_controller.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class FilterScreen extends ConsumerStatefulWidget {
  const FilterScreen({super.key});

  @override
  ConsumerState<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends ConsumerState<FilterScreen> {
  late final Set<ContentType> filters;

  @override
  void initState() {
    super.initState();
    final filterController = ref.read(filterProvider);
    filters = Set.from(filterController);
  }

  void toggle(ContentType type) {
    setState(() {
      if (filters.contains(type)) {
        filters.remove(type);
      } else {
        filters.add(type);
      }
    });
  }

  void save() {
    ref.read(filterProvider.notifier).setFilters(filters);
    Navigator.pop(context);
  }

  void cancel() {
    Navigator.pop(context);
  }

  void clear() {
    setState(() {
      filters.clear();
    });
  }

  void selectAll() {
    setState(() {
      filters.addAll(ContentType.values);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white800,
        border: Border.all(color: AppColors.black900.withOpacity(.2)),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 12),
            blurRadius: 20,
            spreadRadius: -10,
            color: AppColors.black900.withOpacity(.1),
          ),
          BoxShadow(
            offset: Offset(0, 10),
            blurRadius: 4,
            spreadRadius: -10,
            color: AppColors.black900.withOpacity(.2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // header
          _buildHeader(context, ref),
          // body
          _buildBody(context, ref),
          const SizedBox(height: 8),
          // action
          _buildAction(context, ref),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context, WidgetRef ref) {
    final String header = 'Filter';
    final String action = filters.isEmpty ? 'Select all' : 'Clear all';
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      decoration: BoxDecoration(
        border: BoxBorder.fromLTRB(
          bottom: BorderSide(
            width: .5,
            color: AppColors.black900.withOpacity(.2),
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(header, style: ShadTheme.of(context).textTheme.h2),
          ShadButton.ghost(
            padding: const EdgeInsets.only(right: 3),
            onTapDown: (_) {
              if (filters.isEmpty) {
                selectAll();
              } else {
              clear();
              }
            }
            ,
            child: Text(action, style: ShadTheme.of(context).textTheme.h3),
          ),
        ],
      ),
    );
  }

  Widget _buildBody(BuildContext context, WidgetRef ref) {
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
        icon: AppIcons.video,
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

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Column(
        children: filterItems.map((item) {
          final isSelected = filters.contains(item.type);

          return GestureDetector(
            onTapDown: (_) => toggle(item.type),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                children: [
                  _buildFilterIcon(item.icon, item.color),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      item.label,
                      style: ShadTheme.of(
                        context,
                      ).textTheme.h3.copyWith(fontSize: 14),
                    ),
                  ),
                  ShadCheckbox(
                    value: isSelected,
                    color: AppColors.black800,
                    decoration: ShadDecoration(
                      border: ShadBorder.all(
                        width: 1,
                        color: AppColors.black900.withValues(alpha: .3),
                      ),
                    ),
                    size: 20,
                    duration: Duration(milliseconds: 300),
                    onChanged: (_) => toggle(item.type),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildFilterIcon(String icon, Color color) {
    return SvgPicture.asset(icon, width: 24, height: 24);
  }

  Widget _buildAction(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          // left
          Expanded(
            child: ShadButton.outline(
              height: 40,
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              decoration: ShadDecoration(
                color: AppColors.white700,
                border: ShadBorder.all(
                  width: 1,
                  color: AppColors.black600.withOpacity(0.2),
                ),
              ),
              child: Text(
                'Cancel',
                style: ShadTheme.of(context).textTheme.h3.copyWith(
                  fontSize: 16,
                  letterSpacing: -.35,
                  height: 24 / 16,
                ),
              ),
              onTapDown: (_) => cancel(),
            ),
          ),
          const SizedBox(width: 8),
          // right
          Expanded(
            child: ShadButton(
              height: 40,
              backgroundColor: AppColors.yellow500,
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              decoration: ShadDecoration(
                border: ShadBorder(radius: BorderRadius.circular(8)),
              ),
              onTapDown: (_) => save(),
              child: Text(
                'Apply',
                style: ShadTheme.of(context).textTheme.h3.copyWith(
                  fontSize: 16,
                  height: 24 / 16,
                  letterSpacing: -.35,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
