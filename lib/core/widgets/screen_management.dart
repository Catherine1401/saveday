import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saveday/core/widgets/bottom_nav.dart';
import 'package:saveday/features/home/presentation/screens/home_screen.dart';

final bottomNavProvider = NotifierProvider<BottomNavNotifier, int>(() {
  return BottomNavNotifier();
});

class BottomNavNotifier extends Notifier<int> {
  @override
  int build() {
    return 0;
  }

  void changeTab(int index) {
    state = index;
  }
}

class RootScreen extends ConsumerWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(bottomNavProvider);
    final List<Widget> pages = [
      HomeScreen(),
      Center(child: Text("🔍 Đây là Tìm Kiếm", style: TextStyle(fontSize: 24))),
      Center(child: Text("👤 Đây là Cá Nhân", style: TextStyle(fontSize: 24))),
      Center(child: Text("👤 Đây là Cá Nhân", style: TextStyle(fontSize: 24))),
      Center(child: Text("👤 Đây là Cá Nhân", style: TextStyle(fontSize: 24))),
    ];
    return Scaffold(
      bottomNavigationBar: BottomNav(),
      body: IndexedStack(index: currentIndex, children: pages),
    );
  }
}
