import 'package:saveday/features/home/domain/entities/post.dart';

abstract class PostDataSource {
  Future<List<Post>> fetchPosts();
  Future<void> putPost(Post post);
  Future<void> putPosts(List<Post> posts);
}
