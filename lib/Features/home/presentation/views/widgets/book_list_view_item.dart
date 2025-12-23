import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_book_shelf/Features/home/data/models/book_model/book_model.dart';
import 'package:my_book_shelf/Features/home/presentation/views/widgets/book_rating.dart';
import 'package:my_book_shelf/constants.dart';
import 'package:my_book_shelf/core/utils/app_router.dart';
import 'package:my_book_shelf/core/utils/assets.dart';
import 'package:my_book_shelf/core/utils/styles.dart';

class BookListViewItem extends StatelessWidget {
  const BookListViewItem({super.key, required this.book});
  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kBookDetailsViewPath);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 80,
              height: 130,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                    book.volumeInfo?.imageLinks?.thumbnail ?? '',
                  ),
                  // image: AssetImage(Assets.testImage),
                ),
              ),
            ),
            const SizedBox(width: 30),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    book.volumeInfo?.title ?? '',
                    softWrap: true,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: Styles.textStyle20.copyWith(
                      fontFamily: kGTSectraFine,
                    ),
                  ),
                  Text(
                    book.volumeInfo?.authors?.join(', ') ?? '',
                    textAlign: TextAlign.start,
                    style: Styles.textStyle14.copyWith(
                      color: Colors.white.withValues(alpha: 0.7),
                    ),
                  ),

                  Row(
                    children: [
                      Text(
                        '19.99 €',
                        style: Styles.textStyle20.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      const BookRating(),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
