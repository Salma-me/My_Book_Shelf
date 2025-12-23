import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:my_book_shelf/Features/home/data/repos/home_repo_impl.dart';
import 'package:my_book_shelf/core/utils/api_service.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(getIt.get<ApiService>()));
}
