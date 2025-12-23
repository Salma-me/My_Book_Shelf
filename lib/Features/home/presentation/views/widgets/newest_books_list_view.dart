import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_book_shelf/Features/home/data/models/book_model/book_model.dart';
import 'package:my_book_shelf/Features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:my_book_shelf/Features/home/presentation/views/widgets/book_list_view_item.dart';
import 'package:my_book_shelf/core/widgets/custom_error_widget.dart';
import 'package:my_book_shelf/core/widgets/custom_loading_indicator.dart';

class NewestBooksListView extends StatelessWidget {
  const NewestBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksSuccess) {
          final List<BookModel> books = state.books;
          return ListView.builder(
            padding: EdgeInsets.zero,
            physics: NeverScrollableScrollPhysics(),
            itemCount: books.length,
            itemBuilder: (context, index) =>
                BookListViewItem(book: books[index]),
          );
        } else if (state is NewestBooksFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
