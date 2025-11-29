import 'package:saveday/features/home/data/datasources/home_remote_data_source.dart';
import 'package:saveday/features/home/domain/entities/post.dart';
import 'package:saveday/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource remoteDataSource;

  HomeRepositoryImpl(this.remoteDataSource);

  @override
  Future<Post> getPost(String id) async {
    final allPosts = await remoteDataSource.getRemotePosts();

    return allPosts.firstWhere((post) => post.id == id);
  }

  @override
  Future<List<Post>> getPosts() async {
    return await remoteDataSource.getRemotePosts();
  }


}
