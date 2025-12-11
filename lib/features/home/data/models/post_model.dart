import 'package:saveday/features/home/domain/entities/content_type.dart';
import 'package:saveday/features/home/domain/entities/post.dart';

class PostModel {
  final String id;
  final String imageUrl;
  final String content;
  final String type;

  PostModel({
    required this.id,
    required this.imageUrl,
    required this.content,
    required this.type,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'id': String id,
        'imageUrl': String imageUrl,
        'content': String content,
        'type': String type,
      } =>
        PostModel(id: id, imageUrl: imageUrl, content: content, type: type),
      _ => PostModel(id: '0', imageUrl: '', content: 'error', type: 'article'),
    };
  }

  Post toPost() => Post(
    id: id,
    imageUrl: imageUrl,
    content: content,
    type: ContentType.fromString(type),
  );
}
