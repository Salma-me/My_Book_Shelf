import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:my_book_shelf/Features/home/domain/entities/book_entity.dart';
import 'package:my_book_shelf/Features/search/data/data_sources/search_remote_data_source.dart';
import 'package:my_book_shelf/Features/search/domain/repos/search_repo.dart';
import 'package:my_book_shelf/core/errors/failures.dart';

class SearchRepoImpl implements SearchRepo {
  // final ApiService apiService;
  // SearchRepoImpl(this.apiService);
  final SearchRemoteDataSource remoteDataSource;

  SearchRepoImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<BookEntity>>> fetchSearchResultBooks({
    required String searchQuery,
  }) async {
    try {
      List<BookEntity> books;
      books = await remoteDataSource.fetchSearchResultBooks(
        searchQuery: searchQuery,
      );
      if (books.isEmpty) {
        return left(ServerFailure(errMessage: 'No Books Found'));
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
