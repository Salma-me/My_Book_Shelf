import 'package:flutter/material.dart';
import 'package:my_book_shelf/Features/home/presentation/views/widgets/book_list_view_item.dart';

class NewestBooksListView extends StatelessWidget {
  const NewestBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 5,
      itemBuilder: (context, index) => const BookListViewItem(),
    );
  }
}
