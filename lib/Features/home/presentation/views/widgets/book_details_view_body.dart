import 'package:flutter/material.dart';
import 'package:my_book_shelf/Features/home/data/models/book_model/book_model.dart';
import 'package:my_book_shelf/Features/home/presentation/views/widgets/book_details_custom_appbar.dart';
import 'package:my_book_shelf/Features/home/presentation/views/widgets/books_details_section.dart';
import 'package:my_book_shelf/Features/home/presentation/views/widgets/featured_books_section.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.book});
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              children: [
                const BookDetailsCustomAppbar(),
                BookDetailsSection(book: book),

                Expanded(child: const SizedBox(height: 50)),
                FeaturedBooksSection(book: book),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
