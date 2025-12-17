import 'package:flutter/material.dart';
import 'package:my_book_shelf/Features/home/presentation/views/widgets/book_details_custom_appbar.dart';
import 'package:my_book_shelf/Features/home/presentation/views/widgets/book_details_custom_image.dart';
import 'package:my_book_shelf/Features/home/presentation/views/widgets/book_rating.dart';
import 'package:my_book_shelf/constants.dart';
import 'package:my_book_shelf/core/utils/styles.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        children: [
          const BookDetailsCustomAppbar(),
          const BookDetailsCustomImage(),
          const SizedBox(height: 20),
          Text(
            'The Jungle Book',
            style: Styles.textStyle30.copyWith(
              fontFamily: kGTSectraFine,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Rudyard Kipling',
            textAlign: TextAlign.start,
            style: Styles.textStyle14.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const BookRating(),
        ],
      ),
    );
  }
}
