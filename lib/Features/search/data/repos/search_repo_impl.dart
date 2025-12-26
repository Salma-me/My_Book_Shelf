import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:my_book_shelf/Features/search/data/repos/search_repo.dart';
import 'package:my_book_shelf/core/errors/failures.dart';
import 'package:my_book_shelf/core/models/book_model/book_model.dart';
import 'package:my_book_shelf/core/utils/api_service.dart';

class SearchRepoImpl implements SearchRepo {
  final ApiService apiService;
  SearchRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<BookModel>>> fetchSearchResultBooks({
    required String searchQuery,
  }) async {
    try {
      var data = await apiService.get(
        endPoint: 'volumes?q=subject:$searchQuery',
      );
      List<BookModel> books = [];
      if (data['totalItems'] == 0) {
        return left(ServerFailure(errMessage: 'No Books Found'));
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
}
