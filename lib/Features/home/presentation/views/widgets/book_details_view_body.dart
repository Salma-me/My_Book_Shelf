import 'package:flutter/material.dart';
import 'package:my_book_shelf/Features/home/presentation/views/widgets/book_details_custom_appbar.dart';
import 'package:my_book_shelf/Features/home/presentation/views/widgets/books_details_section.dart';
import 'package:my_book_shelf/Features/home/presentation/views/widgets/featured_books_section.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

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
                const BookDetailsSection(),

                Expanded(child: const SizedBox(height: 50)),
                const FeaturedBooksSection(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
