import 'package:dartz/dartz.dart';
import 'package:my_book_shelf/Features/home/domain/entities/book_entity.dart';
import 'package:my_book_shelf/Features/home/domain/repos/home_repo.dart';
import 'package:my_book_shelf/core/errors/failures.dart';
import 'package:my_book_shelf/core/use_cases/use_case.dart';

class FetchFeaturedBooksUseCase extends UseCase<List<BookEntity>, NoParam> {
  final HomeRepo homeRepo;

  FetchFeaturedBooksUseCase(this.homeRepo);

  @override
  Future<Either<Failure, List<BookEntity>>> call([NoParam? param]) async {
    return await homeRepo.fetchFeaturedBooks();
  }
}