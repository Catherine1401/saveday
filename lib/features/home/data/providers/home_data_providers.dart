import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saveday/features/home/data/datasources/home_remote_data_source.dart';
import 'package:saveday/features/home/data/repositories/home_repository_impl.dart';
import 'package:saveday/features/home/domain/repositories/home_repository.dart';

final homeRemoteDataSourceProvider = Provider<HomeRemoteDataSource>((ref) {
  return HomeRemoteDataSource();
});

final homeRepositoryProvider = Provider<HomeRepository>((ref) {
  final dataSource = ref.watch(homeRemoteDataSourceProvider);

  return HomeRepositoryImpl(dataSource);
});
