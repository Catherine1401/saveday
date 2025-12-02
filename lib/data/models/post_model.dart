import 'package:saveday/features/home/domain/entities/content_type.dart';

class PostModel {
  final String id;
  final String imageUrl;
  final String content;
  final ContentType type;

  PostModel({
    required this.id,
    required this.imageUrl,
    required this.content,
    required this.type,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'] as String,
      imageUrl: json['imageUrl'] as String,
      content: json['content'] as String,
      type: json['content_type'] as ContentType,
    );
  }
}
