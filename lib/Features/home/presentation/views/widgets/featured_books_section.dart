import 'package:flutter/material.dart';
import 'package:my_book_shelf/Features/home/data/models/book_model/book_model.dart';
import 'package:my_book_shelf/Features/home/presentation/views/widgets/featured_books_h_list_view.dart';
import 'package:my_book_shelf/core/utils/styles.dart';

class FeaturedBooksSection extends StatelessWidget {
  const FeaturedBooksSection({super.key, required this.book});
  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'You may also like',
          style: Styles.textStyle16.copyWith(
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 16),
        FeaturedBooksHListView(),
        const SizedBox(height: 40),
      ],
    );
  }
}
