 import 'package:saveday/features/home/domain/entities/post.dart';

abstract class HomeRepository {
   Future<Post> getPost(String id);
   Future<List<Post>> getPosts();
}
