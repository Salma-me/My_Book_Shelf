import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_book_shelf/Features/home/presentation/views/widgets/book_list_view_item.dart';
import 'package:my_book_shelf/Features/search/presentation/manager/search_books_cubit/search_books_cubit.dart';
import 'package:my_book_shelf/core/utils/styles.dart';
import 'package:my_book_shelf/core/widgets/custom_error_widget.dart';
import 'package:my_book_shelf/core/widgets/custom_loading_indicator.dart';
import 'package:my_book_shelf/core/widgets/custom_no_search_results_widget.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBooksCubit, SearchBooksState>(
      builder: (context, state) {
        if (state is SearchBooksInitial) {
          return Center(
            child: Text('No Results', style: Styles.textStyle20),
          );
        }

        if (state is SearchBooksLoading) {
          return const CustomLoadingIndicator();
        }

        if (state is SearchBooksFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        }

        if (state is SearchBooksSuccess) {
          if (state.searchBooks.isEmpty) {
            return const CustomNoSearchResultsWidget();
          }

          return ListView.builder(
            itemCount: state.searchBooks.length,
            itemBuilder: (context, index) =>
                BookListViewItem(book: state.searchBooks[index]),
          );
        }

        return const SizedBox(); // fallback
      },
    );
  }
}
