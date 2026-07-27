import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_book_shelf/Features/home/domain/entities/book_entity.dart';
import 'package:my_book_shelf/Features/home/presentation/views/widgets/custom_book_image.dart';

import '../../../../../core/utils/app_router.dart';

class FeaturedBooksHListView extends StatelessWidget {
  const FeaturedBooksHListView({super.key, required this.deviceHeight, required this.books});

  final double deviceHeight;
  final List<BookEntity> books;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: deviceHeight * 0.12,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.zero,
        // physics: NeverScrollableScrollPhysics(),
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: SizedBox(
              height: deviceHeight * 0.11,
              width: MediaQuery.of(context).size.width * 0.17,
              child: GestureDetector(
                onTap: () {
                  GoRouter.of(context).push(
                    AppRouter.kBookDetailsViewPath,
                    extra: books[index],
                  );
                },
                child: CustomBookImage(
                  imageUrl: books[index].image ?? '',
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
