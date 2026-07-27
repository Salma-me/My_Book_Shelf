import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_book_shelf/Features/home/domain/entities/book_entity.dart';
import 'package:my_book_shelf/Features/home/domain/use_cases/fetch_similar_books_use_case.dart';

part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.similarBooksUseCase,)
    : super(SimilarBooksInitial());
  final FetchSimilarBooksUseCase similarBooksUseCase;

  Future<void> fetchSimilarBooks({required String category}) async {
    emit(SimilarBooksLoading());
    var result = await similarBooksUseCase.call(category);
    result.fold(
      (failure) {
        emit(SimilarBooksFailure(failure.errMessage));
      },
      (books) {
        emit(SimilarBooksSuccess(books));
      },
    );
  }
}
