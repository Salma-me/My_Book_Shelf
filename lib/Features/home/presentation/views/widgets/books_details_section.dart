import 'package:flutter/material.dart';
import 'package:my_book_shelf/Features/home/presentation/views/widgets/book_details_actions.dart';
import 'package:my_book_shelf/Features/home/presentation/views/widgets/book_rating.dart';
import 'package:my_book_shelf/Features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:my_book_shelf/constants.dart';
import 'package:my_book_shelf/core/utils/styles.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.3,
          width: MediaQuery.of(context).size.width * 0.42,
          child: CustomBookImage(imageUrl: '',),
        ),
        // AspectRatio(aspectRatio: 2.7 / 4, child: CustomBookItem()),
        const SizedBox(height: 43),
        Text(
          'The Jungle Book',
          style: Styles.textStyle30.copyWith(
            fontFamily: kGTSectraFine,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          'Rudyard Kipling',
          textAlign: TextAlign.start,
          style: Styles.textStyle14.copyWith(
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.italic,
            color: Colors.white.withValues(alpha: 0.7),
          ),
        ),
        const SizedBox(height: 7),
        const BookRating(),
        const SizedBox(height: 18),
        const BookDetailsActions(),
      ],
    );
  }
}
