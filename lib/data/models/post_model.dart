import 'package:saveday/features/home/domain/entities/content_type.dart';
import 'package:saveday/features/home/domain/entities/post.dart';

class PostModel extends Post {
  PostModel({
    required super.id,
    required super.imageUrl,
    required super.content,
    required super.type,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'] ?? '',
      imageUrl: json['imageUrl'] ?? 'https://picsum.photos/400/300',
      content: json['content'] ?? 'default content',
      type: json['type'] ?? ContentType.document,
    );
  }
}
