import 'package:flutter/material.dart';
import 'package:my_book_shelf/Features/home/presentation/views/widgets/book_list_view_item.dart';
import 'package:my_book_shelf/core/models/book_model/book_model.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) =>
          const BookListViewItem(book: BookModel()),
    );
  }
}
