import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:my_book_shelf/Features/home/data/data_sources/home_local_data_source.dart';
import 'package:my_book_shelf/Features/home/data/data_sources/home_remote_data_source.dart';
import 'package:my_book_shelf/Features/home/domain/entities/book_entity.dart';
import 'package:my_book_shelf/Features/home/domain/repos/home_repo.dart';
import 'package:my_book_shelf/core/errors/failures.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeLocalDataSource homeLocalDataSource;

  HomeRepoImpl({
    required this.homeRemoteDataSource,
    required this.homeLocalDataSource,
  });
  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks() async {
    try {
      List<BookEntity> booksList;
      booksList = homeLocalDataSource.fetchFeaturedBooks();
      if (booksList.isNotEmpty) {
        return right(booksList);
      }
      booksList = await homeRemoteDataSource.fetchFeaturedBooks();
      return right(booksList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks() async {
    try {
      List<BookEntity> booksList;
      booksList = homeLocalDataSource.fetchNewestBooks();
      if (booksList.isNotEmpty) {
        return right(booksList);
      }
      booksList = await homeRemoteDataSource.fetchNewestBooks();
      return right(booksList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchSimilarBooks({
    required String category,
  }) async {
    try {
      List<BookEntity> booksList;
      booksList = homeLocalDataSource.fetchSimilarBooks(category: category);
      if (booksList.isNotEmpty) {
        return right(booksList);
      }
      booksList = await homeRemoteDataSource.fetchSimilarBooks(category: category);
      return right(booksList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}

// import 'package:dartz/dartz.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:my_book_shelf/Features/home/data/repos/home_repo.dart';
// import 'package:my_book_shelf/core/errors/failures.dart';
// import 'package:my_book_shelf/core/models/book_model/book_model.dart';
// import 'package:my_book_shelf/core/utils/api_service.dart';

// class HomeRepoImpl implements HomeRepo {
//   final ApiService apiService;
//   HomeRepoImpl(this.apiService);

//   @override
//   Future<Either<Failure, List<BookModel>>> fetchNewestBooks() async {
//     try {
//       debugPrint('Fetching: newest');
//       var data = await apiService.get(
//         endPoint: 'volumes?q=subject:Computer&sorting=newest',
//         // 'volumes?q=subject:Programming&filter=free-ebooks&sorting=newest',
//       );
//       List<BookModel> books = [];
//       if (data['totalItems'] == 0) {
//         return left(ServerFailure(errMessage: 'No Books Available'));
//       }
//       for (var item in data['items']) {
//         books.add(BookModel.fromJson(item));
//       }
//       return right(books);
//     } catch (e) {
//       if (e is DioException) {
//         debugPrint('Status: ${e.response?.statusCode}');
//         debugPrint('Data: ${e.response?.data}');
//         debugPrint('Message: ${e.message}');
//         debugPrint('URI: ${e.requestOptions.uri}');
//         return left(ServerFailure.fromDioError(e));
//       }
//       return left(ServerFailure(errMessage: e.toString()));
//     }
//   }

//   @override
//   Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() async {
//     try {
//       // debugPrint('Fetching: Featured');
//       var data = await apiService.get(
//         endPoint: 'volumes?q=subject:Programming',
//         // 'volumes?q=subject:Programming&filter=free-ebooks',
//       );
//       if (data['totalItems'] == 0) {
//         return left(ServerFailure(errMessage: 'No Books Available'));
//       }
//       List<BookModel> books = [];
//       for (var item in data['items']) {
//         books.add(BookModel.fromJson(item as Map<String, dynamic>));
//       }
//       return right(books);
//     } catch (e) {
//       if (e is DioException) {
//         // debugPrint('Status: ${e.response?.statusCode}');
//         // debugPrint('Data: ${e.response?.data}');
//         // debugPrint('Message: ${e.message}');
//         // debugPrint('URI: ${e.requestOptions.uri}');
//         // rethrow;
//         return left(ServerFailure.fromDioError(e));
//       }
//       return left(ServerFailure(errMessage: e.toString()));
//     }
//   }

//   @override
//   Future<Either<Failure, List<BookModel>>> fetchSimilarBooks({
//     required String category,
//   }) async {
//     try {
//       var data = await apiService.get(
//         endPoint: 'volumes?sorting=relevance&q=subject:$category',
//         // 'volumes?q=subject:Programming&filter=free-ebooks',
//       );
//       if (data['totalItems'] == 0) {
//         return left(ServerFailure(errMessage: 'No Books Available'));
//       }
//       List<BookModel> books = [];
//       for (var item in data['items']) {
//         books.add(BookModel.fromJson(item as Map<String, dynamic>));
//       }
//       return right(books);
//     } catch (e) {
//       if (e is DioException) {
//         return left(ServerFailure.fromDioError(e));
//       }
//       return left(ServerFailure(errMessage: e.toString()));
//     }
//   }
// }
