import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectDataSourceProvider = NotifierProvider<SelectDataNotifier, int>(() {
  return SelectDataNotifier();
});

class SelectDataNotifier extends Notifier<int> {
  @override
  int build() {
    return 0;
  }

  void changeDataSource(int index) {
    state = index;
  }
}
