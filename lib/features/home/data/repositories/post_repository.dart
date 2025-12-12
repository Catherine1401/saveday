import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saveday/features/home/data/datasource/post_datasource.dart';
import 'package:saveday/features/home/data/datasource/post_firestore_dts.dart';
import 'package:saveday/features/home/data/datasource/post_local_dts.dart';
import 'package:saveday/features/home/data/datasource/post_remote_dts.dart';
import 'package:saveday/features/home/domain/entities/content_type.dart';
import 'package:saveday/features/home/domain/entities/post.dart';
import 'package:saveday/features/home/domain/repository/post_repository.dart';
import 'package:saveday/features/home/presentation/providers/select_data_provider.dart';

final postRepositoryProvider = Provider<PostRepositoryImpl>(
  isAutoDispose: true,
  (ref) {
    final option = ref.watch(selectDataSourceProvider);

    print('hello wolrd');
    return switch (option) {
      1 => PostRepositoryImpl(ref.read(postRemoteDatasourceProcvider)),
      2 => PostRepositoryImpl(ref.read(postFirestoreDataSourceProvider)),
      _ => PostRepositoryImpl(ref.read(postLocalDataSourceProvider)),
    };
  },
);

class PostRepositoryImpl implements PostRepository {
  final PostDataSource _dataSource;
  List<Post> _posts = [];

  PostRepositoryImpl(this._dataSource);

  @override
  Future<Post> getPost(String id) {
    // TODO: implement getPost
    throw UnimplementedError();
  }

  @override
  Future<List<Post>> getPosts() async {
    if (_posts.isEmpty) {
      _posts = await _dataSource.fetchPosts();
    }
    return _posts;
  }

  @override
  Future<List<Post>> getPostsBytypes(Set<ContentType> types) async {
    final posts = await getPosts();
    return posts.where((post) => types.contains(post.type)).toList();
  }
}
