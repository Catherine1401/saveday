import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';

final dioProvier = Provider<Dio>((ref) {
  return Dio();
});
