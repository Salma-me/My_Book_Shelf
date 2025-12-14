import 'package:flutter/material.dart';
import 'package:my_book_shelf/Features/home/presentation/views/widgets/best_seller_item.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 5,
      itemBuilder: (context, index) => const BestSellerItem(),
    );
  }
}
