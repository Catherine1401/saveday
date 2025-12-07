import 'package:flutter/material.dart';
import 'package:saveday/features/home/domain/entities/content_type.dart';
import 'package:saveday/features/home/domain/entities/post.dart';

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
    return switch (json) {
      {
        'id': String id,
        'imageUrl': String imageUrl,
        'content': String content,
        'type': ContentType type,
      } =>
        PostModel(id: id, imageUrl: imageUrl, content: content, type: type),
      _ => throw Exception('fail to convert'),
    };
  }

  static Post postFromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'id': String id,
        'imageUrl': String imageUrl,
        'content': String content,
        'type': ContentType type,
      } =>
        Post(id: id, imageUrl: imageUrl, content: content, type: type),
      _ => throw FormatException('can not format'),
    };
  }

  static Map<String, dynamic> postToJson(Post post) {
    return {
      'imageUrl': post.imageUrl,
      'content': post.content,
      'type': post.type.name,
    };
  }
}

