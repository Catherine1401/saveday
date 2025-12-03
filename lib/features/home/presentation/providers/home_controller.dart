import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saveday/data/repositories/post_repository.dart';
import 'package:saveday/features/home/domain/entities/content_type.dart';
import 'package:saveday/features/home/domain/entities/post.dart';
import 'package:saveday/features/home/presentation/providers/filter_controller.dart';

final homeControllerProvider = AsyncNotifierProvider<PostNotifier, List<Post>>(
  () {
    return PostNotifier();
  },
);

class PostNotifier extends AsyncNotifier<List<Post>> {
  @override
  Future<List<Post>> build() async {
    final repository = ref.read(postLocalRepositoryProvider);
    final filterTypes = ref.watch(filterProvider);
    return filterTypes.isEmpty
        ? repository.getPosts()
        : repository.getPostsBytypes(filterTypes);
  }

  Future<void> filterByTypes(Set<ContentType> types) async {
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      final repository = ref.read(postLocalRepositoryProvider);

      if (types.isEmpty) {
        return repository.getPosts();
      }

      return repository.getPostsBytypes(types);
    });
  }
}
