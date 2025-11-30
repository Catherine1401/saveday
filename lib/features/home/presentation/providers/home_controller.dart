import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saveday/features/home/data/providers/home_data_providers.dart';
import 'package:saveday/features/home/domain/entities/post.dart';

final homeControllerProvider = AsyncNotifierProvider<PostNotifier, List<Post>>(() {
  return PostNotifier();
});

class PostNotifier extends AsyncNotifier<List<Post>> {
  @override
  Future<List<Post>> build() async {
    final repository = ref.read(homeRepositoryProvider);
    return repository.getPosts();
  }
}
