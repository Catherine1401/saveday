import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saveday/core/theme/app_colors.dart';
import 'package:saveday/features/home/domain/entities/content_type.dart';
import 'package:saveday/features/home/presentation/screens/filter_screen.dart';

final filterProvider = NotifierProvider<FilterNotifier, Set<ContentType>>(() {
  return FilterNotifier();
});

class FilterNotifier extends Notifier<Set<ContentType>> {
  @override
  Set<ContentType> build() {
    return {};
  }

  void setFilters(Set<ContentType> types) {
    state = types;
  }

  Future<void> showBlurredModel(BuildContext context) {
    return showGeneralDialog(
      barrierDismissible: true,
      barrierLabel: 'hello wolrd',
      context: context,
      barrierColor: AppColors.black900.withOpacity(.7),
      pageBuilder: (context, _, _) {
        return Align(alignment: Alignment.bottomCenter, child: FilterScreen());
      },
      transitionBuilder: (context, _, _, child) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
          child: child,
        );
      },
    );
  }
}
