enum ContentType {
  article,
  webpage,
  images,
  video,
  audio,
  document;

  static ContentType fromString(String type) {
    return ContentType.values.firstWhere(
      (item) => item.name.toLowerCase() == type.toLowerCase(),
      orElse: () => ContentType.article,
    );
  }
}
