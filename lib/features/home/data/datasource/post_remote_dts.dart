import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saveday/core/network/dio.dart';
import 'package:saveday/features/home/data/datasource/post_datasource.dart';
import 'package:saveday/features/home/data/datasource/post_local_dts.dart';
import 'package:saveday/features/home/data/models/post_model.dart';
import 'package:saveday/features/home/domain/entities/post.dart';

final postRemoteDatasourceProcvider = Provider<PostRemoteDataSource>((ref) {
  return PostRemoteDataSource(ref.read(dioProvier));
});

class PostRemoteDataSource implements PostDataSource {
  final Dio _dio;

  PostRemoteDataSource(this._dio);

  @override
  Future<List<Post>> fetchPosts() async {
    final baseUrl = 'https://saveday-backend-my0krve-catherine1401.globeapp.dev';
    final response = await _dio.get('$baseUrl/api/posts');

    if (response.statusCode == 200) {
      final List<dynamic> rawList = response.data;
      return rawList
          .map((element) => PostModel.fromJson(element).toPost())
          .toList();
    }
    return kMockPosts;
  }

  @override
  Future<void> putPost(Post post) {
    // TODO: implement putPost
    throw UnimplementedError();
  }

  @override
  Future<void> putPosts(List<Post> posts) {
    // TODO: implement putPosts
    throw UnimplementedError();
  }
}
