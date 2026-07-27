import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_book_shelf/Features/home/domain/entities/book_entity.dart';
import 'package:my_book_shelf/Features/home/presentation/views/widgets/book_rating.dart';
import 'package:my_book_shelf/Features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:my_book_shelf/constants.dart';
import 'package:my_book_shelf/core/utils/app_router.dart';
import 'package:my_book_shelf/core/utils/styles.dart';

class BookListViewItem extends StatelessWidget {
  const BookListViewItem({super.key, required this.book});
  final BookEntity book;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kBookDetailsViewPath, extra: book);
      },
      child: SizedBox(
        height: 150,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomBookImage(
                imageUrl: book.image ?? '',
              ),
              const SizedBox(width: 30),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      book.title,
                      softWrap: true,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: Styles.textStyle20.copyWith(
                        fontFamily: kGTSectraFine,
                      ),
                    ),
                    Text(
                      book.authors ?? '',
                      textAlign: TextAlign.start,
                      style: Styles.textStyle14.copyWith(
                        color: Colors.white.withValues(alpha: 0.7),
                      ),
                    ),

                    Row(
                      children: [
                        Text(
                          'Free',
                          style: Styles.textStyle20.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        BookRating(
                          bookRating:
                              book.rating,
                          count:
                              book.ratingCount,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
