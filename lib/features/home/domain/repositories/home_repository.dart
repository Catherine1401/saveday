 import 'package:saveday/features/home/domain/entities/content_type.dart';
import 'package:saveday/features/home/domain/entities/post.dart';

abstract class HomeRepository {
   Future<Post> getPost(String id);
   Future<List<Post>> getPosts();
   Future<List<Post>> getPostsBytypes(Set<ContentType> types);
}
