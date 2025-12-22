import 'package:flutter/material.dart';
import 'package:my_book_shelf/Features/home/presentation/views/widgets/newest_books_list_view.dart';
import 'package:my_book_shelf/Features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:my_book_shelf/Features/home/presentation/views/widgets/featured_books_h_page_view.dart';
import 'package:my_book_shelf/core/utils/styles.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const CustomAppBar(),
                const FeaturedBooksHPageView(),
                Padding(
                  padding: const EdgeInsets.only(top: 45, bottom: 20),
                  child: const Text('Best Seller', style: Styles.textStyle18),
                ),
              ],
            ),
          ),
        ),
        SliverFillRemaining(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: NewestBooksListView(),
          ),
        ),
      ],
    );
  }
}
