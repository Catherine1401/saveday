import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saveday/data/local/post_local_repository.dart';
import 'package:saveday/data/remote/post_repository_firebase.dart';
import 'package:saveday/features/home/domain/entities/content_type.dart';
import 'package:saveday/features/home/domain/entities/post.dart';

final postLocalRepositoryProvider = Provider<PostLocalRepoImpl>((ref) {
  return PostLocalRepoImpl();
});

final postRepositoryFirebaseProvider = Provider<PostRepoFirebaseIml>((ref) {
  final postProivider = PostRepoFirebaseIml();
  // postProivider.addPosts(kMockPosts);
  return postProivider;
});

abstract class PostRepository {
  Future<Post> getPost(String id);
  Future<List<Post>> getPosts();
  Future<List<Post>> getPostsBytypes(Set<ContentType> types);
}
