import 'package:dartz/dartz.dart';
import 'package:my_book_shelf/core/errors/failures.dart';

abstract class UseCase<T, Param> {
  Future<Either<Failure, T>> call([Param param]);
}

class NoParam {}
