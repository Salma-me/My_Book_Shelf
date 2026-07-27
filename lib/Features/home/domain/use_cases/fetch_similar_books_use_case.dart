import 'package:dartz/dartz.dart';
import 'package:my_book_shelf/Features/home/domain/entities/book_entity.dart';
import 'package:my_book_shelf/core/errors/failures.dart';
import 'package:my_book_shelf/core/use_cases/use_case.dart';

import '../repos/home_repo.dart';

class FetchSimilarBooksUseCase extends UseCase<List<BookEntity>, String> {
  final HomeRepo homeRepo;

  FetchSimilarBooksUseCase({required this.homeRepo});

  @override
  Future<Either<Failure, List<BookEntity>>> call([String category = 'Programming']) async {
    return await homeRepo.fetchSimilarBooks(category: category);
  }
}
