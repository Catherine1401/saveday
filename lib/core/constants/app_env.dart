class AppEnv {
  static String enviroment = const String.fromEnvironment('ENV', defaultValue: 'local');
  static String get API_KEY_WEB => const String.fromEnvironment('API_KEY_WEB');
  static String get APP_ID_WEB => const String.fromEnvironment('APP_ID_WEB');
  static String get MESSAGING_SENDER_ID => const String.fromEnvironment('MESSAGING_SENDER_ID');
  static String get PROJECT_ID => const String.fromEnvironment('PROJECT_ID');
  static String get AUTH_DOMAIN => const String.fromEnvironment('AUTH_DOMAIN');
  static String get STORAGE_BUCKET => const String.fromEnvironment('STORAGE_BUCKET');
  static String get API_KEY_ANDROID => const String.fromEnvironment('API_KEY_ANDROID');
  static String get APP_ID_ANDROID => const String.fromEnvironment('APP_ID_ANDROID');
  static String get API_KEY_IOS => const String.fromEnvironment('API_KEY_IOS');
  static String get APP_ID_IOS => const String.fromEnvironment('APP_ID_IOS');
  static String get IOS_BUNDLE_ID => const String.fromEnvironment('IOS_BUNDLE_ID');
  static String get API_KEY_MACOS => const String.fromEnvironment('API_KEY_MACOS');
  static String get APP_ID_MACOS => const String.fromEnvironment('APP_ID_MACOS');
  static String get API_KEY_WINDOWS => const String.fromEnvironment('API_KEY_WINDOWS');
  static String get APP_ID_WINDOWS => const String.fromEnvironment('APP_ID_WINDOWS');
}
