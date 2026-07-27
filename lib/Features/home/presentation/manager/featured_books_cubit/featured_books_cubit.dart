import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_book_shelf/Features/home/domain/entities/book_entity.dart';

import '../../../domain/use_cases/fetch_featured_books_use_case.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.featuredBooksUseCase) : super(FeaturedBooksInitial());
  final FetchFeaturedBooksUseCase featuredBooksUseCase;

  Future<void> fetchFeaturedBooks() async {
    emit(FeaturedBooksLoading());
    var result = await featuredBooksUseCase.call();
    result.fold(
      (failure) {
        emit(FeaturedBooksFailure(failure.errMessage));
      },
      (books) {
        emit(FeaturedBooksSuccess(books));
      },
    );
  }
}


// class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
//   FeaturedBooksCubit(this.homeRepo) : super(FeaturedBooksInitial());
//   final HomeRepo homeRepo;

//   Future<void> fetchFeaturedBooks() async {
//     emit(FeaturedBooksLoading());
//     var result = await homeRepo.fetchFeaturedBooks();
//     result.fold(
//       (failure) {
//         emit(FeaturedBooksFailure(failure.errMessage));
//       },
//       (books) {
//         emit(FeaturedBooksSuccess(books));
//       },
//     );
//   }
// }
