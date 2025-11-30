import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saveday/features/home/domain/entities/content_type.dart';

final filterProvider = NotifierProvider<FilterNotifier, Set<ContentType>>(() {
  return FilterNotifier();
});

class FilterNotifier extends Notifier<Set<ContentType>> {
  @override
  Set<ContentType> build() {
    return {};
  }

  // toggle, if have then remove and else
  void toggle(ContentType type) {
    if (state.contains(type)) {
      state = {...state}..remove(type);
    } else {
      state = {...state}..add(type);
    }
  }

  // select all
  void selectAll() {
    state = ContentType.values.toSet();
  }

  // clear all
  void clearAll() {
    state = {};
  }
}


