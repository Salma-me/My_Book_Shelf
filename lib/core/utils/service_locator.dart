import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:my_book_shelf/Features/home/data/data_sources/home_local_data_source.dart';
import 'package:my_book_shelf/Features/home/data/repos/home_repo_impl.dart';
import 'package:my_book_shelf/Features/search/data/data_sources/search_remote_data_source.dart';
import 'package:my_book_shelf/Features/search/data/repos/search_repo_impl.dart';
import 'package:my_book_shelf/core/utils/api_service.dart';

import '../../Features/home/data/data_sources/home_remote_data_source.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<HomeLocalDataSourceImpl>(HomeLocalDataSourceImpl());
  getIt.registerSingleton<HomeRemoteDataSourceImpl>(
    HomeRemoteDataSourceImpl(apiService: getIt.get<ApiService>()),
  );
  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      homeRemoteDataSource: getIt.get<HomeRemoteDataSourceImpl>(),
      homeLocalDataSource: getIt.get<HomeLocalDataSourceImpl>(),
    ),
  );
  getIt.registerSingleton<SearchRemoteDataSourceImpl>(
    SearchRemoteDataSourceImpl(apiService: getIt.get<ApiService>()),
  );
  getIt.registerSingleton<SearchRepoImpl>(
    SearchRepoImpl(remoteDataSource: getIt.get<SearchRemoteDataSourceImpl>()),
  );
}
