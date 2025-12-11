import 'package:saveday/features/home/domain/entities/content_type.dart';

class Post {
  final String id;
  final String imageUrl;
  final String content;
  final ContentType type;

  Post({
    required this.id,
    required this.imageUrl,
    required this.content,
    required this.type,
  });

  Map<String, dynamic> toMap() => {
    'id': id,
    'imageUrl': imageUrl,
    'content': content,
    'type': type.name
  };
}
