import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:saveday/data/local/post_local_repository.dart';
import 'package:saveday/data/models/content_type_extension.dart';
import 'package:saveday/data/models/post_model.dart';
import 'package:saveday/data/repositories/post_repository.dart';
import 'package:saveday/features/home/domain/entities/content_type.dart';
import 'package:saveday/features/home/domain/entities/post.dart';

class PostRepoFirebaseIml implements PostRepository {
  @override
  Future<Post> getPost(String id) {
    // TODO: implement getPost
    throw UnimplementedError();
  }

  @override
  Future<List<Post>> getPosts() async {
    final db = FirebaseFirestore.instance;
    try {
      final querySnapshot = await db.collection('posts').get();
      final posts = querySnapshot.docs.map((doc) {
        final (String image, String content, ContentType type) = switch (doc
            .data()) {
          {
            'imageUrl': String image,
            'content': String content,
            'type': String type,
          } =>
            (image, content, ContentType.article.fromString(type)),
          _ => throw FormatException('format fail'),
        };
        return Post(id: doc.id, imageUrl: image, content: content, type: type);
      }).toList();
      return posts;
    } catch (e) {
      return kMockPosts;
    }
  }

  @override
  Future<List<Post>> getPostsBytypes(Set<ContentType> types) async {
    final posts = await getPosts();
    return posts.where((post) => types.contains(post.type)).toList();
  }

  Future<void> addPosts(List<Post> posts) async {
    final db = FirebaseFirestore.instance;
    for (final post in posts) {
      await db.collection('posts').add(PostModel.postToJson(post)).then((doc) {
        print('id ${doc.id}');
      });
    }
  }
}
