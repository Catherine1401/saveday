import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:saveday/features/home/presentation/providers/home_controller.dart';
import 'package:saveday/features/home/presentation/widgets/post_widget.dart';

class MasonryWidget extends ConsumerWidget {
  const MasonryWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncPosts = ref.watch(homeControllerProvider);

    return asyncPosts.when(
      data: (posts) {
        return SliverMasonryGrid.count(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childCount: posts.length,
          itemBuilder: (_, index) {
            final post = posts[index];
            return PostWidget(imageurl: post.imageUrl, content: post.content);
          },
        );
      },
      error: (err, _) => SliverFillRemaining(child: Center(child: Text(err as String))),
      loading: () => SliverFillRemaining(child: const Center(child: CircularProgressIndicator())),
    );
  }
}
