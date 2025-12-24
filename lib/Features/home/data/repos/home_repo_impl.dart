import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:my_book_shelf/Features/home/data/models/book_model/book_model.dart';
import 'package:my_book_shelf/Features/home/data/repos/home_repo.dart';
import 'package:my_book_shelf/core/errors/failures.dart';
import 'package:my_book_shelf/core/utils/api_service.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;
  HomeRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<BookModel>>> fetchNewestBooks() async {
    try {
      var data = await apiService.get(
        endPoint: 'volumes?q=subject:Computer&sorting=newest',
        // 'volumes?q=subject:Programming&filter=free-ebooks&sorting=newest',
      );
      List<BookModel> books = [];
      if (data['totalItems'] == 0) {
        return left(ServerFailure(errMessage: 'No Books Available'));
      }
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() async {
    try {
      var data = await apiService.get(
        endPoint: 'volumes?q=subject:Programming',
        // 'volumes?q=subject:Programming&filter=free-ebooks',
      );
      if (data['totalItems'] == 0) {
        return left(ServerFailure(errMessage: 'No Books Available'));
      }
      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item as Map<String, dynamic>));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
