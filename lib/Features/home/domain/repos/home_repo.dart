import 'package:dartz/dartz.dart';
import 'package:my_book_shelf/Features/home/domain/entities/book_entity.dart';
import 'package:my_book_shelf/core/errors/failures.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks();
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks();
  Future<Either<Failure, List<BookEntity>>> fetchSimilarBooks({required String category});
}
