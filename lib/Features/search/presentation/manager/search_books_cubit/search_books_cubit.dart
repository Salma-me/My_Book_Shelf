import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_book_shelf/Features/search/data/repos/search_repo.dart';
import 'package:my_book_shelf/core/models/book_model/book_model.dart';

part 'search_books_state.dart';

class SearchBooksCubit extends Cubit<SearchBooksState> {
  SearchBooksCubit(this.searchRepo) : super(SearchBooksInitial());
  final SearchRepo searchRepo;

  Future<void> searchForBooks({required String query}) async {
    if (query.trim().isEmpty) {
      emit(SearchBooksInitial());
      return;
    }
    emit(SearchBooksLoading());

    final result = await searchRepo.fetchSearchResultBooks(searchQuery: query);

    result.fold(
      (failure) => emit(SearchBooksFailure(errMessage: failure.errMessage)),
      (books) => emit(SearchBooksSuccess(searchBooks: books)),
    );
  }
}
