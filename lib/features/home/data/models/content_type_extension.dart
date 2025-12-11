import 'package:saveday/features/home/domain/entities/content_type.dart';

extension ContentTypeExtension on ContentType {
   ContentType fromString(String type) {
    return ContentType.values.firstWhere(
      (e) => e.name.toLowerCase() == type.toLowerCase(),
      orElse: () => ContentType.article,
    );
  }
}
