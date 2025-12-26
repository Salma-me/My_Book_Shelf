import 'package:dartz/dartz.dart';
import 'package:my_book_shelf/core/errors/failures.dart';
import 'package:my_book_shelf/core/models/book_model/book_model.dart';

abstract class SearchRepo{
  Future<Either<Failure, List<BookModel>>> fetchSearchResultBooks({required String searchQuery});
}