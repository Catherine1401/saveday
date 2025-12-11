import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saveday/core/network/firestore.dart';
import 'package:saveday/features/home/data/datasource/post_datasource.dart';
import 'package:saveday/features/home/data/datasource/post_local_dts.dart';
import 'package:saveday/features/home/data/models/post_model.dart';
import 'package:saveday/features/home/domain/entities/post.dart';

final postFirestoreDataSourceProvider = Provider<PostFirestoreDataSource>((
  ref,
) {
  // final hmm = PostFirestoreDataSource(ref.read(databaseFireStoreProvider));
  // hmm.putPosts(kMockPosts);
  // return hmm;
  return PostFirestoreDataSource(ref.read(databaseFireStoreProvider));
});

class PostFirestoreDataSource implements PostDataSource {
  final FirebaseFirestore _db;

  PostFirestoreDataSource(this._db);

  @override
  Future<List<Post>> fetchPosts() async {
    try {
      final querySnapshot = await _db.collection('posts').get();
      final posts = querySnapshot.docs.map((doc) {
        final postData = doc.data();
        print('remote');
        return PostModel.fromJson(postData).toPost();
      }).toList();
      return posts;
    } catch (e) {
      print('local');
      return kMockPosts;
    }
  }

  @override
  Future<void> putPost(Post post) {
    // TODO: implement putPost
    throw UnimplementedError();
  }

  @override
  Future<void> putPosts(List<Post> posts) async {
    for (final post in posts) {
      await _db.collection('posts').add(post.toMap()).then((doc) {
        print('${doc.id}');
      });
    }
  }
}
