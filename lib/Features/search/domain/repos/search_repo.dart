import 'package:dartz/dartz.dart';
import 'package:my_book_shelf/Features/home/domain/entities/book_entity.dart';
import 'package:my_book_shelf/core/errors/failures.dart';

abstract class SearchRepo{
  Future<Either<Failure, List<BookEntity>>> fetchSearchResultBooks({required String searchQuery});
}