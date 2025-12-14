import 'package:flutter/material.dart';
import 'package:my_book_shelf/Features/home/presentation/views/widgets/best_seller_list_view.dart';
import 'package:my_book_shelf/Features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:my_book_shelf/Features/home/presentation/views/widgets/featured_books_h_page_view.dart';
import 'package:my_book_shelf/core/utils/styles.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const CustomAppBar(),
        const FeaturedBooksHPageView(),
        Padding(
          padding: const EdgeInsets.only(left: 32.0, top: 45, bottom: 20),
          child: const Text('Best Seller', style: Styles.textStyle18),
        ),
        Expanded(child: const BestSellerListView()),
      ],
    );
  }
}
